package com.arbor.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.lang.model.element.ModuleElement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.MemberServiceImp;
import com.arbor.home.service.MyPageServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class MyPageController {

	@Inject
	MyPageServiceImp mypageService;
	@Inject
	MemberServiceImp memberService;
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
	/*
	 * @RequestMapping("qnaAnsDescList")
	 * 
	 * @ResponseBody public HashMap<String, List<QnaVO>>
	 * qnaAnsDescList(HttpServletRequest req, HttpSession session){ HashMap<String,
	 * List<QnaVO>> map = new HashMap<String, List<QnaVO>>(); String pageNumStr =
	 * req.getParameter("pageNum"); PageSearchVO pageVo = new PageSearchVO();
	 * 
	 * if(pageNumStr != null) { pageVo.setPageNum(Integer.parseInt(pageNumStr)); }
	 * map.put("list", (List<QnaVO>) mypageService.qnaAnsDesc(pageVo)); return map;
	 * }
	 */
	
	//쿠폰 리스트 페이지
	@RequestMapping("/couponList")
	public ModelAndView couponList(HttpServletRequest req, HttpSession session) {
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
			pageVo.setTotalRecord(mypageService.cpnTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.cpnList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/myPage/couponList");
			
		}
		return mav;
	}
	//쿠폰 할인율 정렬
	@RequestMapping("cpnSaleDesc")
	public ModelAndView cpnSaleDesc(HttpServletRequest req, HttpSession session) {
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
			pageVo.setTotalRecord(mypageService.cpnTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.cpnSaleDesc(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/myPage/couponList");
			
		}
		return mav;
	}
	
	//적립금 리스트 페이지
	@RequestMapping("/pointList")
	public ModelAndView pointList(HttpServletRequest req, HttpSession session) {
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
			pageVo.setTotalRecord(mypageService.pointTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.pointList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/myPage/pointList");
			
		}
		return mav;
	}
	//리뷰관리 리스트 페이지
	@RequestMapping("/reviewList")
	public ModelAndView reviewList(HttpServletRequest req, HttpSession session) {
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
			pageVo.setTotalRecord(mypageService.reviewTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.reviewList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/myPage/reviewList");
			
		}
		return mav;
	}
	
	//리뷰 평점 정렬
	@RequestMapping("reviewGradeDesc")
	public ModelAndView reviewGradeDesc(HttpServletRequest req, HttpSession session) {
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
			pageVo.setTotalRecord(mypageService.reviewTotalRecord(pageVo));
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(userid));
			mav.addObject("couponVO", mypageService.couponCount(userid));
			mav.addObject("reviewVO", mypageService.reviewCount(userid));
			mav.addObject("qnaVO", mypageService.qnaCount(userid));
			mav.addObject("list", mypageService.reviewGradeList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/myPage/reviewList");
			
		}
		return mav;
	}

	////////////회원 업데이트 이동
	@RequestMapping("/memberUpdate")
	public ModelAndView memberUpdate (HttpSession session) {
		//셀렉트문으로 세션유저의 정보 가져오기
		String nowId = (String)session.getAttribute("logId");
		
		ModelAndView mav = new ModelAndView();
		MemberVO vo = memberService.memUpdateSelect(nowId);
		
		mav.addObject("vo", vo);
		mav.addObject("username", (String)session.getAttribute("logName"));
		mav.addObject("pointVO", mypageService.pointSum(nowId));
		mav.addObject("couponVO", mypageService.couponCount(nowId));
		mav.addObject("reviewVO", mypageService.reviewCount(nowId));
		mav.addObject("qnaVO", mypageService.qnaCount(nowId));

		mav.setViewName("client/myPage/memberUpdate");
		
		return mav;
	}
	
	///////////////회원탈퇴
	@RequestMapping("/memberQuit")
	public ModelAndView memberQuit(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String nowId = (String)session.getAttribute("logId");
		
		
		mav.addObject("username", (String)session.getAttribute("logName"));
		mav.addObject("pointVO", mypageService.pointSum(nowId));
		mav.addObject("couponVO", mypageService.couponCount(nowId));
		mav.addObject("reviewVO", mypageService.reviewCount(nowId));
		mav.addObject("qnaVO", mypageService.qnaCount(nowId));
		
		mav.setViewName("client/myPage/memberQuit");
		
	return mav;
	}
	
}
