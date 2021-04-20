package com.arbor.home.qna;

import java.util.List;

public interface QnaDAOimp {
	//Q&A 리스트
	public List<QnaVO> allList();
	//Q&A 등록
	public int qnaInsert(QnaVO vo);
	//Q&A 뷰
	public QnaVO qnaSelect(int qnano);
	//Q&A 수정하기
	public int qnaUpdate(QnaVO vo);
	//Q&A 삭제
	public int qnaDelete(int no);
}
