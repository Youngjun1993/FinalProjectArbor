package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.NoticeVO;
import com.arbor.home.vo.PageSearchVO;


public interface NoticeDAOImp {
	//client
	public List<NoticeVO> noticeList(PageSearchVO pageVo);
	public NoticeVO noticeView(int no);
	
	
	//admin
	public int noticeInsert(NoticeVO vo);
	public int noticeEditOk(NoticeVO vo);
	public int boardDelete(int no);

	public int totalRecord(PageSearchVO vo);//총레코드수
}
