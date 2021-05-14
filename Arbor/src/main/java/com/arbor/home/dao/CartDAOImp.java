package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CartVO;

public interface CartDAOImp {
	/* 제품상세페이지에서 장바구니로 insert */
	public int cartInsert(CartVO vo);
	// 장바구니 카운트
	public List<CartVO> cartCount(String userid);
	// 장바구니 리스트
	public List<CartVO> cartList(String userid);
	// 장바구니 수량 증가
	public int cartQuantityPlus(int cartno);
	// 장바구니 수량 감소
	public int cartQuantityMinus(int cartno);
	// 장바구니 옵션 삭제
	public int cartOptDel(int cartno);
	// 수량
	public int cartQuantity(int cartno, String userid);
	// 상품별 결제금액
	public int cartPrice(int pno, String userid);
	// 상품별 수량
	public int cartOptQuantity(int pno, String userid);
	// 상품별 적립금
	public int cartPoint(int pno, String userid);
	// 총수량
	public int cartTotalQuantity(String userid);
	// 총배송비
	public int cartTotalDeliv(String userid);
	// 총적립금
	public int cartTotalPoint(String userid);
	// 총결제금액
	public int cartTotalPrice(String userid);
	// 장바구니 상품 삭제
	public int cartDel(int pno);
}
