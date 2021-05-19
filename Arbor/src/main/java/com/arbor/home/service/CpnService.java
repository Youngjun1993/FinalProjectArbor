package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.CouponDAOImp;
import com.arbor.home.vo.CouponVO;

@Service
public class CpnService implements CpnServiceImp {
	@Inject
	CouponDAOImp cpnDAO;

	@Override
	public List<CouponVO> cpnGetMainCate() {
		return cpnDAO.cpnGetMainCate();
	}

	@Override
	public List<CouponVO> cpnGetSubCate(int mainno) {
		return cpnDAO.cpnGetSubCate(mainno);
	}

	@Override
	public int cpnAdInsert(CouponVO vo) {
		return cpnDAO.cpnAdInsert(vo);
	}
	
}
