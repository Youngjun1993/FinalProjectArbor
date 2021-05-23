package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.DibsVO;
import com.arbor.home.vo.PageDibsVO;
import com.arbor.home.vo.PageSearchVO;

public interface DibsDAOImp {
	/* 상품상세 -> 찜하기 버튼 클릭시 insert */
	public int dibsInsert(DibsVO vo);
	// 찜목록 전체 리스트
	public List<DibsVO> onePageRecordSelect(PageDibsVO vo);
	// 찜목록 옵션 리스트
	public List<DibsVO> dibsList(String userid);
	//총 레코드 수
	public int totalRecord(PageDibsVO vo);
	//상품별 결제금액
	public int dibsPrice(int pno, String userid);
	// 장바구니에 추가
	public int dibsInsertInCart(int pno, String userid);
	// 찜목록 삭제
	public int dibsDelete(int pno, String userid);
	// 찜목록 insert 전 중복체크
	public int dibsMiniList(DibsVO vo);
	// 찜목록 insert 전 중복체크 (옵션 null인경우)
	public int dibsMiniListNull(DibsVO vo);
}
