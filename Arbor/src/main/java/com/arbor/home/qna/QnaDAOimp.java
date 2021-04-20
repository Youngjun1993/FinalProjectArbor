package com.arbor.home.qna;

import java.util.List;

public interface QnaDAOimp {
	//Q&A 리스트
	public List<QnaVO> allList();
	//Q&A 등록
	public int qnaInsert(QnaVO vo);
	//Q&A 뷰
	public QnaVO qnaSelect(int qnano);
}
