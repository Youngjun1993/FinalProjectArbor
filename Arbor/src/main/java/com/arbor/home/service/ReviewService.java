package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.ReviewDAOImp;
import com.arbor.home.vo.ReviewVO;

@Service
public class ReviewService implements ReviewServiceImp {
	@Inject
	ReviewDAOImp reviewService;
	
	@Override
	public int reviewDelete(int reviewno, String userid) {
		return reviewService.reviewDelete(reviewno, userid);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
		return reviewService.reviewUpdate(vo);
	}
	
}
