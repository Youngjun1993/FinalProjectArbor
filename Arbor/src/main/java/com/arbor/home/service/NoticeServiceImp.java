package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.NoticeVO;

public interface NoticeServiceImp {
	public List<NoticeVO> noticeList();
	public NoticeVO noticeView(int no);
	public int noticeInsert(NoticeVO vo);
	
}
