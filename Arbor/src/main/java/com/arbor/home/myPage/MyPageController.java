package com.arbor.home.myPage;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	@Autowired
	SqlSession sqlSession;
	
	//마이페이지 구매내역
	@RequestMapping("purchaseList")
	public ModelAndView purchaseList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("client/myPage/myPageMain");
		return mav;
	}
	
}
