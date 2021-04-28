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
			mav.addObject("pointVO", mypageService.recordCountSum(userid));
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
	
}
