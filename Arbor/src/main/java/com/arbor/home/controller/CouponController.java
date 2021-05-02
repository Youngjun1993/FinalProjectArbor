package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.arbor.home.service.CpnServiceImp;

@Controller
public class CouponController {
	@Inject
	CpnServiceImp cpnService;
	
}
