package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.SalesDAOImp;
import com.arbor.home.vo.SalesVO;

@Service
public class SalesService implements SalesServiceImp {
	@Inject
	SalesDAOImp salesDAO;

	@Override
	public List<SalesVO> getDailySales(SalesVO salesVo) {
		return salesDAO.getDailySales(salesVo);
	}

	@Override
	public List<SalesVO> salesDetailInfo(String orderDate) {
		return salesDAO.salesDetailInfo(orderDate);
	}

	
}
