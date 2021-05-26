package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.NoticeVO;
import com.arbor.home.vo.PageSearchVO;

public interface NoticeServiceImp {
	public List<NoticeVO> noticeList(PageSearchVO pageVo);
	public NoticeVO noticeView(int no);
	public int noticeInsert(NoticeVO vo);
	public int noticeEditOk(NoticeVO vo);
	public int boardDelete(int no);
	
	public int totalRecord(PageSearchVO vo);//총레코드수
}
