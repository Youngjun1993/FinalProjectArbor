package com.arbor.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.MyPageServiceImp;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class MyPageController {

	@Inject
	MyPageServiceImp mypageService;
	
	//마이페이지 구매내역
	@RequestMapping("/purchaseList")
	public ModelAndView purchaseList(HttpServletRequest req, HttpSession session) {
		String pageNumStr = req.getParameter("pageNum");
		ModelAndView mav = new ModelAndView();
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		String userid = (String)session.getAttribute("logId");
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			pageVo.setUserid(userid);
			pageVo.setTotalRecord(mypageService.totalRecord(pageVo));
			mav.addObject("list", mypageService.purchaseList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.setViewName("client/myPage/myPageMain");
			
		}
		return mav;
	}
	//구매내역 상품상페 팝업
	@RequestMapping("/orderPopup")
	@ResponseBody
	public List<OrdsubOrdJoinVO> orderPopup(int orderno) {
		List<OrdsubOrdJoinVO> list = mypageService.suborderList(orderno);
		
		return list;
	}
	//qna 리스트 페이지
	@RequestMapping("/qnaList")
	public ModelAndView qnaList(HttpServletRequest req, HttpSession session) {
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		ModelAndView mav = new ModelAndView();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		String userid = (String)session.getAttribute("logId");
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			pageVo.setUserid(userid);
			pageVo.setTotalRecord(mypageService.qnaTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.allList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/qna/qnaList");
		}
		
		return mav;
	}
	//쿠폰 리스트 페이지
	@RequestMapping("/couponList")
	public ModelAndView couponList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.setViewName("client/myPage/couponList");
			
		}
		return mav;
	}
}
