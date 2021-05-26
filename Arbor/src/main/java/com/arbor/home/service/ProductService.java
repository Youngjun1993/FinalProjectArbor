package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.ProductDAOImp;
import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.PageProductQnaVO;
import com.arbor.home.vo.PageProductReviewVO;
import com.arbor.home.vo.PageProductVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ProductQnaVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.SubCateVO;

@Service
public class ProductService implements ProductServiceImp {

	@Inject
	ProductDAOImp productDAO;

	@Override
	public List<MainCateVO> mainCateList() {
		return productDAO.mainCateList();
	}

	@Override
	public List<SubCateVO> subCateList(int mainno) {
		return productDAO.subCateList(mainno);
	}

	@Override
	public int productInsert(ProductVO vo) {
		return productDAO.productInsert(vo);
	}

	@Override
	public int optionInsert(OptionVO vo) {
		return productDAO.optionInsert(vo);
	}

	@Override
	public int pnoSelect(int subno, String pname) {
		return productDAO.pnoSelect(subno, pname);
	}

	@Override
	public List<ProductVO> productList(PageSearchVO pageVo) {
		return productDAO.productList(pageVo);
	}

	@Override
	public ProductVO productSelect(int pno) {
		return productDAO.productSelect(pno);
	}

	@Override
	public List<OptionVO> optionSelect(int pno) {
		return productDAO.optionSelect(pno);
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		return productDAO.productUpdate(pvo);
	}

	@Override
	public int optionDelete(int optno) {
		return productDAO.optionDelete(optno);
	}

	@Override
	public int optionUpdate(OptionVO vo) {
		return productDAO.optionUpdate(vo);
	}

	@Override
	public int productDelete(int pno) {
		return productDAO.productDelete(pno);
	}

	@Override
	public int optionAllDelete(int pno) {
		return productDAO.optionAllDelete(pno);
	}

	@Override
	public List<SubCateVO> subCateListAll(PageSearchVO pageVo) {
		return productDAO.subCateListAll(pageVo);
	}

	@Override
	public List<ProductVO> productListClient(PageProductVO pageVo) {
		return productDAO.productListClient(pageVo);
	}

	@Override
	public List<OptionVO> productListRGB(int subno) {
		return productDAO.productListRGB(subno);
	}

	@Override
	public String mainnameSelect(int mainno) {
		return productDAO.mainnameSelect(mainno);
	}

	@Override
	public List<OptionVO> optNameSelect(int pno) {
		return productDAO.optNameSelect(pno);
	}

	@Override
	public List<OptionVO> optValueSelect(int pno) {
		return productDAO.optValueSelect(pno);
	}

	@Override
	public int pqnaInsert(ProductQnaVO vo) {
		return productDAO.pqnaInsert(vo);
	}

	@Override
	public List<ProductQnaVO> pqnaList(PageSearchVO pageVo) {
		return productDAO.pqnaList(pageVo);
	}

	@Override
	public ProductQnaVO pqnaAnswer(int pqnano) {
		return productDAO.pqnaAnswer(pqnano);
	}

	@Override
	public int pqnaNoAnswerCnt(PageSearchVO pageVo) {
		return productDAO.pqnaNoAnswerCnt(pageVo);
	}

	@Override
	public int pqnaAnswerInsert(ProductQnaVO vo) {
		return productDAO.pqnaAnswerInsert(vo);
	}

	@Override
	public int pqnaAnswerDelete(int pqnano) {
		return productDAO.pqnaAnswerDelete(pqnano);
	}

	@Override
	public List<ProductQnaVO> pqnaViewList(PageProductQnaVO pageVO) {
		return productDAO.pqnaViewList(pageVO);
	}

	@Override
	public List<QnaVO> qnaViewList(PageProductReviewVO pageVO) {
		return productDAO.qnaViewList(pageVO);
	}

	@Override
	public OptionVO productOptionView(int optno) {
		return productDAO.productOptionView(optno);
	}

	@Override
	public int totalRecord(PageSearchVO pageVo) {
		return productDAO.totalRecord(pageVo);
	}

	@Override
	public List<ProductVO> productListDate(PageSearchVO pageVo) {
		return productDAO.productListDate(pageVo);
	}

	@Override
	public int subcate_totalRecord() {
		return productDAO.subcate_totalRecord();
	}

	@Override
	public int pqna_totalRecord(PageSearchVO pageVo) {
		return productDAO.pqna_totalRecord(pageVo);
	}

	@Override
	public List<ProductQnaVO> pqnaNoAnswerList(PageSearchVO pageVo) {
		return productDAO.pqnaNoAnswerList(pageVo);
	}

	@Override
	public int insertMainCate(String editWord) {
		return productDAO.insertMainCate(editWord);
	}

	@Override
	public int insertSubCate(int mainno, String editWord) {
		return productDAO.insertSubCate(mainno, editWord);
	}

	@Override
	public int selectMainno(String editWord) {
		return productDAO.selectMainno(editWord);
	}

	@Override
	public int deleteMainCate(int mainno) {
		return productDAO.deleteMainCate(mainno);
	}

	@Override
	public int deleteSubCate(int subno) {
		return productDAO.deleteSubCate(subno);
	}

	@Override
	public int selectSubno(int subno) {
		return productDAO.selectSubno(subno);
	}

	@Override
	public int updateMainCate(MainCateVO vo) {
		return productDAO.updateMainCate(vo);
	}

	@Override
	public int updateSubCate(SubCateVO vo) {
		return productDAO.updateSubCate(vo);
	}

	@Override
	public int productClientTotalRecord(PageProductVO vo) {
		return productDAO.productClientTotalRecord(vo);
	}

	@Override
	public List<ProductVO> productTopList(int subno) {
		return productDAO.productTopList(subno);
	}

	@Override
	public List<ProductVO> productListClientOrder(PageProductVO pageVo) {
		return productDAO.productListClientOrder(pageVo);
	}

	@Override
	public List<ProductVO> productTotalList(int mainno) {
		return productDAO.productTotalList(mainno);
	}

	@Override
	public ProductVO productCateImgSelect(int mainno) {
		return productDAO.productCateImgSelect(mainno);
	}

	@Override
	public List<ProductVO> productCateTop12() {
		return productDAO.productCateTop12();
	}

	@Override
	public ProductVO productSubCateImgSelect(int subno) {
		return productDAO.productSubCateImgSelect(subno);
	}

	@Override
	public String subnameSelect(int subno) {
		return productDAO.subnameSelect(subno);
	}

	@Override
	public int pqnaUpdate(ProductQnaVO vo) {
		return productDAO.pqnaUpdate(vo);
	}

	@Override
	public int pqnaDelete(int pqnano, String userid) {
		return productDAO.pqnaDelete(pqnano, userid);
	}

	@Override
	public int qnaViewListCnt(int pno) {
		return productDAO.qnaViewListCnt(pno);
	}

	@Override
	public int pqnaViewListCnt(int pno) {
		return productDAO.pqnaViewListCnt(pno);
	}
	

	
	
}
