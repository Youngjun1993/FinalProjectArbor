package com.arbor.home.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.QnaVO;

public interface QnaDAOImp {
	//Q&A 리스트
	public List<QnaVO> allList(PageSearchVO vo);
	//Q&A 등록
	public int qnaInsert(QnaVO vo);
	//Q&A 뷰
	public QnaVO qnaSelect(int qnano);
	//Q&A 수정하기
	public int qnaUpdate(QnaVO vo);
	//Q&A 삭제
	public int qnaDelete(int no);
	
	/////////////Admin///////////////
	//답변등록
	public int qnaAdUpdate(int qnano, String answercontent);
	//미답변 건수
	public QnaVO qnaAdAnsCount();
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	//한 페이지 레코드 선택
	public List<QnaVO> onePageRecordSelect(PageSearchVO vo);
	//삭제
	public ModelAndView qnaAdDel(int no);
	//미답변 리스트
	public List<QnaVO> noAnswerSelect(PageSearchVO vo);
	//미답변 총 레코드 수
	public int noAnswerTotal(PageSearchVO vo);
}
