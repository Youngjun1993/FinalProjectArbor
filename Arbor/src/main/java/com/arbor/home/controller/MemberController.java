package com.arbor.home.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arbor.home.service.MemberServiceImp;
import com.arbor.home.vo.MemPagingCri;
import com.arbor.home.vo.MemPagingDTO;
import com.arbor.home.vo.MemberDormantVO;
import com.arbor.home.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject
	MemberServiceImp memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	//로그인 폼 이동
	@RequestMapping("/login")
	public String loginForm() {
		return "admin/member/login";
	}
	
	//로그인확인버튼
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO logVO = memberService.loginCheck(vo);
		
		if(logVO==null || vo.getMemstat()!=0) {//로그인실패
			System.out.println("로그인 실패");
			rttr.addFlashAttribute("msg", "failed");
			mav.setViewName("redirect:login");
		}else if(logVO.getUserid().equals("admin")){//관리자 로그인성공
			session.setAttribute("logId", logVO.getUserid());//로그아웃값으로 가져갈 logId
			session.setAttribute("logName", logVO.getUsername());
			rttr.addFlashAttribute("msg", "admin");
			mav.setViewName("redirect:memberSearch");
		}else {//사용자로그인성공
			session.setAttribute("logId", logVO.getUserid());//로그아웃값으로 가져갈 logId
			session.setAttribute("logName", logVO.getUsername());
			mav.setViewName("redirect:/");
			System.out.println("로그아이디 = " + logVO.getUserid());
			System.out.println("사용자이름 = " + logVO.getUsername());
		}
		
		return mav;
	}

	//회원가입폼 이동 
	@RequestMapping("/joinform")
	public String joinForm() {
		
		return "admin/member/joinForm";
	}
	
	//회원가입
	@RequestMapping("/memberJoin")
	public ModelAndView memberJoin(MemberVO vo, HttpServletRequest req) { 
		
		int cnt = memberService.memberInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		
		try {
		if(cnt>0) {
			System.out.println("가입완료");
			mav.setViewName("redirect:joinok");
		}else {
			System.out.println("폼입력 에러");
			mav.setViewName("redirect:joinForm");
		}
		}catch(Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		
		return mav;
		
	}
	
	@RequestMapping("/pwdchange")
	public String pwdcChange() {
		
		return "admin/member/memberPwdSearch";
	}
	
	@RequestMapping("/idsearch")
	public String idSearch() {
		
		return "admin/member/memberIdSearch";
	}
	
	@RequestMapping("/joinok")
	public String joinOk() {
		
		return "admin/member/joinOk";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//세션아웃 값을 넘겨줘야함 디비?
		long logoutTime =session.getLastAccessedTime();

		DateFormat df = new SimpleDateFormat("YYYYMMddHHmmss");
		//세션 아이디와 DB에 넣어줄 시간을 구함
		String nowId = (String)session.getAttribute("logId");
		String lastDate = df.format(logoutTime);
		
		//세션 아이디에 lastDate 업데이트 해줌
		int cnt = memberService.lastDateUpdate(lastDate, nowId);
		
		if(cnt>0) {
			System.out.println(lastDate);
			System.out.println("세션 아이디 = " + nowId);
			System.out.println("세션타임 업데이트 완료");
			session.removeAttribute("logId");
			session.removeAttribute("logName");
		}
		
		return "home";
	}
	
    
	//////////////////////////////////로그인 영역 //////////////////////////////////////////
	//중복아이디 체크
	@RequestMapping("/idcheck")
	public String asdfasdf(HttpServletRequest req) {

		//DB조회 : id가 있는 지 없는지 결과들고 view로 간다
		String userid = req.getParameter("userid");
		
		int result = memberService.idCheck(userid);
		
		if(result != 0) {//있는아이디
			req.setAttribute("userid", userid);
			req.setAttribute("checkResult", "N");
		} else {//없는아이디
			req.setAttribute("userid", userid);
			req.setAttribute("checkResult", "Y");
		}
		
		System.out.println(result);
		//request 객체에 필요한 데이터를 저장 후 뷰페이지로 이동
		
		return "admin/member/idCheck";
	}
	
	//이메일 인증
	@ResponseBody
    @RequestMapping("/mailcheck")
    public String mailCheckGET(String email){//나중에 반환타입 String
        
        /* 뷰로부터 넘어온 데이터 확인 */
       System.out.println("이메일 데이터 전송 확인");
       System.out.println("뷰에서 넘어온 이메일 값 : " + email);
       
       //인증번호 생성
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
       
       System.out.println("인증번호 = " + checkNum);
       
       //이메일 보내기
       String sender = "emailarbor@gmail.com";//메일을 보낼 관리자계정
       String toMail = email;//뷰에서 가져온 인증번호 받을 이메일 값
       String title = "Arbor 회원가입 인증 이메일 입니다.";
       String content = 
               "Arbor를 방문해주셔서 감사합니다." +
               "<br><br>" + 
               "인증 번호는 <b>" + checkNum + "</b> 입니다.(인증번호를 타인에게 노출하지 마세요)" + 
               "<br>" + 
               "해당 인증번호를 인증번호 확인란에 기입하여 주세요. 감사합니다";
       
       try {
           
           MimeMessage message = mailSender.createMimeMessage();
           MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
           helper.setFrom(sender);
           helper.setTo(toMail);
           helper.setSubject(title);
           helper.setText(content,true);
           mailSender.send(message);
           
       }catch(Exception e) {
           e.printStackTrace();
       }
      
      String num = Integer.toString(checkNum);
      
      return num;
      
    }
    
    //Recaptcha 자바
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6LeRXsgaAAAAAJJvfONVdEQrHl9Q6Ex90bzU6zv6");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    System.out.println("캡챠 응답 값"  + gRecaptchaResponse);
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
	    	   System.out.println("캡차 통과 0 반환");
	    	   return 0;
	          } // 성공
	       		else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
    
    //포스트방식 비밀번호 가져오기
    @ResponseBody
    @RequestMapping("/pwdCheck")
    //매개변수 ajax param, session
    //유저아이디가 
	public int pwdCheck(@RequestParam(value = "pwdCheck[]") List<String> arr, HttpSession session) {
    	int result = 0;
    	
    	String logId = (String)session.getAttribute("logId");
    	MemberVO vo = memberService.pwdCheck(logId);
    	String userpwd = vo.getUserpwd();
    	String inputpwd = arr.get(0);
    	
    	/*System.out.println("세션아이디 = " + logId);
		System.out.println("vo에 담긴 =" + userpwd);
		System.out.println("ajax에서 배열로 가져온 값 = " + inputpwd);
		 */
    	//배열로 전달한 값과 vo의 pwd를 비교한다
    	if(userpwd.equals(inputpwd)) {
    		System.out.println("비밀번호 일치");
    		result = 1;
    	}else {
    		System.out.println("비밀번호 불일치");
    		result = 0;
    	}
		return result;
	}
	
	///////////////////////////////////회원 검색 영역 ////////////////////////////////////////////
	//회원 전체검색 및 페이징
	@RequestMapping("/memberSearch")
	public ModelAndView memberSearchList(MemPagingCri cri) {
	
		ModelAndView mav = new ModelAndView();
		
		System.out.println("테스트페이지 값 = " + cri.getPageNum());
		
		int cnt= memberService.memCount(cri);
		//페이징용 VO 객체생성
		MemPagingDTO pageMaker = new MemPagingDTO(cri, cnt);
		//modelandview에 list변수로 페이징 데이터 넣어주기 
		mav.addObject("list", memberService.memSearchPaging(cri));
		
		System.out.println("카테고리 ="+cri.getType());
		System.out.println("검색어 ="+cri.getSearchWord());
		
		mav.addObject("pageMaker", pageMaker);//전체데이터가 담긴 memberVO 객체
		
		mav.setViewName("admin/member/memberAdminSearch");
		
	return mav;
	}
	
	//휴면회원 처리
	@RequestMapping("/memDormant")
	public ModelAndView memDormant(String userid) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = memberService.memDormant(userid);
		
		//휴면테이블에 휴면계정데이터 삽입
		memberService.insertDormantMember(userid, "관리자");
		
		
		if(cnt>0) {
			System.out.println("휴면처리 완료");
			mav.setViewName("redirect:memberSearch");
		}else {
			System.out.println("휴면처리 실패");
			mav.setViewName("redirect:memberSearch");
		}
		
		return mav;
	}
	
	//회원삭제
	@RequestMapping("/memDel")
	public ModelAndView memDel(String userid) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = memberService.memDel(userid);
		memberService.insertByeMemberMulti(userid, "관리자삭제");
		
		
		if (cnt>0) {//삭제
		mav.setViewName("redirect:memberSearch");
		}else {//삭제 실패
		System.out.println("삭제실패");
		mav.setViewName("redirect:memberSearch");
		}
		
		return mav;
	}
	
	//다중삭제
	@ResponseBody
	@RequestMapping("/memMultiDel")
	public int memMultiDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;
		
		System.out.println(chArr.size());
		///////수정중
		for (int i=0; i<chArr.size(); i++) {
			memberService.memMultiDel(chArr.get(i));
			int cnt = memberService.insertByeMemberMulti(chArr.get(i), "관리자삭제");
		if(cnt>0) {
			System.out.println("다중삭제 완료");
			}else {
			System.out.println("다중삭제 실패");
			System.out.println(cnt);
			}
		}
		result = 1;
		
		return result;
	}
	
	//////////////////////////////////////마이페이지 수정 탈퇴기능///////////////////////////////////
	//회원탈퇴확인
	@ResponseBody
	@RequestMapping("/memberGoodbye")
	public int memberGoodbye (@RequestParam("reason") String reason, HttpSession session) {
		//requestParam()의 속성명은 뷰 ajax에서 data로 넘겨준 속성명 
		int result = 0;
		String nowId = (String)session.getAttribute("logId");
		
		//컨트롤러에서 dao호출해서 member테이블 업데이트하고 byemember테이블에 insert문을 추가해준다.
		int cnt1 = memberService.memberQuit(nowId);
		int cnt2 = memberService.insertByeMember(nowId, reason);
		
		if(cnt1>0 && cnt2>0) {
			session.removeAttribute("logId");
			session.removeAttribute("logName");
			result = 1;
			return result;
		}else {
			result = 0;
			return result;
		}
	//새로운 페이지 반환
	}
    
	//회원정보 수정
	@RequestMapping("/memberUpdateOk")
	public ModelAndView memberUpdateOk (MemberVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String nowId = (String)session.getAttribute("logId");
		System.out.println("세션입력전 vo 유저아이디" + vo.getUserid());
		vo.setUserid(nowId);
		System.out.println("수정시 vo 유저아이디" + vo.getUserid());
		
		int cnt = memberService.memberUpdateOk(vo);
		if(cnt>0) {
			System.out.println("가입완료");
			mav.setViewName("redirect:/");
		}else {
			System.out.println("폼입력 에러");
			mav.setViewName("redirect:memberUpdate");
		}
		
		return mav;
	}
	
	//////////////////////////// 휴면 회원 영역 ////////////////////////////////
	//휴면회원 검색창 이동
	@RequestMapping("/memberAdminDormant")
	public ModelAndView memberAdminDormant(MemPagingCri cri) {
		
		ModelAndView mav = new ModelAndView();
		int cnt= memberService.memDormantCount(cri);
		
		System.out.println(cnt);
		//페이징용 VO 객체생성
		MemPagingDTO pageMaker = new MemPagingDTO(cri, cnt);
		
		List<MemberDormantVO> vo = memberService.memDormantPaging(cri);
		
		mav.addObject("list", vo);
		mav.addObject("pageMaker", pageMaker);//전체데이터가 담긴 memberVO 객체
		mav.setViewName("admin/member/memberAdminDormant");
	
		
		return mav;
	}
	
	@RequestMapping("/sendDormantMail")
	public ModelAndView sendDormantMail(String email, String userid){//나중에 반환타입 String
        
        /* 뷰로부터 넘어온 데이터 확인 */
       System.out.println("이메일 데이터 전송 확인");
       System.out.println("뷰에서 넘어온 이메일 값 : " + email);
       
       ModelAndView mav = new ModelAndView();
       
       
       //인증번호 생성
       /*
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
       
       System.out.println("인증번호 = " + checkNum);
       */
       //이메일 보내기
       String sender = "emailarbor@gmail.com";//메일을 보낼 관리자계정
       String toMail = email;//뷰에서 가져온 인증번호 받을 이메일 값
       String title = "Arbor 휴면계정 알림 메일입니다";
       String content = 
    		   "귀하의 계정이 휴면상태가 되었습니다." +
    				   "<br/>" +
    				   "다시 <span style =\"color:green;\"> <i>Arbor</i> </span> 의 회원으로 돌아오시길 원하시면" + 
    				   "<br/>" + 
    				   "<a href=\"http://localhost:9090/home/\">이쪽</a> 의 링크로 접속해주시면 됩니다. 다시뵙길 기대하겠습니다. 감사합니다.";
       
       try {
           
           MimeMessage message = mailSender.createMimeMessage();
           MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
           helper.setFrom(sender);
           helper.setTo(toMail);
           helper.setSubject(title);
           helper.setText(content,true);
           mailSender.send(message);
           
       }catch(Exception e) {
           e.printStackTrace();
       }
      
       //여기서 쿼리문으로 메일발송여부를 Y로 바꿔버려
       int cnt = memberService.dormantmailsend(userid);
       
       if(cnt>0) {
    	   System.out.println("휴면메일 발송 처리 완료");
    	   mav.setViewName("redirect:memberAdminDormant");
       }else {
    	   System.out.println("휴면메일 발송 처리 실패");
    	   mav.setViewName("redirect:memberAdminDormant");
       }
      
      return mav;
      
    }
	
	//휴면 다중삭제
	@ResponseBody
	@RequestMapping("/dormantMultiDel")
	public int dormantMultiDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;
		System.out.println("체크박스 체크 개수" +chArr.size());
		
		
		for (int i=0; i<chArr.size(); i++) {
			memberService.dormantMultiDel(chArr.get(i));
			int cnt = memberService.insertByeMemberMulti(chArr.get(i), "관리자삭제");
		if(cnt>0) {
			System.out.println("다중삭제 완료");
			}else {
			System.out.println("다중삭제 실패");
			System.out.println(cnt);
			}
		}
		result = 1;
		
		return result;
	}
	
	//////////////////// 탈퇴회원 영역 /////////////////////

	//탈퇴회원 검색창 이동
	@RequestMapping("/memberAdminQuit")
	public ModelAndView memberAdminQuit(MemPagingCri cri) {
	
		ModelAndView mav = new ModelAndView();
		
		System.out.println("테스트페이지 값 = " + cri.getPageNum());
		
		int cnt= memberService.memQuitCount(cri);
		//페이징용 VO 객체생성
		MemPagingDTO pageMaker = new MemPagingDTO(cri, cnt);
		//modelandview에 list변수로 페이징 데이터 넣어주기 
		mav.addObject("list", memberService.memQuitPaging(cri));
		
		System.out.println("카테고리 ="+cri.getType());
		System.out.println("검색어 ="+cri.getSearchWord());
		
		mav.addObject("pageMaker", pageMaker);//
		mav.setViewName("admin/member/memberAdminQuit");
		
		return mav;
	
	}
	
	//탈퇴 페이지 다중삭제
	@ResponseBody
	@RequestMapping("/permanantDel")
	public int permanantDel(@RequestParam(value = "memberChk[]") List<String> chArr) {
		int result = 0;
		
		System.out.println(chArr.size());
		
		for (int i=0; i<chArr.size(); i++) {
			int cnt = memberService.permanantDel(chArr.get(i));
		if(cnt>0) {
			System.out.println("다중삭제 완료");
			}else {
			System.out.println("다중삭제 실패");
			System.out.println(cnt);
			}
		}
		result = 1;
		
		return result;
	}
	
	//탈퇴 페이지 개별삭제
		@RequestMapping("/quitDel")
		public ModelAndView quitDel(String userid) {
			ModelAndView mav = new ModelAndView();
			
			int cnt = memberService.memDel(userid);
			memberService.permanantDel(userid);
			
			if (cnt>0) {//삭제
			mav.setViewName("redirect:memberAdminQuit");
			}else {//삭제 실패
			System.out.println("삭제실패");
			mav.setViewName("redirect:memberAdminQuit");
			}
			
			return mav;
		}
}