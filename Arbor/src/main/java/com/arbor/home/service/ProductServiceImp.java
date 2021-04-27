package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;

public interface ProductServiceImp {
	// 대분류 불러오기
	public List<MainCateVO> mainCateList();
	// 중분류 불러오기
	public List<SubCateVO> subCateList(int mainno);
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
}
