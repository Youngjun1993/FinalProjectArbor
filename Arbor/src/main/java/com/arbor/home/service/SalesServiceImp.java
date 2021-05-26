package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SalesVO;

public interface SalesServiceImp {
	public List<SalesVO> totalRecord(SalesVO salesVo);
	public List<SalesVO> salesDetailInfo(String orderDate);		//주문상세정보

	public List<SalesVO> getDailySales(PageSearchVO pageVo);	//일자별 매출(날짜, 총매출액, 주문건수, 총배송비)
	
	public List<SalesVO> getMonthlyChartData(SalesVO salesVo);	//월별 매출그래프 데이터
	public List<SalesVO> getDailyChartData(SalesVO salesVo);	//일별 매출그래프 데이터
	public List<SalesVO> getMonthlyPieChartData(SalesVO salesVo);//월별 판매량 파이차트 데이터
	public List<SalesVO> getDailyPieChartData(SalesVO salesVo);	//일별 판매량 파이차트 데이터
	public List<SalesVO> getDailyMainCatePieChart(SalesVO salesVo);	//일별 판매량 파이차트 데이터
	
	
}
