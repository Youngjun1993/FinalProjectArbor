package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;

public interface ProductDAOImp {
	// 대분류 불러오기
	public List<MainCateVO> mainCateList();
	// 중분류 불러오기
	public List<SubCateVO> subCateList(int mainno);
	// 중분류 불러오기 전체
	public List<SubCateVO> subCateListAll();
	// 상품등록
	public int productInsert(ProductVO vo);
	// 옵션테이블 등록
	public int optionInsert(OptionVO vo);
	// option 등록 위한 pno구해오기
	public int pnoSelect(int subno, String pname);
	// 상품목록 불러오기
	public List<ProductVO> productList();
	// 수정 위한 pno에 따른 정보 불러오기
	public ProductVO productSelect(int pno);
	// optionList불러오기
	public List<OptionVO> optionSelect(int pno);
	// pvo 업데이트
	public int productUpdate(ProductVO pvo);
	// optionTbl 삭제 (optionNo로 한 줄 삭제)
	public int optionDelete(int optno);
	// optiontbl 수정
	public int optionUpdate(OptionVO vo);
	// 상품번호로 해당상품 삭제
	public int productDelete(int pno);
	// 옵션테이블에 해당 상품번호에 해당하는 옵션 모두 삭제
	public int optionAllDelete(int pno);
}
