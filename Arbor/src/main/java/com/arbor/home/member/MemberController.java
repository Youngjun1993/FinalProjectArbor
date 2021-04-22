package com.arbor.home.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/login")
	public String loginForm() {
		return "admin/member/login";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
		
		return "admin/member/memberJoin";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) {
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO logVO = dao.loginCheck(vo);
		
		ModelAndView mav = new ModelAndView();
		if(logVO==null) {//로그인실패
			System.out.println("로그인 실패");
			mav.setViewName("redirect:login");
		}else {//로그인성공
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logName", logVO.getUsername());
			System.out.println(logVO.getUsername() + "님 로그인 성공");
			mav.setViewName("redirect:/");
		}
		  
		return mav;
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
	
}
