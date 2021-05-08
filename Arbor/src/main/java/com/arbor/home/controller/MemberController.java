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

import com.arbor.home.service.MemberServiceImp;
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
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) {
		
		MemberVO logVO = memberService.loginCheck(vo);
		
		ModelAndView mav = new ModelAndView();
		if(logVO==null && vo.getMemstat()!=0) {//로그인실패
			System.out.println("로그인 실패");
			mav.setViewName("redirect:login");
		}else {//로그인성공
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
	
	//회원 전체검색
	@RequestMapping("/memberSearch")
	public ModelAndView memberSearchList(MemberVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", memberService.memberAllselect(vo));
		mav.setViewName("admin/member/memberAdminSearch");
		
		return mav;
	}
	
	//휴면회원 처리
    @RequestMapping("/memDormant")
    public ModelAndView memDormant(String userid) {
    	ModelAndView mav = new ModelAndView();
    	
    	int cnt = memberService.memDormant(userid);
    	
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
	public int memMultiDel(@RequestParam(value = "memberChk[]") List<String> chArr, MemberVO vo) {
    	int result = 0;
    	
    	System.out.println(chArr.size());
    	///////수정중
		  for (int i=0; i<chArr.size(); i++) {
			 memberService.memMultiDel(chArr.get(i));
		  }
		  result = 1;
		return result;
	}
    
	
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
	
    //회원탈퇴
    @RequestMapping("/memberQuit")
	public String memberQuit() {
		
		return "client/myPage/memberQuit";
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
    
	
}