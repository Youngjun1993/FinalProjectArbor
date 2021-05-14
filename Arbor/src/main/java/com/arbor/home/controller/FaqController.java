package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.FaqServiceImp;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class FaqController {
	
	@Inject
	FaqServiceImp FaqService;
	
	@RequestMapping("/faqList")
	public ModelAndView faqList(PageSearchVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(0);
		
		mav.setViewName("client/faq/faqList");
		return mav;
	}
	
	@RequestMapping("/faqAdList")
	public ModelAndView faqAdList(PageSearchVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(0);
		mav.setViewName("admin/faq/faqAdList");
		return mav;
	}
	
	@RequestMapping("/faqWrite")
	public ModelAndView faqWrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/faq/faqWrite");
		return mav;
	}
	
}
