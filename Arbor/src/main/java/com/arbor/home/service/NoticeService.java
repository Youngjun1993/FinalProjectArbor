package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.NoticeDAOImp;
import com.arbor.home.vo.NoticeVO;
import com.arbor.home.vo.PageSearchVO;

@Service
public class NoticeService implements NoticeServiceImp {
	@Inject
	NoticeDAOImp noticeDAO;
	
	@Override
	public List<NoticeVO> noticeList(PageSearchVO pageVo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeList(pageVo);
	}

	@Override
	public NoticeVO noticeView(int no) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeView(no);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		
		return noticeDAO.noticeInsert(vo);
	}

	@Override
	public int noticeEditOk(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeEditOk(vo);
	}

	@Override
	public int boardDelete(int no) {
		// TODO Auto-generated method stub
		return noticeDAO.boardDelete(no);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		// TODO Auto-generated method stub
		return noticeDAO.totalRecord(vo);
	}



	

}
