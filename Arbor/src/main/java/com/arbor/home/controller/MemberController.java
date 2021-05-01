package com.arbor.home.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
		if(logVO==null) {//로그인실패
			System.out.println("로그인 실패");
			mav.setViewName("redirect:login");
		}else {//로그인성공
			session.setAttribute("logId", logVO.getUserid());
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
	@RequestMapping("/memberjoin")
	public ModelAndView memberJoin(MemberVO vo, HttpServletRequest req) { 
		
		/*
		 * vo.setTel1(req.getParameter("tel1")); vo.setTel2(req.getParameter("tel2"));
		 * vo.setTel3(req.getParameter("tel3"));
		 * 
		 * System.out.println(vo.getTel1()+vo.getTel2()+vo.getTel3());
		 * 
		 * vo.setEmaildomain(req.getParameter("emaildomain"));
		 */
		int cnt = memberService.memberInsert(vo);
		
		System.out.println("겟텔 =" + vo.getTel()+ "겟이메일 =" +vo.getEmail());
		
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

		DateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm:ss");
		String lastDate = df.format(logoutTime);
		
		System.out.println(lastDate);
		
		//세션 아이디를 구함
		
		//세션 아이디에 lastDate 업데이트 해줌
		
		session.invalidate();
		
		
		return "home";
	}
	
	
	
	@RequestMapping("/memberSearch")
	public ModelAndView memberSearchList(MemberVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", memberService.memberAllselect(vo));
		
		System.out.println("smsok의 값 = " + vo.getSmsok());
		
		mav.setViewName("admin/member/memberAdminSearch");
		
		return mav;
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
    @RequestMapping("/mailcheck")
    @ResponseBody
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
	
}