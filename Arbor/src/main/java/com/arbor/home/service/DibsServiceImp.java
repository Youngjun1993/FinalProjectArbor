package com.arbor.home.service;

import com.arbor.home.vo.DibsVO;

public interface DibsServiceImp {
	/* 상품상세 -> 찜하기 버튼 클릭시 insert */
	public int dibsInsert(DibsVO vo);
}
