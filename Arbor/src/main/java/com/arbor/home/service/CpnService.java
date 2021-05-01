package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.CouponDAOImp;

@Service
public class CpnService implements CpnServiceImp {
	@Inject
	CouponDAOImp cpnDAO;
}
