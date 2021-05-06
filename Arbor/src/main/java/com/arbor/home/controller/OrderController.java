package com.arbor.home.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;
	
	/*
	 * private IamportClient api; public OrderController() { this.api = new
	 * IamportClient("3452420157053319",
	 * "DXI0XVlgpUwS8B3Hj9cFxozTrGn6CXmfU4fS0B8pvFhDglkzvxe3VNXnukt7hPmcUC4UddkJSCn9XIJt"
	 * ); }
	 */
	
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
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/verifylamport/{imp_uid}") public
	 * IamportResponse<Payment> paymentByImpUid( Model model, Locale locale,
	 * HttpSession session,
	 * 
	 * @PathVariable(value="imp_uid") String imp_uid){
	 * 
	 * 
	 * }
	 */
	
}
