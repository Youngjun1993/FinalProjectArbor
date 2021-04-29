package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.OrdsubOrdJoinVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.SubOrderVO;

public interface MyPageDAOImp {
	//구매내역 리스트
	public List<OrderTblVO> purchaseList(PageSearchVO vo);
	//구매내역 서브리스트
	public List<OrdsubOrdJoinVO> suborderList(int orderno);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	//레코드수, 쿠폰수, 적립금 합계
	public PointVO recordCountSum(String userid);
}
