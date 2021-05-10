package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.NoticeServiceImp;
import com.arbor.home.vo.NoticeVO;

@Controller
public class NoticeController {
	@Inject
	NoticeServiceImp NoticeService;
	
	//공지사항 게시판
	@RequestMapping("/noticeList")
	public ModelAndView noticeList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList",NoticeService.noticeList());
		mav.setViewName("client/notice/noticeList");
		System.out.println(NoticeService.noticeList().size());
		return mav;
	}
	
	@RequestMapping("/noticeView")
	public ModelAndView noticeView(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("noticeView",NoticeService.noticeView(no));
		mav.setViewName("client/notice/noticeView");
		
		return mav;
	}

}
