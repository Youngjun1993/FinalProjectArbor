package com.arbor.home.dao;

import com.arbor.home.vo.ReviewVO;

public interface ReviewDAOImp {
	//client 리뷰 삭제
	public int reviewDelete(int reviewno, String userid);
	//client 리뷰 수정하기
	public int reviewUpdate(ReviewVO vo);
}
