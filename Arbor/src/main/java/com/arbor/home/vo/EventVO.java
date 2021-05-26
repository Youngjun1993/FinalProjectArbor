package com.arbor.home.vo;

public class EventVO {
	
	private int eventNo;
	private String eventSubject;
	private String eventContent;
	private String eventStart;
	private String eventEnd;
	private String eventImg1;
	private String eventImg2;
	private String eventDate;
	
	private String eventType;
	private int typeNo;
	
	
	/*----------- 검색 -----------*/
	private String searchKey;
	private String searchWord;
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	///////////////////////////////
	
	
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventSubject() {
		return eventSubject;
	}
	public void setEventSubject(String eventSubject) {
		this.eventSubject = eventSubject;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getEventStart() {
		return eventStart;
	}
	public void setEventStart(String eventStart) {
		this.eventStart = eventStart;
	}
	public String getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}
	public String getEventImg1() {
		return eventImg1;
	}
	public void setEventImg1(String eventImg1) {
		this.eventImg1 = eventImg1;
	}
	public String getEventImg2() {
		return eventImg2;
	}
	public void setEventImg2(String eventImg2) {
		this.eventImg2 = eventImg2;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	
}
