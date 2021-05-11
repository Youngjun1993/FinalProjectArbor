package com.arbor.home.service;

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
}
