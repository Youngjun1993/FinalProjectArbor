package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.MyPageDAOImp;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SubOrderVO;

@Service
public class MyPageService implements MyPageServiceImp {

	@Inject
	MyPageDAOImp mypageDAO;

	@Override
	public List<OrderTblVO> purchaseList(PageSearchVO vo) {
		return mypageDAO.purchaseList(vo);
	}

	@Override
	public List<SubOrderVO> suborderList(int orderno) {
		return mypageDAO.suborderList(orderno);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return mypageDAO.totalRecord(vo);
	}

	@Override
	public List<SubOrderVO> orderPopup(int orderno) {
		return mypageDAO.orderPopup(orderno);
	}

}
