package com.arbor.home.service;

import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

public interface TimeSaleServiceImp {
	public ProductVO pInfoSearch(int pNo);
	public int timeSaleInsert(TimeSaleVO vo);
	public TimeSaleVO timeSaleSelect();
	public TimeSaleVO timeSaleEditRecord(int saleNo);
	public int timeSaleEdit(TimeSaleVO vo);
	public int timeSaleDelete(int saleNo);
}
