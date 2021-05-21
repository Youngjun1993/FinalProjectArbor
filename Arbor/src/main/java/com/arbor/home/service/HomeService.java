package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.HomeDAOImp;
import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;

@Service
public class HomeService implements HomeServiceImp {
	
	@Inject
	HomeDAOImp homeDAO;

	@Override
	public List<MainCateVO> mainList() {
		// TODO Auto-generated method stub
		return homeDAO.mainList();
	}

	@Override
	public List<SubCateVO> subList() {
		// TODO Auto-generated method stub
		return homeDAO.subList();
	}

	@Override
	public List<ProductVO> productCateTop8() {
		return homeDAO.productCateTop8();
	}


}
