package com.arbor.home.event;

import java.util.List;

public interface EventDAOImp {
	/* client */
	public List<EventVO> eventList();	//진행중인 이벤트 목록
	public List<EventVO> closeEvent();	//지난 이벤트
	
	
	/* admin */
	
	public int eventInsert(EventVO vo);	//이벤트 등록
	
}
