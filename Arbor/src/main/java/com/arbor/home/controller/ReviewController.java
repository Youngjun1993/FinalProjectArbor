package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.ReviewServiceImp;

@Controller
public class ReviewController {
	
	@Inject
	ReviewServiceImp reviewService;
	
	//리뷰 삭제
	@RequestMapping("reviewDel")
	public ModelAndView reviewDel(int reviewno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(reviewService.reviewDelete(reviewno, (String)session.getAttribute("logId"))>0) {
			mav.setViewName("redirect:reviewList");
		}else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	//리뷰 수정
	@RequestMapping("/reviewEditOk")
	public ModelAndView reviewEditOk( HttpSession session, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
	
		
		return mav;
	}
}
