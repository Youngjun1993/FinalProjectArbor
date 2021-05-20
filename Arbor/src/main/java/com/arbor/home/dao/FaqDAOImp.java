package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.FaqVO;
import com.arbor.home.vo.PageSearchVO;

public interface FaqDAOImp {
	
	public List<FaqVO> faqList(PageSearchVO pageVO);//faq리스트
	public int totalRecord(PageSearchVO vo);//총레코드수
}
