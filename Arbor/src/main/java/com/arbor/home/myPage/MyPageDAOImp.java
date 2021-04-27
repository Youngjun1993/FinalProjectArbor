package com.arbor.home.myPage;

import java.util.List;

import com.arbor.home.PageSearchVO;
import com.arbor.home.orderTbl.OrderTblVO;
import com.arbor.home.subOrder.SubOrderVO;

public interface MyPageDAOImp {
	//구매내역 리스트
	public List<OrderTblVO> purchaseList(PageSearchVO vo);
	//상품상세 팝업 리스트
	public List<OrdsubOrdJoinVO> suborderList(int orderno);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
}
