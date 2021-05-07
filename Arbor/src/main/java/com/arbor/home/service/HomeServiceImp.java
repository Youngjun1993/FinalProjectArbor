package com.arbor.home.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.SubCateVO;


public interface HomeServiceImp {

	public List<MainCateVO> mainList();
	public List<SubCateVO> subList();
}
