package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.SalesDAOImp;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SalesVO;

@Service
public class SalesService implements SalesServiceImp {
	@Inject
	SalesDAOImp salesDAO;

	@Override
	public List<SalesVO> totalRecord(SalesVO salesVo) {
		return salesDAO.totalRecord(salesVo);
	}

	@Override
	public List<SalesVO> salesDetailInfo(String orderDate) {
		return salesDAO.salesDetailInfo(orderDate);
	}

	@Override
	public List<SalesVO> getDailySales(PageSearchVO pageVo) {
		return salesDAO.getDailySales(pageVo);
	}

	@Override
	public List<SalesVO> getMonthlyChartData(SalesVO salesVo) {
		return salesDAO.getMonthlyChartData(salesVo);
	}

	@Override
	public List<SalesVO> getDailyChartData(SalesVO salesVo) {
		return salesDAO.getDailyChartData(salesVo);
	}
	
	@Override
	public List<SalesVO> getMonthlyPieChartData(SalesVO salesVo) {
		return salesDAO.getMonthlyPieChartData(salesVo);
	}

	@Override
	public List<SalesVO> getDailyPieChartData(SalesVO salesVo) {
		return salesDAO.getDailyPieChartData(salesVo);
	}

	@Override
	public List<SalesVO> getDailyMainCatePieChart(SalesVO salesVo) {
		return salesDAO.getDailyMainCatePieChart(salesVo);
	}


	
}
