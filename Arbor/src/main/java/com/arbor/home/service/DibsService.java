package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.DibsDAOImp;
import com.arbor.home.vo.DibsVO;
import com.arbor.home.vo.PageDibsVO;
import com.arbor.home.vo.PageSearchVO;

@Service
public class DibsService implements DibsServiceImp {
	@Inject
	DibsDAOImp dibsDAO;

	@Override
	public int dibsInsert(DibsVO vo) {
		return dibsDAO.dibsInsert(vo);
	}

	@Override
	public List<DibsVO> onePageRecordSelect(PageDibsVO vo) {
		return dibsDAO.onePageRecordSelect(vo);
	}

	@Override
	public int totalRecord(PageDibsVO vo) {
		return dibsDAO.totalRecord(vo);
	}

	@Override
	public List<DibsVO> dibsList(String userid) {
		return dibsDAO.dibsList(userid);
	}

	@Override
	public int dibsPrice(int pno, String userid) {
		return dibsDAO.dibsPrice(pno, userid);
	}

	@Override
	public int dibsInsertInCart(int pno, String userid) {
		return dibsDAO.dibsInsertInCart(pno, userid);
	}

	@Override
	public int dibsDelete(int pno, String userid) {
		return dibsDAO.dibsDelete(pno, userid);
	}
	@Override
	public int dibsMiniList(DibsVO vo) {
		return dibsDAO.dibsMiniList(vo);
	}
	@Override
	public int dibsMiniListNull(DibsVO vo) {
		return dibsDAO.dibsMiniListNull(vo);
	}
}
