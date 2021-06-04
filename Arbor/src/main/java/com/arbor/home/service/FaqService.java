package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.FaqDAOImp;
import com.arbor.home.vo.FaqVO;
import com.arbor.home.vo.PageSearchVO;

@Service
public class FaqService implements FaqServiceImp {
	@Inject
	FaqDAOImp faqDAO;
	
	@Override
	public List<FaqVO> faqList(PageSearchVO pageVO) {
		return faqDAO.faqList(pageVO);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return faqDAO.totalRecord(vo);
	}

	@Override
	public int faqInsert(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqDAO.faqInsert(vo);
	}

	@Override
	public int faqEditOk(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqDAO.faqEditOk(vo);
	}

	@Override
	public FaqVO faqselect(int no) {
		// TODO Auto-generated method stub
		return faqDAO.faqselect(no);
	}

	@Override
	public int faqDel(int no) {
		// TODO Auto-generated method stub
		return faqDAO.faqDel(no);
	}

}
