package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;
	
	@RequestMapping("/order")
	public ModelAndView orderPage(MemberVO memberVo, OrderTblVO orderVo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		System.out.println("userid==>"+userid);
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			orderVo.setUserid(userid);
			System.out.println("userid->"+userid + ", getUserid()->"+orderVo.getUserid());
			mav.addObject("memberVo", orderService.getMemberInfo(userid));
			mav.addObject("pointVo", orderService.getUserPoint(userid));
			mav.addObject("list", orderService.getUserCoupon(userid));
			mav.addObject("cpnCount", orderService.getCouponCount(userid));			
			mav.setViewName("client/order/order");
		}
		return mav;
	}
	
	@RequestMapping("/orderOk")
	public ModelAndView orderOk(String applyNum, String paidAt) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("applyNum", applyNum);
		mav.addObject("paidAt", paidAt);
		System.out.println("넘어온 승인번호->"+applyNum);
		System.out.println("넘어온 승인시각->"+paidAt);
		mav.setViewName("client/order/orderOk");
		return mav;
	}
	
	
}
