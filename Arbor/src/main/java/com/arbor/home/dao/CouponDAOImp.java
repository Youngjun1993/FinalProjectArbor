package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.PageSearchVO;

public interface CouponDAOImp {
	// couponAd 리스트
	public List<CouponVO> cpnAdList(PageSearchVO vo);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	// maincate 가져오기
	public List<CouponVO> cpnGetMainCate();
	// subcate 가져오기
	public List<CouponVO> cpnGetSubCate(int mainno);
	// couponad insert
	public int cpnAdInsert(CouponVO vo);
	// couponad update
	public int cpnAdUpdate(CouponVO vo);
	// couponad delete
	public int cpnAdDelete(int cpnadno);
	// couponad 전체삭제
	public int cpnAllDelete();
	// couponad 업뎃시 client도 없뎃
	public int cpnClientUpdate(CouponVO vo);
}
