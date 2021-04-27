package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SubOrderVO;

public interface MyPageDAOImp {
	//구매내역 리스트
	public List<OrderTblVO> purchaseList(PageSearchVO vo);
	//구매내역 서브리스트
	public List<SubOrderVO> suborderList(int orderno);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	//상품상세 팝업 리스트
	public List<SubOrderVO> orderPopup(int orderno);
}
