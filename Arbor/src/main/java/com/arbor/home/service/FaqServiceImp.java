package com.arbor.home.service;


import java.util.List;

import com.arbor.home.vo.FaqVO;
import com.arbor.home.vo.PageSearchVO;

public interface FaqServiceImp {
	
	public List<FaqVO> faqList(PageSearchVO pageVO);//게시판리스트
	public int totalRecord(PageSearchVO vo);//총레코드수
}
