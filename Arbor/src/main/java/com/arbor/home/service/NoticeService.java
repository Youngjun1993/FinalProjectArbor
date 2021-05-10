package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.NoticeDAOImp;
import com.arbor.home.vo.NoticeVO;

@Service
public class NoticeService implements NoticeServiceImp {
	@Inject
	NoticeDAOImp noticeDAO;
	
	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return noticeDAO.noticeList();
	}

	@Override
	public NoticeVO noticeView(int no) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeView(no);
	}

}
