package com.arbor.home.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.MyPageDAOImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.ReviewProductJoinVO;
import com.arbor.home.vo.ReviewVO;
import com.arbor.home.vo.SubOrderVO;

@Service
public class MyPageService implements MyPageServiceImp {

	@Inject
	MyPageDAOImp mypageDAO;

	@Override
	public List<OrderTblVO> purchaseList(PageSearchVO vo) {
		return mypageDAO.purchaseList(vo);
	}

	@Override
	public List<OrdsubOrdJoinVO> suborderList(int orderno) {
		return mypageDAO.suborderList(orderno);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return mypageDAO.totalRecord(vo);
	}

	@Override
	public PointVO pointSum(String userid) {
		return mypageDAO.pointSum(userid);
	}

	@Override
	public CouponVO couponCount(String userid) {
		return mypageDAO.couponCount(userid);
	}

	@Override
	public ReviewVO reviewCount(String userid) {
		return mypageDAO.reviewCount(userid);
	}

	@Override
	public QnaVO qnaCount(String userid) {
		return mypageDAO.qnaCount(userid);
	}

	@Override
	public List<QnaVO> allList(PageSearchVO vo) {
		return mypageDAO.allList(vo);
	}

	@Override
	public int qnaTotalRecord(PageSearchVO vo) {
		return mypageDAO.qnaTotalRecord(vo);
	}

	@Override
	public List<CouponVO> cpnList(PageSearchVO vo) {
		return mypageDAO.cpnList(vo);
	}
	@Override
	public int cpnTotalRecord(PageSearchVO vo) {
		return mypageDAO.cpnTotalRecord(vo);
	}

	@Override
	public List<PointVO> pointList(PageSearchVO vo) {
		return mypageDAO.pointList(vo);
	}

	@Override
	public int pointTotalRecord(PageSearchVO vo) {
		return mypageDAO.pointTotalRecord(vo);
	}

	@Override
	public List<ReviewProductJoinVO> reviewList(PageSearchVO vo) {
		return mypageDAO.reviewList(vo);
	}

	@Override
	public int reviewTotalRecord(PageSearchVO vo) {
		return mypageDAO.reviewTotalRecord(vo);
	}

	@Override
	public List<CouponVO> cpnSaleDesc(PageSearchVO vo) {
		return mypageDAO.cpnSaleDesc(vo);
	}

	@Override
	public List<ReviewProductJoinVO> reviewGradeList(PageSearchVO vo) {
		return mypageDAO.reviewGradeList(vo);
	}

	@Override
	public List<QnaVO> qnaAnsDescList(PageSearchVO vo) {
		return mypageDAO.qnaAnsDescList(vo);
	}

	@Override
	public List<QnaVO> qnaAnsAscList(PageSearchVO vo) {
		return mypageDAO.qnaAnsAscList(vo);
	}

	@Override
	public List<OrdsubOrdJoinVO> reviewWrtPopList(int orderno) {
		return mypageDAO.reviewWrtPopList(orderno);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		return mypageDAO.reviewInsert(vo);
	}

	@Override
	public List<ReviewVO> reviewJoinList(String userid) {
		return mypageDAO.reviewJoinList(userid);
	}

	/*
	 * @Override public HashMap<String, List<QnaVO>> qnaAnsDesc(PageSearchVO vo) {
	 * return mypageDAO.qnaAnsDesc(vo); }
	 */


}
