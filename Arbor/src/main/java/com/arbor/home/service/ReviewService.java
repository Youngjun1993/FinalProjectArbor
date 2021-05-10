package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.ReviewDAOImp;

@Service
public class ReviewService implements ReviewServiceImp {
	@Inject
	ReviewDAOImp reviewService;
	
	@Override
	public int reviewDelete(int reviewno, String userid) {
		return reviewService.reviewDelete(reviewno, userid);
	}

	
	
}
