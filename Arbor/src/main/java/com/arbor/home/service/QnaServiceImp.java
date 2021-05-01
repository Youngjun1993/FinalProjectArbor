package com.arbor.home.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PointVO;
import com.arbor.home.vo.QnaVO;
import com.arbor.home.vo.ReviewVO;

public interface QnaServiceImp {
	//Q&A 등록
	public int qnaInsert(QnaVO vo);
	//Q&A 뷰
	public QnaVO qnaSelect(int qnano);
	//Q&A 수정하기
	public int qnaUpdate(QnaVO vo);
	//Q&A 삭제
	public int qnaDelete(int no, String userid);
	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	
	/////////////Admin///////////////
	//답변등록
	public int qnaAdUpdate(int qnano, String answercontent);
	//미답변 건수
	public QnaVO qnaAdAnsCount();
	//한 페이지 레코드 선택
	public List<QnaVO> onePageRecordSelect(PageSearchVO vo);
	//삭제
	public ModelAndView qnaAdDel(int no);
	//미답변 리스트
	public List<QnaVO> noAnswerSelect(PageSearchVO vo);
	//미답변 총 레코드 수
	public int noAnswerTotal(PageSearchVO vo);
	//관리자 Q&A 삭제
	public int qnaAdDelete(int no);
	//관리자 총레코드 수
	public int admintotalRecord(PageSearchVO vo);
}
