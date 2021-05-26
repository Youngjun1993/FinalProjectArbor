package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.ReviewDAOImp;
import com.arbor.home.vo.PageSearchVO;
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

	@Override
	public List<ReviewVO> reviewAdList(PageSearchVO vo) {
		return reviewService.reviewAdList(vo);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return reviewService.totalRecord(vo);
	}

	@Override
	public int reviewAdDelete(int reviewno) {
		return reviewService.reviewAdDelete(reviewno);
	}

	@Override
	public List<ReviewVO> reviewGetMainCate() {
		return reviewService.reviewGetMainCate();
	}

	@Override
	public List<ReviewVO> reviewGetSubCate(int mainno) {
		return reviewService.reviewGetSubCate(mainno);
	}
	
}
