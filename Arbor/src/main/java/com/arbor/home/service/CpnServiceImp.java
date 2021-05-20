package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.PageSearchVO;

public interface CpnServiceImp {
	// maincate 가져오기
	public List<CouponVO> cpnGetMainCate();
	// subcate 가져오기
	public List<CouponVO> cpnGetSubCate(int mainno);
	// couponad insert
	public int cpnAdInsert(CouponVO vo);
}
