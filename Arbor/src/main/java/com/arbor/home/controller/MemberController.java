package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.dao.MemberDAOImp;
import com.arbor.home.service.MemberServiceImp;
import com.arbor.home.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject
	MemberServiceImp memberService;
	
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
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("/memberSearch")
	public String member() {
		return "admin/member/memberAdminSearch";
	}
	
	//0426아이디체크 매핑
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
	
}