package com.arbor.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/order")
	public String orderPage() {
		return "client/order/order";
	}
}
