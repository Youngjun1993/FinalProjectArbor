package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.FaqVO;
import com.arbor.home.vo.NoticeVO;
import com.arbor.home.vo.PageSearchVO;

public interface FaqDAOImp {
	
	public List<FaqVO> faqList(PageSearchVO pageVO);//faq리스트
	public int totalRecord(PageSearchVO vo);//총레코드수
	public int faqInsert(FaqVO vo);//faq등록
	public FaqVO faqselect(int no);//faq선택
	public int faqEditOk(FaqVO vo);//faq수정
	public int faqDel(int no);//faq삭제
}
