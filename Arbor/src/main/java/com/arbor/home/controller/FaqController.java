package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.FaqServiceImp;
import com.arbor.home.vo.FaqVO;
import com.arbor.home.vo.NoticeVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class FaqController {
	@Inject
	FaqServiceImp faqService;
	
	//faq게시판
	@RequestMapping("/faqList")
	public ModelAndView faqList(PageSearchVO pageVo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr!=null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVo.setSearchKey(req.getParameter("searchKey"));
		pageVo.setSearchWord(req.getParameter("searchWord"));
		
		pageVo.setTotalRecord(faqService.totalRecord(pageVo));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqlist",faqService.faqList(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("client/faq/faqList");
		System.out.println(faqService.faqList(pageVo).size());
		return mav;
	}
	
	//admin
	@RequestMapping("/faqAdList")
	public ModelAndView faqAdList(PageSearchVO pageVo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr!=null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVo.setSearchKey(req.getParameter("searchKey"));
		pageVo.setSearchWord(req.getParameter("searchWord"));
		
		pageVo.setTotalRecord(faqService.totalRecord(pageVo));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqAd",faqService.faqList(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/faq/faqAdList");
		System.out.println(faqService.faqList(pageVo).size());
		return mav;
	}
	
	//등록페이지로 보내기
	@RequestMapping("/faqInsert")
	public String noticeInsert() {
			return "admin/faq/faqInsert";
	}
	
	//faq등록하기
	@RequestMapping(value="/faqInsertOk", method=RequestMethod.POST)
	public ModelAndView faqInsertOk(FaqVO vo) {

		ModelAndView mav = new ModelAndView();
		if(faqService.faqInsert(vo)>0) {//글등록
			 mav.setViewName("redirect:faqAdList");
		 }else {
			 mav.setViewName("redirect:faqAdList");
		 }
		 return mav;
	}
	
	@RequestMapping("/faqEdit")//수정페이지로 이동
	public ModelAndView faqEdit(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("faqEdit", faqService.faqselect(no));
		mav.setViewName("admin/faq/faqEdit");
		
		return mav;
	}
	
	//faq수정하기
	@RequestMapping("/faqEditOk")
	public ModelAndView faqEditOk(FaqVO vo) {
		ModelAndView mav = new ModelAndView();
		if(faqService.faqEditOk(vo)>0) {
			mav.addObject("no", vo.getFaqno());
			mav.setViewName("redirect:faqAdList");
		}else {
			mav.setViewName("redirect:faqEdit");
		}
		return mav;
	}
	
	//faq삭제하기
	@RequestMapping("/faqDel")
	public ModelAndView faqDel(int no) {
		ModelAndView mav = new ModelAndView();
		
		if(faqService.faqDel(no)>0) {
			mav.setViewName("redirect:faqAdList");
		}else {
			mav.setViewName("redirect:faqAdList");
		}
		return mav;
	}
	
}
