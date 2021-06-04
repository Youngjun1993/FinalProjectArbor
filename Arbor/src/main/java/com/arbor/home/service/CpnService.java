package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.CouponDAOImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.PageSearchVO;

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

	@Override
	public List<CouponVO> cpnAdList(PageSearchVO vo) {
		return cpnDAO.cpnAdList(vo);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return cpnDAO.totalRecord(vo);
	}

	@Override
	public int cpnAdUpdate(CouponVO vo) {
		return cpnDAO.cpnAdUpdate(vo);
	}

	@Override
	public int cpnAdDelete(int cpnadno) {
		return cpnDAO.cpnAdDelete(cpnadno);
	}

	@Override
	public int cpnAllDelete() {
		return cpnDAO.cpnAllDelete();
	}

	@Override
	public int cpnClientUpdate(CouponVO vo) {
		return cpnDAO.cpnClientUpdate(vo);
	}
	
}
