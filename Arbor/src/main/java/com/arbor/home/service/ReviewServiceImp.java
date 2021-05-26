package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ReviewVO;

public interface ReviewServiceImp {
	//client 리뷰 삭제
	public int reviewDelete(int reviewno, String userid);
	//client 리뷰 수정하기
	public int reviewUpdate(ReviewVO vo);
	
	//Admin 리뷰 전체 리스트
	public List<ReviewVO> reviewAdList(PageSearchVO vo);
	//Admin 총 레코드
	public int totalRecord(PageSearchVO vo);
	//Admin 리뷰 삭제
	public int reviewAdDelete(int reviewno);
	//Admin maincate 목록
	public List<ReviewVO> reviewGetMainCate();
	//Admin subcate 목록
	public List<ReviewVO> reviewGetSubCate(int mainno);
}
