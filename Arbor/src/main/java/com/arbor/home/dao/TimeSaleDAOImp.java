package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

public interface TimeSaleDAOImp {
	public List<TimeSaleVO> timeSaleAllSelect(TimeSaleVO vo);
	public ProductVO pInfoSearch(int pNo);	//상품명, 상품가격 호출
	public int timeSaleInsert(TimeSaleVO vo);
	public TimeSaleVO timeSaleSelect(int saleNo);
	public int timeSaleEdit(TimeSaleVO vo);
	public int timeSaleDelete(int saleNo);
	
	
	public List<TimeSaleVO> getTimeSale();
}
