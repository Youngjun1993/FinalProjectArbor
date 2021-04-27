package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.EventDAOImp;
import com.arbor.home.vo.EventVO;
import com.arbor.home.vo.PrevNextVO;

@Service
public class EventService implements EventServiceImp {
	
	@Inject
	EventDAOImp eventdao;

	@Override
	public List<EventVO> eventList(EventVO vo) {
		return eventdao.eventList(vo);
	}

	@Override
	public EventVO eventSelect(int eventNo) {
		return eventdao.eventSelect(eventNo);
	}

	@Override
	public List<EventVO> closeEvent(EventVO vo) {
		return eventdao.closeEvent(vo);
	}

	@Override
	public PrevNextVO lagLeadSelect(int eventNo) {
		return eventdao.lagLeadSelect(eventNo);
	}

	@Override
	public List<EventVO> eventAllSelect(EventVO vo) {
		return eventdao.eventAllSelect(vo);
	}

	@Override
	public int eventInsert(EventVO vo) {
		return eventdao.eventInsert(vo);
	}

	@Override
	public EventVO getFilename(int eventNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int eventUpdate(EventVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eventDelete(int eventNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
