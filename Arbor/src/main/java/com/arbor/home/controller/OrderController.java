package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;
	
	@RequestMapping(value="/order", method = RequestMethod.POST)
	public ModelAndView orderPage(@Nullable
			@RequestParam(value="optnameArr", required=true) String[] optInfoArr,
			@RequestParam(value="priceArr", required=true) String[] priceArr,
			@RequestParam(value="pnoStr", required=true) String pnoStr,
			@RequestParam(value="quantityArr", required=true) String[] quantityArr,
			MemberVO memberVo, OrderTblVO orderVo, HttpSession session
			) {
		// 여긴 출력값 이런식으로 확인해서 쓰면 된다는 예시를 남긴고얌 지워도 댐!!! 
		for(int i=0; i<priceArr.length; i++) {
			System.out.println("optInfoArr?"+optInfoArr[i]);
			System.out.println("priceArr?"+priceArr[i]);
			System.out.println("quantityArr?"+quantityArr[i]);
		}
		
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
