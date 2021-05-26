package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.SubOrderVO;

public interface OrderDAOImp {
	/* client */
	public SubOrderVO getProductInfo(int pno);				//상품정보 select
	public MemberVO getMemberInfo(String userid);			//로그인 회원정보
	public PointVO getUserPoint(String userid);				//로그인 회원의 보유 포인트
	public List<CouponVO> getUserCoupon(String userid);		//로그인 회원의 보유 쿠폰 리스트
	public int getCouponCount(String userid);				//로그인 회원의 보유 쿠폰 갯수
	public int couponCount(String userid, int subno);		// subno에 맞는 쿠폰 갯수
	public int getOrderSeq();								//주문번호 시퀀스
	public int orderComplete(OrderTblVO orderVo);			//주문정보 insert
	public int createSubOrderList(SubOrderVO subVo);		//주문한 상품정보 DB insert(subOrder)
	public List<SubOrderVO> getSubOrderList(int orderNo);	//주문한 상품정보 리스트(subOrder) - 주문완료 뷰페이지
	public OrderTblVO getOrderInfo(int orderNo);			//주문정보 select
	public List<SubOrderVO> cartAppendList(int pno, String userid); 	//장바구니 -> 구매버튼
	public SubOrderVO cartAppendChckList(int cartno, String userid);//장바구니 -> 선택구매버튼
	public List<SubOrderVO> cartAllList(String userid);		//장바구니 -> 전체구매버튼
	public int deleteCartList(int cartno, String userid);	//주문상품 장바구니에서 삭제
	public int updateProductStock(int pno);					//주문상품 재고 수정
	public int setUsedPoint(OrderTblVO orderVo);			//적립금 사용금액
	public int setPlusPoint(OrderTblVO orderVo);				//적립예정금액 반영
	public CouponVO cpnSelect(int cpnno);					// 쿠폰적용위한 정보 select
	public List<SubOrderVO> getSubnoSelect(String userid);	// subno구하기
	
	
	/* admin */
	public List<OrderTblVO> selectOrderList(PageSearchVO pageVo);//주문리스트 검색
	public OrderTblVO countOfOrderStatus(OrderTblVO orderVo);	//주문상태에 따른 건수
	public int updateOrderStatus(int orderno, String status);	//주문상태 변경
	public int totalRecord(PageSearchVO vo);					//총 레코드 수
	public MemberVO getUserInfo(int orderno);					//주문상세 - 회원정보
		
	/*public List<SubOrderVO> getSubOrderList(String orderNo);	//주문한 상품정보 리스트(subOrder) - 주문완료 뷰페이지
	public OrderTblVO getOrderInfo(String orderNo);				//주문정보 select
	*/	

}

