package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;

public interface HomeDAOImp {
	public List<MainCateVO> mainList();
	public List<SubCateVO> subList();
	// main에서 사용할 판매순 top8
	public List<ProductVO> productCateTop8();
	// main에서 사용할 인기순 top8
	public List<ProductVO> productNewTop8();
}
