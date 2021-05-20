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

}
