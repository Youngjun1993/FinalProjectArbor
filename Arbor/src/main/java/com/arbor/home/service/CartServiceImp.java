package com.arbor.home.service;

import com.arbor.home.vo.CartVO;

public interface CartServiceImp {
	/* 제품상세페이지에서 장바구니로 insert */
	public int cartInsert(CartVO vo);
}
