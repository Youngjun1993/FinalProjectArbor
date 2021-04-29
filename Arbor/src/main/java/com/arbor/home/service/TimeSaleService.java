package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.TimeSaleDAOImp;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

@Service
public class TimeSaleService implements TimeSaleServiceImp {
	@Inject
	TimeSaleDAOImp dao;

	@Override
	public ProductVO pInfoSearch(int pNo) {
		return dao.pInfoSearch(pNo);
	}

	@Override
	public int timeSaleInsert(TimeSaleVO vo) {
		return dao.timeSaleInsert(vo);
	}

	@Override
	public TimeSaleVO timeSaleSelect() {
		return dao.timeSaleSelect();
	}

	@Override
	public TimeSaleVO timeSaleEditRecord(int saleNo) {
		return dao.timeSaleEditRecord(saleNo);
	}

	@Override
	public int timeSaleEdit(TimeSaleVO vo) {
		return dao.timeSaleEdit(vo);
	}

	@Override
	public int timeSaleDelete(int saleNo) {
		return dao.timeSaleDelete(saleNo);
	}

}
