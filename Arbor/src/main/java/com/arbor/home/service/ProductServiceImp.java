package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.PageProductVO;
import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ProductQnaVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.SubCateVO;

public interface ProductServiceImp {
	/* 관리자, 사용자 공통 */
	
	// 대분류 불러오기 (여기저기서 씀)
	public List<MainCateVO> mainCateList();
	// 중분류 불러오기 (여기저기서 씀)
	public List<SubCateVO> subCateList(int mainno);
	
	/* paging */
	
	// 전체 레코드 수 구하기(productSearch)
	public int totalRecord(PageSearchVO vo);
	// (manageCate)
	public int subcate_totalRecord();
	// (pqna)
	public int pqna_totalRecord(PageSearchVO vo);
	// (pqnaNoAnswer)
	public int pqnaNoAnswerCnt(PageSearchVO vo);
	// (productList)
	public int productClientTotalRecord(PageProductVO vo);
	
	/* 사용자 */
	
	//상품목록 불러오기
		public List<ProductVO> productListClient(PageProductVO pageVo);
	// 목록에 사용할 rgb컬러 불러오기
	public List<OptionVO> productListRGB(int subno);
	// mainname 가져오기
	public String mainnameSelect(int mainno);
	// ProductView에 사용할 optname 가져오기
	public List<OptionVO> optNameSelect(int pno);
	// optname에 따른 optvalue 가져오기
	public List<OptionVO> optValueSelect(int pno);
	// 상품문의 등록하기
	public int pqnaInsert(ProductQnaVO vo);
	// 상품문의 확인을 위한 List
	public List<ProductQnaVO> pqnaViewList(int pno);
	// 해당 상품에 대한 리뷰목록 불러오기
	public List<QnaVO> qnaViewList(int pno);
	// 옵션번호로 정보 끌어오기
	public OptionVO productOptionView(int optno);
	// 리스트 탑3 정보 끌어오기
	public List<ProductVO> productTopList(int subno);
	
	/* 관리자 */
	
	// 중분류 불러오기 전체 (관리자 - 카테고리관리)
	public List<SubCateVO> subCateListAll(PageSearchVO pageVo);
	// 상품등록
	public int productInsert(ProductVO vo);
	// 옵션테이블 등록 (상품등록하면서 옵션테이블 같이 등록)
	public int optionInsert(OptionVO vo);
	// option 등록 위한 pno구해오기
	public int pnoSelect(int subno, String pname);
	// 상품 전체 목록 불러오기 (관리자 - 상품관리)
	public List<ProductVO> productList(PageSearchVO pageVo);
	// 날짜 기준으로 목록 불러오기 (관리자 - 상품관리)
	public List<ProductVO> productListDate(PageSearchVO pageVo);
	// 상품 수정 위한 pno에 따른 1개 정보 구해오기 (관리자 - 상품수정)
	public ProductVO productSelect(int pno);
	// optionList불러오기 (상품수정 위해 기존 List 뽑아오기)
	public List<OptionVO> optionSelect(int pno);
	// 상품 수정시 pvo 업데이트
	public int productUpdate(ProductVO pvo);
	// optionTbl 삭제 (optionNo로 한 줄 삭제) - 관리자 상품수정시 삭제된 옵션 delete
	public int optionDelete(int optno);
	// optiontbl 수정 (상품수정시 기존 option 수정분 update)
	public int optionUpdate(OptionVO vo);
	// 상품번호로 해당상품 삭제 (관리자 - 상품관리/ 삭제)
	public int productDelete(int pno);
	// 옵션테이블에 해당 상품번호에 해당하는 옵션 모두 삭제 (상품 삭제시 관련 옵션도 지워야 함 - 관리자/상품관리/삭제)
	public int optionAllDelete(int pno);
	// 상품문의 목록 불러오기
	public List<ProductQnaVO> pqnaList(PageSearchVO pageVo);
	// 상품문의 번호에 따라 내용 불러오기
	public ProductQnaVO pqnaAnswer(int pqnano);
	// 미답변글 리스트 받아오기
	public List<ProductQnaVO> pqnaNoAnswerList(PageSearchVO pageVo);
	// 상품문의 답변 등록하기
	public int pqnaAnswerInsert(ProductQnaVO vo);
	// 상품문의 답변 삭제하기
	public int pqnaAnswerDelete(int pqnano);
	// 대분류 등록하기
	public int insertMainCate(String editWord);
	// 중분류 등록하기
	public int insertSubCate(int mainno, String editWord);
	// 대분류 name으로 no 찾기
	public int selectMainno(String editWord);
	// 대분류 삭제하기
	public int deleteMainCate(int mainno);
	// 중분류 삭제하기
	public int deleteSubCate(int subno);
	// subno로 mainno 구하기
	public int selectSubno(int subno);
	// 대분류 수정하기
	public int updateMainCate(MainCateVO vo);
	// 중분류 수정하기
	public int updateSubCate(SubCateVO vo);
}
