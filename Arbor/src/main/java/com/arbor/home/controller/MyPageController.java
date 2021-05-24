package com.arbor.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.lang.model.element.ModuleElement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.arbor.home.service.MemberServiceImp;
import com.arbor.home.service.MyPageServiceImp;
import com.arbor.home.vo.ExchangeVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ReviewVO;

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
	
	// 주문취소
	@RequestMapping("/cancelPay")
	@ResponseBody
	public int cancelPay(int orderno) {
		int result = 0;
		if(mypageService.cancelOrderPay(orderno)>0) {
			result++;
			if(mypageService.cancelSuborderPay(orderno)>0) {
				result++;
			}
		}
		return result;
	}
	
	//구매내역 상품상페 팝업
	@RequestMapping("/orderPopup")
	@ResponseBody
	public List<OrdsubOrdJoinVO> orderPopup(int orderno) {
		List<OrdsubOrdJoinVO> list = mypageService.suborderList(orderno);
		
		return list;
	}
	//구매내역 배송안내 팝업
	@RequestMapping("/myPagePopup")
	public String myPagePopup() {
		return "popup/myPagePopup";
	}
	//리뷰작성 팝업
	@RequestMapping("/reviewWrite")
	@ResponseBody
	public List<OrdsubOrdJoinVO> reviewWrite(int orderno, HttpSession ses){
		String userid = (String)ses.getAttribute("logId");
		List<OrdsubOrdJoinVO> list = mypageService.reviewWrtPopList(orderno);
		List<ReviewVO> revList = mypageService.reviewJoinList(userid);
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<revList.size(); j++) {
				if(list.get(i).getPno() == revList.get(j).getPno()) {
					list.get(i).setUsecoupon("작성완료");
				}
			}
		}
		
		return list;
	}
	//리뷰 작성
	@RequestMapping("/reviewWriteOk")
	public ModelAndView reviewWriteOk(ReviewVO vo, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			vo.setUserid(userid);
			mypageService.reviewInsert(vo);
			mav.setViewName("redirect:purchaseList");
		}
		return mav;
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
	// qna desc 정렬
	@RequestMapping("qnaDescList")
	public ModelAndView qnaDescList(HttpServletRequest req,HttpSession session) {
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
			mav.addObject("list", mypageService.qnaAnsDescList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/qna/qnaList");
		}
		return mav;
	}
	// qna asc 정렬
	@RequestMapping("qnaAscList")
	public ModelAndView qnaAscList(HttpServletRequest req,HttpSession session) {
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
			mav.addObject("list", mypageService.qnaAnsAscList(pageVo));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/qna/qnaList");
		}
		return mav;
	}
	
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
	

	//교환,환불 페이지
	@RequestMapping("/ChngRepundList")
	public ModelAndView ChngRepundList(int orderno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String nowId = (String)session.getAttribute("logId");
		
		if(nowId == null || nowId.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			mav.addObject("username", (String)session.getAttribute("logName"));
			mav.addObject("pointVO", mypageService.pointSum(nowId));
			mav.addObject("couponVO", mypageService.couponCount(nowId));
			mav.addObject("reviewVO", mypageService.reviewCount(nowId));
			mav.addObject("qnaVO", mypageService.qnaCount(nowId));
			mav.addObject("list", mypageService.suborderList(orderno));
			mav.addObject("memberVO", mypageService.getUserInfo(nowId));
			mav.setViewName("client/myPage/changeRepund");
		}
		
		return mav;
	}
	//교환신청 클릭
	@RequestMapping("/exchangeWrite")
	public ModelAndView exchangeWrite(ExchangeVO vo, int[] orderno, int[] suborderno,  HttpSession ses ) {
		ModelAndView mav = new ModelAndView();
		String nowId = (String)ses.getAttribute("logId");
		int result = 0;
		for(int i=0; i<suborderno.length; i++) {
			ExchangeVO insVO = new ExchangeVO();
			insVO.setOrderno(orderno[i]);
			insVO.setSuborderno(suborderno[i]);
			insVO.setUserid(nowId);
			insVO.setUsername(vo.getUsername());
			insVO.setTel(vo.getTel());
			insVO.setAddr(vo.getAddr());
			insVO.setDetailaddr(vo.getDetailaddr());
			insVO.setZipcode(vo.getZipcode());
			insVO.setExchanselect(vo.getExchanselect());
			insVO.setExchancontent(vo.getExchancontent());
			result = mypageService.exchangeInsert(insVO);
		}
		if(result>0) {
			int update = mypageService.orderStatusUpdate(orderno[0]);
			if(update>0) {
				System.out.println("상태까지 업뎃완료");
			}
		}
		mav.setViewName("redirect:purchaseList");
		return mav;
	}
}
