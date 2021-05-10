package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.CartServiceImp;
import com.arbor.home.vo.CartVO;

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
	
	@RequestMapping(value="/cartInsert", method=RequestMethod.POST)
	@ResponseBody
	public int cartInsert(int pno,
			@RequestParam(value="optnameArr[]", required=true) String[] optnameArr,
			@RequestParam(value="priceArr[]", required=true) String[] priceArr,
			@RequestParam(value="quantityArr[]", required=true) String[] quantityArr,
			HttpSession ses
			) {
		String userid = (String)ses.getAttribute("logId");
		CartVO vo = new CartVO();
		int result = 0;
		for(int i=0; i<optnameArr.length; i++) {
			vo.setUserid(userid);
			vo.setOptionvalue(optnameArr[i]);
			vo.setPno(pno);
			vo.setPrice(Integer.parseInt(priceArr[i]));
			vo.setQuantity(Integer.parseInt(quantityArr[i]));
			if(cartService.cartInsert(vo)>0) {
				result += 1;
			}
		}
		return 0;
	}
}
