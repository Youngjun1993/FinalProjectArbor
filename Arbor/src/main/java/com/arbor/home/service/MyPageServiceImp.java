package com.arbor.home.service;

import java.util.HashMap;
import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.ExchangeVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.ReviewProductJoinVO;
import com.arbor.home.vo.ReviewVO;

public interface MyPageServiceImp {
	//구매내역 리스트
	public List<OrderTblVO> purchaseList(PageSearchVO vo);
	//구매내역 서브리스트
	public List<OrdsubOrdJoinVO> suborderList(int orderno);
	// 구매내역 - 주문취소
	public int cancelOrderPay(int orderno);
	public int cancelSuborderPay(int orderno);
	//리뷰작성 리스트
	public List<OrdsubOrdJoinVO> reviewWrtPopList(int orderno);
	//리뷰 아이디별 리스트
	public List<ReviewVO> reviewJoinList(String userid);	
	//리뷰 작성 완료
	public int reviewInsert(ReviewVO vo);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	//적립금 합계
	public PointVO pointSum(String userid);
	//쿠폰 카운트
	public CouponVO couponCount(String userid);
	//리뷰 카운트
	public ReviewVO reviewCount(String userid);
	//문의 카운트
	public QnaVO qnaCount(String userid);	
	//멤버 정보
	public MemberVO getUserInfo(String userid);
	//교환/환불 등록
	public int exchangeInsert(ExchangeVO vo);
	//주문상태 업데이트
	public int orderStatusUpdate(int orderno);
	//교환/환불 팝업리스트
	public OrdsubOrdJoinVO exchagneProdList(int suborderno);
	//교환/환불 옵션리스트
	public List<OptionVO> exchangeOptList(int suborderno);
	//교환 닫기시 삭제
	public int exchangeDelete(int orderno);
	//교환 suborder quantity update
	public int exchangeSubordUpdate(OrdsubOrdJoinVO vo);
	//교환 suborder insert
	public int exchangeSubordInsert(OrdsubOrdJoinVO vo);
	//교환 ordertbl update
	public int exchangeOrdtblUpdate(OrderTblVO vo);
	//바뀐 금액, 갯수 가져오기
	public List<OrdsubOrdJoinVO> exchangeGetPrice(int orderno);
	
	//Q&A 리스트
	public List<QnaVO> allList(PageSearchVO vo);
	//Q&A 총 레코드 수
	public int qnaTotalRecord(PageSearchVO vo);
	//처리상태 desc 정렬
	public List<QnaVO> qnaAnsDescList(PageSearchVO vo);
	//처리상태 asc 정렬
	public List<QnaVO> qnaAnsAscList(PageSearchVO vo);
	
	//Coupon 리스트
	public List<CouponVO> cpnList(PageSearchVO vo);
	//Coupon 총 레코드 수	
	public int cpnTotalRecord(PageSearchVO vo);
	//Coupon 할인율 정렬 리스트
	public List<CouponVO> cpnSaleDesc(PageSearchVO vo);
	
	//point 리스트
	public List<PointVO> pointList(PageSearchVO vo);
	//point 총 레코드 수	
	public int pointTotalRecord(PageSearchVO vo);
	
	//review 리스트
	public List<ReviewProductJoinVO> reviewList(PageSearchVO vo);
	//review 총 레코드 수	
	public int reviewTotalRecord(PageSearchVO vo);
	//review 평점 정렬 리스트
	public List<ReviewProductJoinVO> reviewGradeList(PageSearchVO vo);
}
