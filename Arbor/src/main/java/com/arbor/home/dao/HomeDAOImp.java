package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.SubCateVO;

public interface HomeDAOImp {
	public List<MainCateVO> mainList();
	public List<SubCateVO> subList();
}
