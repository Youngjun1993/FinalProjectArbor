package com.arbor.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arbor.home.service.MemberServiceImp;
import com.arbor.home.vo.MemPagingCri;
import com.arbor.home.vo.MemPagingDTO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class MemberController {

	@Inject
	MemberServiceImp memberService;

	@Inject
	private JavaMailSender mailSender;

	// 로그인 폼 이동
	@RequestMapping("/login")
	public String loginForm() {
		return "admin/member/login";
	}

	// 로그인확인버튼
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session, RedirectAttributes rttr) {

		ModelAndView mav = new ModelAndView();
		MemberVO logVO = memberService.loginCheck(vo);

		if (logVO == null || logVO.getMemstat() == 2) {// 로그인실패
			//System.out.println("로그인 실패");
			rttr.addFlashAttribute("msg", "failed");
			mav.setViewName("redirect:login");
		} else if (logVO.getUserid().equals("admin")) {// 관리자 로그인성공
			session.setAttribute("logId", logVO.getUserid());// 로그아웃값으로 가져갈 logId
			session.setAttribute("logName", logVO.getUsername());
			rttr.addFlashAttribute("msg", "admin");

			/* 휴면회원 테이블로 90일경과 회원 넘기기 */
			List<MemberVO> list90 = memberService.dormantList(); // 90일경과 목록(member)
			//System.out.println("등록될 사람 몇명?" + list90.size());
			for (int i = 0; i < list90.size(); i++) {
				MemberVO mvo = list90.get(i);
				String userid = mvo.getUserid();
				memberService.memDormant(userid); // memstat=1로 변경
				memberService.insertDormantMember(userid);
			}

			mav.setViewName("redirect:memberSearch");
		} else {// 사용자로그인성공
			session.setAttribute("logId", logVO.getUserid());// 로그아웃값으로 가져갈 logId
			session.setAttribute("logName", logVO.getUsername());
			memberService.lastDateUpdate(logVO.getUserid()); // lastdate 현재시각으로 update
			if (memberService.loginDorCheck(logVO.getUserid()) > 0) {
				memberService.loginDorDelete(logVO.getUserid());
				memberService.loginDorUpdate(logVO.getUserid());
			}

			mav.setViewName("redirect:/");
			//System.out.println("로그아이디 = " + logVO.getUserid());
			//System.out.println("사용자이름 = " + logVO.getUsername());
		}

		return mav;
	}

	// 회원가입폼 이동
	@RequestMapping("/joinform")
	public String joinForm() {

		return "admin/member/joinForm";
	}

	// 회원가입
	@RequestMapping("/memberJoin")
	public ModelAndView memberJoin(MemberVO vo, HttpServletRequest req) {

		int cnt = memberService.memberInsert(vo);

		ModelAndView mav = new ModelAndView();

		try {
			if (cnt > 0) {
				//System.out.println("가입완료");
				mav.setViewName("redirect:joinok");
			} else {
				//System.out.println("폼입력 에러");
				mav.setViewName("redirect:joinForm");
			}
		} catch (Exception e) {
			//System.out.println("에러");
			e.printStackTrace();
		}

		return mav;

	}

	@RequestMapping("/joinok")
	public String joinOk() {

		return "admin/member/joinOk";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession ses) {
		/*
		 * //세션아웃 값을 넘겨줘야함 디비? long logoutTime =session.getLastAccessedTime();
		 * 
		 * DateFormat df = new SimpleDateFormat("YYYYMMddHHmmss"); //세션 아이디와 DB에 넣어줄 시간을
		 * 구함 String nowId = (String)session.getAttribute("logId"); String lastDate =
		 * df.format(logoutTime);
		 * 
		 * 
		 * //세션 아이디에 lastDate 업데이트 해줌 int cnt = memberService.lastDateUpdate(lastDate,
		 * nowId);
		 * 
		 * if(cnt>0) { System.out.println(lastDate); System.out.println("세션 아이디 = " +
		 * nowId); System.out.println("세션타임 업데이트 완료"); session.removeAttribute("logId");
		 * session.removeAttribute("logName"); }
		 */

		// 세션에서 아이디랑 네임 빼기
		ses.removeAttribute("logId");
		ses.removeAttribute("logName");

		return "home";
	}

	///////////////////////// 아이디 찾기
	@RequestMapping("/idsearch")
	public String idSearch() {
		return "admin/member/memberIdSearch";
	}

	// 아이디 찾기 로직
	@ResponseBody
	@RequestMapping("/memberIdSearchOk")
	public List<String> memberIdSearchOk(@RequestParam(value = "idCheck[]") List<String> arr, Model model) {
		// 넘어온값을 셀렉트로 아이디구하기
		String username = arr.get(0);
		String email = arr.get(1);

		// 매개변수가 VO타입이아니면 param1,param2로...
		MemberVO vo = memberService.memberIdSearchOk(username, email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		System.out.println("인증번호 = " + checkNum);


		// 이메일 보내기
		String sender = "emailarbor@gmail.com";// 메일을 보낼 관리자계정
		String toMail = email;// 뷰에서 가져온 인증번호 받을 이메일 값
		String title = "Arbor 인증번호 메일";
		String content = "인증번호가 발급되었습니다." + "<br/>" + "인증번호는 <span style =\"color:green;\"> <i>" + checkNum
				+ "</i> </span> 입니다." + "<br/>"
				+ "인증번호를 타인에게 노출시키지 마세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(sender);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		 

		// 휴면계정? 탈퇴계정 구분?

		// 리턴은?? 리턴할 아이디 값과 이메일 인증값을 List에 넣기
		String needId = vo.getUserid();
		//System.out.println(needId);
		String validateNum = checkNum + "";

		List<String> rtnList = new ArrayList<String>();
		rtnList.add(0, needId);
		rtnList.add(1, validateNum);

		//System.out.println(rtnList.get(0) + " ///////////확인번호 =" + rtnList.get(1));

		// ajax에서 리턴값을 활용해야할때는 json으로...?
		return rtnList;
	}

	// get방식 문자api 로 보내기
	@RequestMapping("/smsOk")
	public String smsOk() {

		return "admin/member/smsgo";
	}

	// 비밀번호 찾기 인증번호 sms로 보내기
	@RequestMapping("/sms_validate")
	public String sms_validate() {

		return "admin/member/sms_val";
	}

	// sms로 아이디 찾기
	@ResponseBody
	@RequestMapping("/memberIdSearchOk2")
	public List<String> memberIdSearchOk2(@RequestParam(value = "idCheck[]") List<String> arr) {

		/*
		 * 겟방식 String username = req.getParameter("sms_username"); //겟파라미터로 바꾸자 String
		 * tel = req.getParameter("fulltel");
		 * 
		 * System.out.println("겟방식 유저이름" + username); System.out.println("전화번호" + tel);
		 */
		// 넘어온값을 셀렉트로 아이디구하기
		String username = arr.get(0);
		String tel = arr.get(1);

		// 매개변수가 VO타입이아니면 param1,param2로...
		MemberVO vo = memberService.memberIdSearchOk2(username, tel);

		// 인증번호용
		UUID uuid = UUID.randomUUID();

		// 넘어온값을 셀렉트로 아이디구하기
		String beforeSubstr = uuid.toString();
		String validateNum = beforeSubstr.substring(0, 7);

		// 휴면계정? 탈퇴계정 구분?

		// 리턴은?? 리턴할 아이디 값과 이메일 인증값을 List에 넣기
		String needId = vo.getUserid();
		//System.out.println(needId);

		List<String> rtnList = new ArrayList<String>();
		rtnList.add(0, needId);
		rtnList.add(1, validateNum);

		//System.out.println(rtnList.get(0) + " ///////////확인번호 =" + rtnList.get(1));

		// ajax에서 리턴값을 활용해야할때는 json으로...?
		return rtnList;

	}

	@RequestMapping("/pwdSearch")
	public String pwdcChange() {

		return "admin/member/memberPwdSearch";
	}

	// 비밀번호 찾기
	// 임시비번전송
	@ResponseBody
	@RequestMapping("/memberPwdSearchOk")
	public int memberPwdSearchOk(@RequestParam(value = "idCheck[]") List<String> arr, Model model) {
		int result = 0;

		UUID uuid = UUID.randomUUID();

		// 넘어온값을 셀렉트로 아이디구하기

		String userid = arr.get(0);

		String email = arr.get(1);
		String beforeSubstr = uuid.toString();

		String changepwd = beforeSubstr.substring(0, 7);

		// update문 실행시 cnt증가
		int cnt = memberService.memberPwdSearchOk(changepwd, userid, email);

		if (cnt > 0) {
			result = 1;
		} else {
			result = 0;
		}

		//System.out.println("넘어온 아이디 = " + userid);
		//System.out.println("넘어온 이메일 = " + email);

		//System.out.println("인증번호 = " + changepwd);

		// 이메일 보내기
		String sender = "emailarbor@gmail.com";// 메일을 보낼 관리자계정
		String toMail = email;// 뷰에서 가져온 인증번호 받을 이메일 값
		String title = "Arbor 임시비밀번호 메일";
		String content = "임시비밀번호가 발급되었습니다." + "<br/>" + "임시 비밀번호는 <span style =\"color:green;\"> <i>" + changepwd
				+ "</i> </span> 입니다." + "<br/>"
				+ "<a href=\"http://localhost:9090/home/login\">이쪽</a> 으로 로그인해서 접속후 새로운 비밀번호로 변경해주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(sender);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// ajax에서 리턴값을 활용해야할때는 json으로...?
		return result;
	}

	// sms로 비번 찾기
	@ResponseBody
	@RequestMapping("/memberPwdSearchOk2")
	public String memberPwdSearchOk2(@RequestParam(value = "idCheck[]") List<String> arr) {
		String result = "";

		UUID uuid = UUID.randomUUID();

		// 넘어온값을 셀렉트로 아이디구하기

		String userid = arr.get(0);
		String tel = arr.get(1);

		String beforeSubstr = uuid.toString();

		String changepwd = beforeSubstr.substring(0, 7);

		// 넘어온값을 셀렉트로 아이디구하기

		// 매개변수가 VO타입이아니면 param1,param2로...
		int cnt = memberService.memberPwdSearchOk2(changepwd, userid, tel);

		// 바뀐비번
		//System.out.println(cnt);
		//System.out.println("바뀐비번 = " + changepwd);

		if (cnt > 0) {
			result = changepwd;
			//System.out.println("업데이트문 실행");
		}

		return result;
	}

	////////////////////////////////// 로그인 영역
	////////////////////////////////// //////////////////////////////////////////
	// 중복아이디 체크
	@RequestMapping("/idcheck")
	public String asdfasdf(HttpServletRequest req) {

		// DB조회 : id가 있는 지 없는지 결과들고 view로 간다
		String userid = req.getParameter("userid");

		int result = memberService.idCheck(userid);

		if (result != 0) {// 있는아이디
			req.setAttribute("userid", userid);
			req.setAttribute("checkResult", "N");
		} else {// 없는아이디
			req.setAttribute("userid", userid);
			req.setAttribute("checkResult", "Y");
		}

		//System.out.println(result);
		// request 객체에 필요한 데이터를 저장 후 뷰페이지로 이동

		return "admin/member/idCheck";
	}

	// 이메일 인증
	@ResponseBody
	@RequestMapping("/mailcheck")
	public int mailCheckGET(String email) {// 나중에 반환타입 String
		int result = 0;
		
		/* 뷰로부터 넘어온 데이터 확인 */
		//System.out.println("이메일 데이터 전송 확인");
		//System.out.println("뷰에서 넘어온 이메일 값 : " + email);

		// 인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		//System.out.println("인증번호 = " + checkNum);

		// 이메일 보내기
		String sender = "emailarbor@gmail.com";// 메일을 보낼 관리자계정
		String toMail = email;// 뷰에서 가져온 인증번호 받을 이메일 값
		String title = "Arbor 회원가입 인증 이메일 입니다.";
		String content = "Arbor를 방문해주셔서 감사합니다." + "<hr/><br><br>" + "인증 번호는 <b>" + checkNum
				+ "</b> 입니다.(인증번호를 타인에게 노출하지 마세요)" + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요. 감사합니다";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(sender);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			result = checkNum;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	// Recaptcha 자바
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey("6LeRXsgaAAAAAJJvfONVdEQrHl9Q6Ex90bzU6zv6");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		//System.out.println("캡챠 응답 값" + gRecaptchaResponse);
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {
				//System.out.println("캡차 통과 0 반환");
				return 0;
			} // 성공
			else
				return 1; // 실패
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 에러
		}
	}

	// 포스트방식 비밀번호 가져오기
	@ResponseBody
	@RequestMapping("/pwdCheck")
	// 매개변수 ajax param, session
	public int pwdCheck(@RequestParam(value = "pwdCheck[]") List<String> arr, HttpSession session) {
		int result = 0;

		String logId = (String) session.getAttribute("logId");
		MemberVO vo = memberService.pwdCheck(logId);
		String userpwd = vo.getUserpwd();
		String inputpwd = arr.get(0);

		/*
		 * System.out.println("세션아이디 = " + logId); System.out.println("vo에 담긴 =" +
		 * userpwd); System.out.println("ajax에서 배열로 가져온 값 = " + inputpwd);
		 */
		// 배열로 전달한 값과 vo의 pwd를 비교한다
		if (userpwd.equals(inputpwd)) {
			//System.out.println("비밀번호 일치");
			result = 1;
		} else {
			//System.out.println("비밀번호 불일치");
			result = 0;
		}
		return result;
	}

	/////////////////////////////////// 회원 검색 영역
	/////////////////////////////////// ////////////////////////////////////////////
	// 회원 전체검색 및 페이징
	@RequestMapping("/memberSearch")
	public ModelAndView memberSearchList(MemPagingCri cri) {

		ModelAndView mav = new ModelAndView();

		//System.out.println("테스트페이지 값 = " + cri.getPageNum());

		int cnt = memberService.memCount(cri);
		// 페이징용 VO 객체생성
		MemPagingDTO pageMaker = new MemPagingDTO(cri, cnt);
		// modelandview에 list변수로 페이징 데이터 넣어주기
		mav.addObject("list", memberService.memSearchPaging(cri));

		//System.out.println("카테고리 =" + cri.getType());
		//System.out.println("검색어 =" + cri.getSearchWord());

		mav.addObject("pageMaker", pageMaker);// 전체데이터가 담긴 memberVO 객체

		mav.setViewName("admin/member/memberAdminSearch");

		return mav;
	}

	// 회원삭제
	@RequestMapping("/memDel")
	public ModelAndView memDel(String userid) {
		ModelAndView mav = new ModelAndView();

		int cnt = memberService.insertByeMemberMulti(userid, "관리자삭제");
		int cnt1 = memberService.permanantDel3(userid);

		if (cnt > 0 && cnt1 >0) {// 삭제
			mav.setViewName("redirect:memberSearch");
		} else {// 삭제 실패
			//System.out.println("삭제실패");
			mav.setViewName("redirect:memberSearch");
		}

		return mav;
	}

	// 다중삭제
	@ResponseBody
	@RequestMapping("/memMultiDel")
	public int memMultiDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;

		//System.out.println(chArr.size());
		/////// 수정중
		for (int i = 0; i < chArr.size(); i++) {
			int cnt = memberService.insertByeMemberMulti(chArr.get(i), "관리자삭제");
			int cnt1 = memberService.permanantDel3(chArr.get(i));
			if (cnt > 0 && cnt1 >0) {
			//	System.out.println("다중삭제 완료");
				result = 1;
			} else {
				//System.out.println("다중삭제 실패");
				//System.out.println(cnt);
				result = 0;
			}
		}

		return result;
	}

	////////////////////////////////////// 마이페이지 수정
	////////////////////////////////////// 탈퇴기능///////////////////////////////////
	// 회원탈퇴확인
	@ResponseBody
	@RequestMapping("/memberGoodbye")
	public int memberGoodbye(@RequestParam("reason") String reason, HttpSession session) {
		// requestParam()의 속성명은 뷰 ajax에서 data로 넘겨준 속성명
		int result = 0;
		String nowId = (String) session.getAttribute("logId");
		//System.out.println("세션 아이디" + nowId);
		// 컨트롤러에서 dao호출해서 member테이블 업데이트하고 byemember테이블에 insert문을 추가해준다.
		int cnt2 = memberService.insertByeMember(nowId, reason);
		int cnt1 = memberService.permanantDel3(nowId);
		//System.out.println("탈퇴테이블 삽입" + cnt2);
		//System.out.println("멤버테이블 삭제" + cnt1);
		
		if (cnt1 > 0 && cnt2 > 0) {
			session.removeAttribute("logId");
			session.removeAttribute("logName");
			result = 1;
		} else {
			result = 0;
		}
		// 새로운 페이지 반환
		return result;
	}

	// 회원정보 수정
	@RequestMapping("/memberUpdateOk")
	public ModelAndView memberUpdateOk(MemberVO vo, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		String nowId = (String) session.getAttribute("logId");
		//System.out.println("세션입력전 vo 유저아이디" + vo.getUserid());
		vo.setUserid(nowId);
		//System.out.println("수정시 vo 유저아이디" + vo.getUserid());

		int cnt = memberService.memberUpdateOk(vo);
		if (cnt > 0) {
			//System.out.println("수정완료");
			mav.setViewName("redirect:memberUpdate");
		} else {
			//System.out.println("폼입력 에러");
			mav.setViewName("redirect:memberUpdate");
		}

		return mav;
	}

	//////////////////////////// 휴면 회원 영역 ////////////////////////////////
	// 휴면회원 검색창 이동
	@RequestMapping("/memberAdminDormant")
	public ModelAndView memberAdminDormant(PageSearchVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String pageNumStr = req.getParameter("pageNum");
		if (pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		vo.setTotalRecord(memberService.memDormantCount());

		mav.addObject("list", memberService.memDormantPaging(vo));
		mav.addObject("pageVO", vo);
		mav.setViewName("admin/member/memberAdminDormant");

		return mav;
	}

	@RequestMapping("/sendDormantMail")
	public ModelAndView sendDormantMail(String email, String userid) {// 나중에 반환타입 String

		/* 뷰로부터 넘어온 데이터 확인 */
		//System.out.println("이메일 데이터 전송 확인");
		//System.out.println("뷰에서 넘어온 이메일 값 : " + email);

		ModelAndView mav = new ModelAndView();

		// 인증번호 생성
		/*
		 * Random random = new Random(); int checkNum = random.nextInt(888888) + 111111;
		 * 
		 * System.out.println("인증번호 = " + checkNum);
		 */
		// 이메일 보내기
		String sender = "emailarbor@gmail.com";// 메일을 보낼 관리자계정
		String toMail = email;// 뷰에서 가져온 인증번호 받을 이메일 값
		String title = "Arbor 휴면계정 알림 메일입니다";
		String content = "귀하의 계정이 휴면상태가 되었습니다." + "<br/>"
				+ "다시 <span style =\"color:green;\"> <i>Arbor</i> </span> 의 회원으로 돌아오시길 원하시면" + "<br/>"
				+ "<a href=\"http://localhost:9090/home/\">이쪽</a> 의 링크로 접속해주시면 됩니다. 다시뵙길 기대하겠습니다. 감사합니다.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(sender);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 여기서 쿼리문으로 메일발송여부를 Y로 바꿔버려
		int cnt = memberService.dormantmailsend(userid);

		if (cnt > 0) {
			//System.out.println("휴면메일 발송 처리 완료");
			mav.setViewName("redirect:memberAdminDormant");
		} else {
			//System.out.println("휴면메일 발송 처리 실패");
			mav.setViewName("redirect:memberAdminDormant");
		}
		return mav;
	}

	// 휴면 다중삭제
	@ResponseBody
	@RequestMapping("/dormantMultiDel")
	public int dormantMultiDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;
		//System.out.println("체크박스 체크 개수" + chArr.size());

		for (int i = 0; i < chArr.size(); i++) {
			if (memberService.dormantMultiDel(chArr.get(i)) > 0) {
				if (memberService.loginDorUpdate(chArr.get(i)) > 0) {
					result++;
				}
			}
		}
		return result;
	}

	//////////////////// 탈퇴회원 영역 /////////////////////
	
	
	// 탈퇴회원 검색창 이동
	@RequestMapping("/memberAdminQuit")
	public ModelAndView memberAdminQuit(MemPagingCri cri) {

		ModelAndView mav = new ModelAndView();

		//System.out.println("테스트페이지 값 = " + cri.getPageNum());
		int cnt = memberService.memQuitCount(cri);
		// 페이징용 VO 객체생성
		MemPagingDTO pageMaker = new MemPagingDTO(cri, cnt);
		// modelandview에 list변수로 페이징 데이터 넣어주기
		mav.addObject("list", memberService.memQuitPaging(cri));

		//System.out.println("카테고리 =" + cri.getType());
		//System.out.println("검색어 =" + cri.getSearchWord());

		mav.addObject("pageMaker", pageMaker);//
		mav.setViewName("admin/member/memberAdminQuit");

		return mav;

	}

	// 탈퇴 페이지 다중삭제
	@ResponseBody
	@RequestMapping("/permanantDel")
	public int permanantDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;
		//System.out.println(chArr.size());

		for (int i = 0; i < chArr.size(); i++) {
			int cnt = memberService.permanantDel(chArr.get(i));
			if (cnt > 0) {
				//System.out.println("다중삭제 완료");
				result = 1;
			} else {
				//System.out.println("다중삭제 실패");
				//System.out.println(cnt);
				result = 0;
			}
		}

		return result;
	}

	// 탈퇴 페이지 개별삭제
	@RequestMapping("/quitDel")
	public ModelAndView quitDel(String userid) {
		ModelAndView mav = new ModelAndView();

		int cnt = memberService.permanantDel(userid);
		memberService.permanantDel2(userid);
		memberService.permanantDel3(userid);

		if (cnt > 0) {// 삭제
			mav.setViewName("redirect:memberAdminQuit");
		} else {// 삭제 실패
			//System.out.println("삭제실패");
			mav.setViewName("redirect:memberAdminQuit");
		}

		return mav;
	}

	/////////////////////// sms전송 ///////////////////////
	/*
	 * @RequestMapping("/sendSms") public ModelAndView sendSms(String tel) { //매개변수는
	 * ajax의 배열리스트 //여기서 ModelAndView에 담아서 ajax에서 가져온 데이터 addObject
	 * 
	 * System.out.println(tel + "view에서 get방식으로 넘어온번호"); ModelAndView mav = new
	 * ModelAndView();
	 * 
	 * mav.addObject("receiver", tel); mav.setViewName("admin/member/smsTest");
	 * 
	 * return mav; }
	 */

	@RequestMapping("/sendSms")
	public ModelAndView sendSms(HttpServletRequest request, ModelMap model) {
		// 매개변수는 ajax의 배열리스트
		// 여기서 ModelAndView에 담아서 ajax에서 가져온 데이터 addObject
		ModelAndView mav = new ModelAndView();
		String[] list = request.getParameterValues("smstel");

		// System.out.println(Arrays.toString(list));

		List<String> result = new ArrayList<String>();
		for (int i = 0; i < list.length; i++) {
			// result.add("\""+list[i]+"\"");
			result.add(list[i]);
		}

		mav.addObject("list", result);
		mav.setViewName("admin/member/smsTest");

		return mav;
	}

	//////////////////////// 엑셀 다운로드 ////////////////////////
	@RequestMapping("/excelDownload")
	public void excel(HttpServletResponse response, HttpServletRequest request, MemberVO vo) throws IOException {

		String param = request.getParameter("member");
		String param1 = request.getParameter("dormant");
		String param2 = request.getParameter("quit");

		// xlsx 파일
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("첫번째 시트");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		if (param.equals("Y")) {
			List<MemberVO> list = memberService.memberExcelDownload(vo);
			// Header
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("사용자아이디");
			cell = row.createCell(1);
			cell.setCellValue("사용자이름");
			cell = row.createCell(2);
			cell.setCellValue("이메일");
			cell = row.createCell(3);
			cell.setCellValue("전화번호");
			cell = row.createCell(4);
			cell.setCellValue("가입일");
			
			// Body
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow(rowNum++);
				cell = row.createCell(0);
				cell.setCellValue(list.get(i).getUserid());
				cell = row.createCell(1);
				cell.setCellValue(list.get(i).getUsername());
				cell = row.createCell(2);
				cell.setCellValue(list.get(i).getEmail());
				cell = row.createCell(3);
				cell.setCellValue(list.get(i).getTel());
				cell = row.createCell(4);
				cell.setCellValue(list.get(i).getRegdate());

			}

			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=MEMBERLIST.xlsx");

			// Excel File Output
			wb.write(response.getOutputStream());
			wb.close();

		} else if (param1.equals("Y")) {
			List<MemberVO> list = memberService.dormantExcelDownload(vo);
			// Header
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("사용자아이디");
			cell = row.createCell(1);
			cell.setCellValue("사용자이름");
			cell = row.createCell(2);
			cell.setCellValue("이메일");
			cell = row.createCell(3);
			cell.setCellValue("전화번호");
			cell = row.createCell(4);
			cell.setCellValue("가입일");
			cell = row.createCell(5);
			cell.setCellValue("휴면일");

			// Body
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow(rowNum++);
				cell = row.createCell(0);
				cell.setCellValue(list.get(i).getUserid());
				cell = row.createCell(1);
				cell.setCellValue(list.get(i).getUsername());
				cell = row.createCell(2);
				cell.setCellValue(list.get(i).getEmail());
				cell = row.createCell(3);
				cell.setCellValue(list.get(i).getTel());
				cell = row.createCell(4);
				cell.setCellValue(list.get(i).getRegdate());
				cell = row.createCell(5);
				cell.setCellValue(list.get(i).getDordate());
			}

			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=DORMANTLIST.xlsx");

			// Excel File Output
			wb.write(response.getOutputStream());
			wb.close();

		}

	}

}