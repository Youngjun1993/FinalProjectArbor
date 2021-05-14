package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.CartDAOImp;
import com.arbor.home.vo.CartVO;

@Service
public class CartService implements CartServiceImp{
	@Inject
	CartDAOImp cartdao;

	@Override
	public int cartInsert(CartVO vo) {
		return cartdao.cartInsert(vo);
	}

	@Override
	public List<CartVO> cartList(String userid) {
		return cartdao.cartList(userid);
	}

	@Override
	public List<CartVO> cartCount(String userid) {
		return cartdao.cartCount(userid);
	}

	@Override
	public int cartQuantityPlus(int cartno) {
		return cartdao.cartQuantityPlus(cartno);
	}

	@Override
	public int cartQuantityMinus(int cartno) {
		return cartdao.cartQuantityMinus(cartno);
	}

	@Override
	public int cartOptDel(int cartno) {
		return cartdao.cartOptDel(cartno);
	}

	@Override
	public int cartPrice(int pno, String userid) {
		return cartdao.cartPrice(pno, userid);
	}

	@Override
	public int cartOptQuantity(int pno, String userid) {
		return cartdao.cartOptQuantity(pno, userid);
	}

	@Override
	public int cartPoint(int pno, String userid) {
		return cartdao.cartPoint(pno, userid);
	}

	@Override
	public int cartTotalQuantity(String userid) {
		return cartdao.cartTotalQuantity(userid);
	}

	@Override
	public int cartTotalDeliv(String userid) {
		return cartdao.cartTotalDeliv(userid);
	}

	@Override
	public int cartTotalPoint(String userid) {
		return cartdao.cartTotalPoint(userid);
	}

	@Override
	public int cartTotalPrice(String userid) {
		return cartdao.cartTotalPrice(userid);
	}

	@Override
	public int cartQuantity(int cartno, String userid) {
		return cartdao.cartQuantity(cartno, userid);
	}

	@Override
	public int cartDel(int pno) {
		return cartdao.cartDel(pno);
	}
}
