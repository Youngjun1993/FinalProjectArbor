package com.arbor.home.event;

import java.util.List;

public interface EventDAOImp {
	/* client */
	public List<EventVO> eventList(EventVO vo);		//client-진행중인 이벤트 목록
	public EventVO eventSelect(int eventNo);	
	public List<EventVO> closeEvent(EventVO vo);	//지난 이벤트 목록
	public PrevNextVO lagLeadSelect(int eventNo);	//이전글, 다음글 선택
	
	
	/* admin */
	public List<EventVO> eventAllSelect(EventVO vo);	//이벤트 목록
	public int eventInsert(EventVO vo);					//이벤트 등록
	public EventVO getFilename(int eventNo);			//이벤트 수정시 이미지 파일명 얻어오기
	public int eventUpdate(EventVO vo);
	public int eventDelete(int eventNo);
	

}
