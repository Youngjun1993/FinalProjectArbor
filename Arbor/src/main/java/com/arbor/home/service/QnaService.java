package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.dao.QnaDAOImp;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.QnaVO;

@Service
public class QnaService implements QnaServiceImp {
	
	@Inject
	QnaDAOImp qnaDAO;

	@Override
	public List<QnaVO> allList(PageSearchVO vo) {
		return qnaDAO.allList(vo);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		return qnaDAO.qnaInsert(vo);
	}

	@Override
	public QnaVO qnaSelect(int qnano) {
		return qnaDAO.qnaSelect(qnano);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		return qnaDAO.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(int no) {
		return qnaDAO.qnaDelete(no);
	}

	@Override
	public int qnaAdUpdate(int qnano, String answercontent) {
		return qnaDAO.qnaAdUpdate(qnano, answercontent);
	}

	@Override
	public QnaVO qnaAdAnsCount() {
		return qnaDAO.qnaAdAnsCount();
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return qnaDAO.totalRecord(vo);
	}

	@Override
	public List<QnaVO> onePageRecordSelect(PageSearchVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView qnaAdDel(int no) {
		return qnaDAO.qnaAdDel(no);
	}

	@Override
	public List<QnaVO> noAnswerSelect(PageSearchVO vo) {
		return qnaDAO.noAnswerSelect(vo);
	}

	@Override
	public int noAnswerTotal(PageSearchVO vo) {
		return qnaDAO.noAnswerTotal(vo);
	}
	
	

}