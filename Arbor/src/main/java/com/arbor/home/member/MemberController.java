package com.arbor.home.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/memberSearch")
	public String membersearch() {
		return "member/memberSearch";
	}
	
	@RequestMapping("/memberSlide")
	public String memberslide() {
		return "member/memberSlide";
	}
	
}
