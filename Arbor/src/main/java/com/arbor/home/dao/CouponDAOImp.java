package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CouponVO;

public interface CouponDAOImp {
	// maincate 가져오기
	public List<CouponVO> cpnGetMainCate();
	// subcate 가져오기
	public List<CouponVO> cpnGetSubCate(int mainno);
	// couponad insert
	public int cpnAdInsert(CouponVO vo);
}
