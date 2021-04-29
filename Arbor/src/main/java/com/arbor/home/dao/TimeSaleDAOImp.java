package com.arbor.home.dao;

import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

public interface TimeSaleDAOImp {
	public ProductVO pInfoSearch(int pNo);	//상품명, 상품가격 호출
	public int timeSaleInsert(TimeSaleVO vo);
	public TimeSaleVO timeSaleSelect();
	public TimeSaleVO timeSaleEditRecord(int saleNo);
	public int timeSaleEdit(TimeSaleVO vo);
	public int timeSaleDelete(int saleNo);
}
