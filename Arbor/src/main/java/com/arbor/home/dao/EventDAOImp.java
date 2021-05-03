package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.EventVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PrevNextVO;

public interface EventDAOImp {
	/* client */
	public List<EventVO> eventList(EventVO vo);		//진행중인 이벤트 목록
	public EventVO eventSelect(int eventNo);		//이벤트 뷰
	public List<EventVO> closeEvent(EventVO vo);	//지난 이벤트 목록
	public PrevNextVO lagLeadSelect(int eventNo);	//이전글, 다음글 선택
	
	
	/* admin */
	public List<EventVO> eventAllSelect(EventVO vo);	//이벤트 목록
	public int eventInsert(EventVO vo);					//이벤트 등록
	public EventVO getFilename(int eventNo);			//이벤트 수정시 이미지 파일명 얻어오기
	public int eventUpdate(EventVO vo);					//이벤트 수정
	public int eventDelete(int eventNo);				//이벤트 삭제
	public int totalRecord(PageSearchVO vo);			//총 레코드 수
	public List<EventVO> onePageRecordSelect(PageSearchVO pageVo);	//한 페이지 레코드 선택
	

}
