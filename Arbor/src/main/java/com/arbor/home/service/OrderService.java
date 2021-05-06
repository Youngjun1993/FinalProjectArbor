package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.OrderDAOImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.PointVO;

@Service
public class OrderService implements OrderServiceImp {
	@Inject
	OrderDAOImp orderDAO;
	
	@Override
	public MemberVO getMemberInfo(String userid) {
		return orderDAO.getMemberInfo(userid);
	}

	@Override
	public PointVO getUserPoint(String userid) {
		return orderDAO.getUserPoint(userid);
	}

	@Override
	public List<CouponVO> getUserCoupon(String userid) {
		return orderDAO.getUserCoupon(userid);
	}

	@Override
	public int getCouponCount(String userid) {
		return orderDAO.getCouponCount(userid);
	}
	
}
