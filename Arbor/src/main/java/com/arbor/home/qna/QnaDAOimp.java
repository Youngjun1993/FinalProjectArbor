package com.arbor.home.qna;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface QnaDAOimp {
	//Q&A 리스트
	public List<QnaVO> allList(QnaPageSearchVO vo);
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
	public int totalRecord(QnaPageSearchVO vo);
	//한 페이지 레코드 선택
	public List<QnaVO> onePageRecordSelect(QnaPageSearchVO vo);
	//삭제
	public ModelAndView qnaAdDel(int no);
}
