package com.arbor.home.dao;

import com.arbor.home.vo.CartVO;

public interface CartDAOImp {
	/* 제품상세페이지에서 장바구니로 insert */
	public int cartInsert(CartVO vo);
}
