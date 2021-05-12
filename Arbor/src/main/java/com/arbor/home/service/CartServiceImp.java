package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.CartVO;

public interface CartServiceImp {
	/* 제품상세페이지에서 장바구니로 insert */
	public int cartInsert(CartVO vo);
	// 장바구니 리스트
	public List<CartVO> cartList(String userid);
	// 장바구니 카운트
	public List<CartVO> cartCount(String userid);
}
