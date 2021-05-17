package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.DibsVO;
import com.arbor.home.vo.PageSearchVO;

public interface DibsDAOImp {
	/* 상품상세 -> 찜하기 버튼 클릭시 insert */
	public int dibsInsert(DibsVO vo);
	// 찜목록 전체 리스트
	public List<DibsVO> onePageRecordSelect(PageSearchVO vo);
	// 찜목록 옵션 리스트
	public List<DibsVO> dibsList(String userid);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
}
