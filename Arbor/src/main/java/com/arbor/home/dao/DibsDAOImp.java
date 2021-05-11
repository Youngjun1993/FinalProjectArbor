package com.arbor.home.dao;

import com.arbor.home.vo.DibsVO;

public interface DibsDAOImp {
	/* 상품상세 -> 찜하기 버튼 클릭시 insert */
	public int dibsInsert(DibsVO vo);
}
