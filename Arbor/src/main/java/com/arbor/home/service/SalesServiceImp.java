package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.SalesVO;

public interface SalesServiceImp {
	public List<SalesVO> getDailySales(SalesVO salesVo);	//일자별 매출(날짜, 총매출액, 주문건수, 총배송비)
	public List<SalesVO> salesDetailInfo(String orderDate);	//주문상세정보
	
}
