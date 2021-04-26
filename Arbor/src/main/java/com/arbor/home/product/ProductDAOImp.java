package com.arbor.home.product;

import java.util.List;

import com.arbor.home.mainCate.MainCateVO;
import com.arbor.home.optionTbl.OptionVO;
import com.arbor.home.subCate.SubCateVO;

public interface ProductDAOImp {
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
}
