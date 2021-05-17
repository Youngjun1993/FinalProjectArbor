package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.OrderDAOImp;
import com.arbor.home.vo.CartVO;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubOrderVO;

@Service
public class OrderService implements OrderServiceImp {
	@Inject
	OrderDAOImp orderDAO;
	
	@Override
	public SubOrderVO getProductInfo(int pno) {
		return orderDAO.getProductInfo(pno);
	}
	
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
	public List<SubOrderVO> getSubOrderList(int orderNo) {
		return orderDAO.getSubOrderList(orderNo);
	}

	@Override
	public OrderTblVO getOrderInfo(int orderNo) {
		return orderDAO.getOrderInfo(orderNo);
	}

	@Override
	public List<OrderTblVO> selectOrderList(OrderTblVO orderVo) {
		return orderDAO.selectOrderList(orderVo);
	}

	@Override
	public OrderTblVO countOfOrderStatus(OrderTblVO orderVo) {
		return orderDAO.countOfOrderStatus(orderVo);
	}

	@Override
	public int updateOrderStatus(int orderno, String status) {
		return orderDAO.updateOrderStatus(orderno, status);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return orderDAO.totalRecord(vo);
	}

	@Override
	public MemberVO getUserInfo(int orderno) {
		return orderDAO.getUserInfo(orderno);
	}
	
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
	public List<SubOrderVO> getSubOrderList(String orderNo) {
		return getSubOrderList(orderNo);
	}

	@Override
	public OrderTblVO getOrderInfo(String orderNo) {
		return getOrderInfo(orderNo);
	}

	
}
