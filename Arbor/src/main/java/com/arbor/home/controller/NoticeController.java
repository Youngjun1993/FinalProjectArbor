package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	//관리자 - 공지사항관리
	@RequestMapping("/noticeAdminList")
	public ModelAndView noticeEditList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeAdminList",NoticeService.noticeList());
		mav.setViewName("admin/notice/noticeAdminList");
		System.out.println(NoticeService.noticeList().size());
		return mav;
	}
	
	@RequestMapping("/noticeEditView")
	public ModelAndView noticeEditView(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("noticeEditView",NoticeService.noticeView(no));
		mav.setViewName("admin/notice/noticeEditView");
		
		return mav;
	}
	
	@RequestMapping("/noticeInsert")
	public String noticeInsert() {
			return "admin/notice/noticeInsert";
	}
	
	@RequestMapping(value="/noticeInsertOk", method=RequestMethod.POST)
	public ModelAndView boardWriteOk(NoticeVO vo) {

		ModelAndView mav = new ModelAndView();
		if(NoticeService.noticeInsert(vo)>0) {//글등록
			 mav.setViewName("redirect:noticeAdminList");
		 }else {
			 mav.setViewName("redirect:noticeInsert");
		 }
		 return mav;
	}

}
