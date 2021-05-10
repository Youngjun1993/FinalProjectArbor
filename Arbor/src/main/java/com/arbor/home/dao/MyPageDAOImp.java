package com.arbor.home.dao;

import java.util.HashMap;
import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.ReviewProductJoinVO;
import com.arbor.home.vo.ReviewVO;

public interface MyPageDAOImp {
	//구매내역 리스트
	public List<OrderTblVO> purchaseList(PageSearchVO vo);
	//구매내역 서브리스트
	public List<OrdsubOrdJoinVO> suborderList(int orderno);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	//적립금 합계
	public PointVO pointSum(String userid);
	//쿠폰 카운트
	public CouponVO couponCount(String userid);
	//리뷰 카운트
	public ReviewVO reviewCount(String userid);
	//qna 카운트
	public QnaVO qnaCount(String userid);
	
	//Q&A 리스트
	public List<QnaVO> allList(PageSearchVO vo);
	//Q&A 총 레코드 수
	public int qnaTotalRecord(PageSearchVO vo);
	/*
	 * //Q&A 처리상태 desc 정렬 public HashMap<String, List<QnaVO>>
	 * qnaAnsDesc(PageSearchVO vo);
	 */
		
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
