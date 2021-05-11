package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.DibsDAOImp;
import com.arbor.home.vo.DibsVO;

@Service
public class DibsService implements DibsServiceImp {
	@Inject
	DibsDAOImp dibsDAO;

	@Override
	public int dibsInsert(DibsVO vo) {
		return dibsDAO.dibsInsert(vo);
	}
}
