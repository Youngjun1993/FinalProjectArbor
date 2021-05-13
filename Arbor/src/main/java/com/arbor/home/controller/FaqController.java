package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.FaqServiceImp;

@Controller
public class FaqController {
	
	@Inject
	FaqServiceImp FaqService;
	
	@RequestMapping("/faqList")
	public ModelAndView faqList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client/faq/faqList");
		return mav;
	}
	
	@RequestMapping("/faqAdList")
	public ModelAndView faqAdList() {
		ModelAndView mav = new ModelAndView();
		
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
