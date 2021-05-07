package com.arbor.home.service;

import com.arbor.home.vo.ReviewVO;

public interface ReviewServiceImp {
	//client 리뷰 삭제
	public int reviewDelete(int reviewno, String userid);
	//client 리뷰 수정하기
	public int reviewUpdate(ReviewVO vo);
}
