package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.PointVO;

public interface OrderDAOImp {
	public MemberVO getMemberInfo(String userid);
	public PointVO getUserPoint(String userid);
	public List<CouponVO> getUserCoupon(String userid);
	public int getCouponCount(String userid);
}
