package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.ProductDAOImp;
import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.ProductVO;
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
	public List<ProductVO> productList() {
		return productDAO.productList();
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
	public List<SubCateVO> subCateListAll() {
		return productDAO.subCateListAll();
	}
}
