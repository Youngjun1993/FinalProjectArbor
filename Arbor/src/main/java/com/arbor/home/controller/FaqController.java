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
}
