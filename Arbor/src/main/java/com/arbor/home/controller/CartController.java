package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView cartList(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", cartService.cartCount((String)ses.getAttribute("logId")));
		mav.addObject("optList", cartService.cartList((String)ses.getAttribute("logId")));
		
		mav.setViewName("client/cart/cartList");
		return mav;
	}
	
	@RequestMapping(value="/cartInsert", method=RequestMethod.POST)
	@ResponseBody
	public int cartInsert(
			@RequestParam(value="optnameArr[]", required=true) String[] optnameArr,
			@RequestParam(value="priceArr[]", required=true) String[] priceArr,
			@RequestParam(value="quantityArr[]", required=true) String[] quantityArr,
			@RequestParam(value="pno", required=true) String pnoStr,
			HttpServletRequest req,
			HttpSession ses
			) {
		int result = 0;
		for(int i=0; i<priceArr.length; i++) {
			CartVO vo = new CartVO();
			vo.setUserid((String)ses.getAttribute("logId"));
			if(optnameArr.length==0) {
				vo.setOptionvalue("");
			} else {
				vo.setOptionvalue(optnameArr[i]);
			}
			vo.setPno(Integer.parseInt(pnoStr));
			vo.setPrice(Integer.parseInt(priceArr[i]));
			vo.setQuantity(Integer.parseInt(quantityArr[i]));
			int res = cartService.cartInsert(vo);
			if(res>0) {
				result++;
			}
		}
		return result;
	}

}
