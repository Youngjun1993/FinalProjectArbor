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
}
