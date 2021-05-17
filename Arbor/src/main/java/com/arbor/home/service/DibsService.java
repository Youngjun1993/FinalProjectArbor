package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.DibsDAOImp;
import com.arbor.home.vo.DibsVO;
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
	public List<DibsVO> onePageRecordSelect(PageSearchVO vo) {
		return dibsDAO.onePageRecordSelect(vo);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return dibsDAO.totalRecord(vo);
	}

	@Override
	public List<DibsVO> dibsList(String userid) {
		return dibsDAO.dibsList(userid);
	}
}
