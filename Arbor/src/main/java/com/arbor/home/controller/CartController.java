package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.CartServiceImp;
import com.arbor.home.vo.ProductVO;

@Controller
public class CartController {
	@Inject
	CartServiceImp cartService;
	
	@RequestMapping("/cartList")
	public ModelAndView cartList(int pno, int optno, 
			@RequestParam(value="price") int price) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client/cart/cartList");
		return mav;
	}
}
