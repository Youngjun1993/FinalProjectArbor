package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CartVO;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.SubOrderVO;

public interface OrderDAOImp {
	public MemberVO getMemberInfo(String userid);			//로그인 회원정보
	public PointVO getUserPoint(String userid);				//로그인 회원의 보유 포인트
	public List<CouponVO> getUserCoupon(String userid);		//로그인 회원의 보유 쿠폰 리스트
	public int getCouponCount(String userid);				//로그인 회원의 보유 쿠폰 갯수
	public int getOrderSeq();								//주문번호 시퀀스
	public int orderComplete(OrderTblVO orderVo);			//주문정보 insert
	public int createSubOrderList(SubOrderVO subVo);		//주문한 상품정보 DB insert(subOrder)
	public List<SubOrderVO> getSubOrderList(String orderNo);//주문한 상품정보 리스트(subOrder) - 주문완료 뷰페이지
	public OrderTblVO getOrderInfo(String orderNo);			//주문정보 select
	public List<CartVO> cartAppendList(int pno, String userid); //장바구니 -> 구매버튼
	public CartVO cartAppendChckList(int cartno, String userid); //장바구니 -> 선택구매버튼
	public List<CartVO> cartAllList(String userid);			//장바구니 -> 전체구매버튼	
}
