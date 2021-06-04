package com.arbor.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.ReviewServiceImp;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ReviewVO;

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
	public ModelAndView reviewEditOk(ReviewVO vo, HttpSession session, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
		int cnt = reviewService.reviewUpdate(vo);
		System.out.println(cnt);
		
		if(cnt>0) {
			mav.setViewName("redirect:reviewList");
		}else {
			mav.setViewName("redirect:reviewList");
		}
		return mav;
	}
	
	// Admin 컨트롤러 //
	@RequestMapping("/reviewAdList")
	public ModelAndView reviewAdList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		String mainno = req.getParameter("mainno");
		String subno = req.getParameter("subno");
		String sort = req.getParameter("sort");
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		if(subno != null) {
			pageVo.setMainno(Integer.parseInt(mainno));
			pageVo.setSubno(Integer.parseInt(subno));
		}
		if(sort != null) {
			pageVo.setSort(sort);
		}
		pageVo.setSearchKey(req.getParameter("searchKey"));
		pageVo.setSearchWord(req.getParameter("searchWord"));
		
		pageVo.setTotalRecord(reviewService.totalRecord(pageVo));
		
		mav.addObject("maincate", reviewService.reviewGetMainCate());
		mav.addObject("totalRecord", pageVo.getTotalRecord());
		mav.addObject("list", reviewService.reviewAdList(pageVo));
		mav.addObject("pageVO", pageVo);
		
		mav.setViewName("admin/review/reviewAdList");
		return mav;
	}
	@RequestMapping("/reviewAdDel")
	public ModelAndView reviewAdDel(int reviewno) {
		ModelAndView mav = new ModelAndView();
		reviewService.reviewAdDelete(reviewno);
		mav.setViewName("redirect:reviewAdList");
		return mav;
	}
	@RequestMapping("/reviewSelectCate")
	@ResponseBody
	public List<ReviewVO> reviewSelectCate(int mainno){
		return reviewService.reviewGetSubCate(mainno);
	}
}
