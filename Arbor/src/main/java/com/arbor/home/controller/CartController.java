package com.arbor.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
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
	public int cartInsert(@Nullable
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
			if(cartService.cartMiniList(vo)>0) {
				int cartno = cartService.cartNoSelect(vo);
				cartService.cartQuantityPlus(cartno);
				result++;
			} else {
				int res = cartService.cartInsert(vo);
				if(res>0) {
					result++;
				}
			}
		}
		return result;
	}
	
	@RequestMapping(value="/cartStart", method=RequestMethod.POST)
	@ResponseBody
	public List<CartVO> cartStart(
			@RequestParam(value="finalpno[]", required = true) String finalpno[],
			HttpSession ses
			){
		List<CartVO> list = new ArrayList<CartVO>();
		
		for(int i=0; i<finalpno.length; i++) {
			int pno = Integer.parseInt(finalpno[i]);
			String userid = (String)ses.getAttribute("logId");	
			CartVO vo = new CartVO();
			vo.setOptsumprice(cartService.cartPrice(pno, userid));
			vo.setOptquantity(cartService.cartOptQuantity(pno, userid));
			vo.setPoint(cartService.cartPoint(pno, userid));
			list.add(vo);
		}
		return list;
 	}
	
	@RequestMapping(value="/cartUpdate", method=RequestMethod.POST)
	@ResponseBody
	public CartVO cartUpdate(
			@RequestParam(value="cartno", required=true) int cartno, 
			@RequestParam(value="pno", required=true) int pno, 
			@RequestParam(value="temp", required=true) String temp, 
			HttpSession ses
			){
		CartVO vo = new CartVO();
		String userid = (String)ses.getAttribute("logId");
		
		if(temp.equals("minus")) {
			int res = cartService.cartQuantityMinus(cartno);
			if(res>0) {
				vo.setQuantity(cartService.cartQuantity(cartno, userid));
				vo.setOptsumprice(cartService.cartPrice(pno, userid));
				vo.setOptquantity(cartService.cartOptQuantity(pno, userid));
				vo.setPoint(cartService.cartPoint(pno, userid));
				vo.setTotalquantity(cartService.cartTotalQuantity(userid));
				vo.setTotaldeliv(cartService.cartTotalDeliv(userid));
				vo.setTotalpoint(cartService.cartTotalPoint(userid));
				vo.setTotalprice(cartService.cartTotalPrice(userid));
			}
		}else if(temp.equals("plus")) {
			int res = cartService.cartQuantityPlus(cartno);
			if(res>0) {
				vo.setQuantity(cartService.cartQuantity(cartno, userid));
				vo.setOptsumprice(cartService.cartPrice(pno, userid));
				vo.setOptquantity(cartService.cartOptQuantity(pno, userid));
				vo.setPoint(cartService.cartPoint(pno, userid));
				vo.setTotalquantity(cartService.cartTotalQuantity(userid));
				vo.setTotaldeliv(cartService.cartTotalDeliv(userid));
				vo.setTotalpoint(cartService.cartTotalPoint(userid));
				vo.setTotalprice(cartService.cartTotalPrice(userid));
			}
		}else if(temp.equals("del")) {
			int res = cartService.cartOptDel(cartno);
			if(res>0) {
				vo.setOptsumprice(cartService.cartPrice(pno, userid));
				vo.setOptquantity(cartService.cartOptQuantity(pno, userid));
				vo.setPoint(cartService.cartPoint(pno, userid));
				vo.setTotalquantity(cartService.cartTotalQuantity(userid));
				vo.setTotaldeliv(cartService.cartTotalDeliv(userid));
				vo.setTotalpoint(cartService.cartTotalPoint(userid));
				vo.setTotalprice(cartService.cartTotalPrice(userid));
			}
		}else if(temp.equals("maindel")) {
			int res = cartService.cartDel(pno);
			if(res>0) {
				vo.setTotalquantity(cartService.cartTotalQuantity(userid));
				vo.setTotaldeliv(cartService.cartTotalDeliv(userid));
				vo.setTotalpoint(cartService.cartTotalPoint(userid));
				vo.setTotalprice(cartService.cartTotalPrice(userid));
			}
		}
		return vo;
	}
}
