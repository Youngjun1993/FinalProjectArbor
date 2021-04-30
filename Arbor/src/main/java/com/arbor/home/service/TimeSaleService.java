package com.arbor.home.service;

import java.util.List;

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
	public List<TimeSaleVO> timeSaleAllSelect(TimeSaleVO vo) {
		return dao.timeSaleAllSelect(vo);
	}

	@Override
	public ProductVO pInfoSearch(int pNo) {
		return dao.pInfoSearch(pNo);
	}

	@Override
	public int timeSaleInsert(TimeSaleVO vo) {
		return dao.timeSaleInsert(vo);
	}

	@Override
	public TimeSaleVO timeSaleSelect(int saleNo) {
		return dao.timeSaleSelect(saleNo);
	}

	@Override
	public int timeSaleEdit(TimeSaleVO vo) {
		return dao.timeSaleEdit(vo);
	}

	@Override
	public int timeSaleDelete(int saleNo) {
		return dao.timeSaleDelete(saleNo);
	}

	@Override
	public TimeSaleVO getTimeSale() {
		return dao.getTimeSale();
	}


}
