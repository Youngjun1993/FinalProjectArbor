package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.OrderDAOImp;
import com.arbor.home.vo.CartVO;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.SubOrderVO;

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

	@Override
	public int orderComplete(OrderTblVO orderVo) {
		return orderDAO.orderComplete(orderVo);
	}

	@Override
	public int createSubOrderList(SubOrderVO subVo) {
		return orderDAO.createSubOrderList(subVo);
	}

	@Override
	public int getOrderSeq() {
		return orderDAO.getOrderSeq();
	}

	@Override
	public List<SubOrderVO> getSubOrderList(String orderNo) {
		return orderDAO.getSubOrderList(orderNo);
	}

	@Override
	public OrderTblVO getOrderInfo(String orderNo) {
		return orderDAO.getOrderInfo(orderNo);
	}

	@Override
	public List<CartVO> cartAppendList(int pno, String userid) {
		return orderDAO.cartAppendList(pno, userid);
	}

	@Override
	public CartVO cartAppendChckList(int cartno, String userid) {
		return orderDAO.cartAppendChckList(cartno, userid);
	}

	@Override
	public List<CartVO> cartAllList(String userid) {
		return orderDAO.cartAllList(userid);
	}
	
}
