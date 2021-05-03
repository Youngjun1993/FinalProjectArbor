package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

public interface TimeSaleServiceImp {
	public List<TimeSaleVO> timeSaleAllSelect(TimeSaleVO vo);
	public ProductVO pInfoSearch(int pNo);
	public int timeSaleInsert(TimeSaleVO vo);
	public TimeSaleVO timeSaleSelect(int saleNo);
	public int timeSaleEdit(TimeSaleVO vo);
	public int timeSaleDelete(int saleNo);
	
	public List<TimeSaleVO> getTimeSale();
}
