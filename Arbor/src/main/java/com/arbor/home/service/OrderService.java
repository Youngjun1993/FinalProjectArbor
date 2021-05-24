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
	public int couponCount(String userid, int subno) {
		return orderDAO.couponCount(userid, subno);
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
	public List<OrderTblVO> selectOrderList(PageSearchVO pageVo) {
		return orderDAO.selectOrderList(pageVo);
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
	
	public List<SubOrderVO> cartAppendList(int pno, String userid) {
		return orderDAO.cartAppendList(pno, userid);
	}

	@Override
	public SubOrderVO cartAppendChckList(int cartno, String userid) {
		return orderDAO.cartAppendChckList(cartno, userid);
	}

	@Override
	public List<SubOrderVO> cartAllList(String userid) {
		return orderDAO.cartAllList(userid);
	}
	
	/*	@Override
		public List<SubOrderVO> getSubOrderList(String orderNo) {
			return orderDAO.getSubOrderList(orderNo);
		}
	
		@Override
		public OrderTblVO getOrderInfo(String orderNo) {
			return getOrderInfo(orderNo);
		}*/

	@Override
	public int deleteCartList(int cartno, String userid) {
		return orderDAO.deleteCartList(cartno, userid);
	}

	@Override
	public int updateProductStock(int pno) {
		return orderDAO.updateProductStock(pno);
	}

	@Override
	public int setUsedPoint(OrderTblVO orderVo) {
		return orderDAO.setUsedPoint(orderVo);
	}

	@Override
	public int setPlusPoint(OrderTblVO orderVo) {
		return orderDAO.setPlusPoint(orderVo);
	}

	@Override
	public CouponVO cpnSelect(int cpnno) {
		return orderDAO.cpnSelect(cpnno);
	}

	@Override
	public List<SubOrderVO> getSubnoSelect(String userid) {
		return orderDAO.getSubnoSelect(userid);
	}

	
}
