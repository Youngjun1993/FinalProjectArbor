package com.arbor.home.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.SubOrderVO;

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
	public ModelAndView orderOk(
			OrderTblVO orderVo, String applyNum, HttpSession session,
			@RequestParam(value="pno",required=true) int[] pnoArr,
			@RequestParam(value="pname",required=true) String[] pnameArr,
			@RequestParam(value="quantity",required=true) int[] quantityArr,
			@RequestParam(value="subprice",required=true) int[] subpriceArr
			) {
		String userid = (String)session.getAttribute("logId");
		orderVo.setUserid(userid);
				
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String today = sdf.format(now);
		String orderSeq = String.valueOf(orderService.getOrderSeq());
		orderVo.setOrderno(today+"-"+orderSeq); //당일날짜+시퀀스 형식으로 주문번호 생성 (ex.210511003)
		
		if(orderService.orderComplete(orderVo)>0) {

			System.out.println("=== SubOrderTblVO List ===");
			for(int i=0; i<pnoArr.length; i++) {
				SubOrderVO subVo = new SubOrderVO();
				subVo.setOrderno(orderVo.getOrderno());
				subVo.setPno(pnoArr[i]);
				subVo.setPname(pnameArr[i]);
				subVo.setQuantity(quantityArr[i]);
				subVo.setSubprice(subpriceArr[i]);
				
				orderService.createSubOrderList(subVo);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pList", orderService.getSubOrderList(orderVo.getOrderno()));
		mav.addObject("orderVo", orderService.getOrderInfo(orderVo.getOrderno()));
		mav.addObject("applyNum", applyNum);
		mav.setViewName("client/order/orderOk");
		return mav;
	}
	
	
}
