package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.NoticeVO;


public interface NoticeDAOImp {
	public List<NoticeVO> noticeList();
	public NoticeVO noticeView(int no);
	public int noticeInsert(NoticeVO vo);
}
