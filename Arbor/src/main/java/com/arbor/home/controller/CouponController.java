package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.CpnServiceImp;

@Controller
public class CouponController {
	@Inject
	CpnServiceImp cpnService;
	
	@RequestMapping("/couponAdList")
	public ModelAndView couponAdList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/coupon/couponAdList");
		return mav;
	}
}
