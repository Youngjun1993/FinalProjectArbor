package com.arbor.home.vo;

public class PageSearchVO {
	private int pageNum=1;
	private int onePageNum=5;
	private int startPageNum=1;
	private int totalPage;
	private int totalRecord;
	private int onePageRecord=5;
	private int lastPageRecord;
	private String qnaSearchKey;
	private String qnaSearchWord;
	private String userid;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		startPageNum = ((pageNum-1)/onePageNum*onePageNum)+1;
	}
	public int getOnePageNum() {
		return onePageNum;
	}
	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		lastPageRecord = totalRecord%onePageRecord;
		if(lastPageRecord==0) {
			lastPageRecord = onePageRecord;
		}
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	public String getQnaSearchKey() {
		return qnaSearchKey;
	}
	public void setQnaSearchKey(String qnaSearchKey) {
		this.qnaSearchKey = qnaSearchKey;
	}
	public String getQnaSearchWord() {
		return qnaSearchWord;
	}
	public void setQnaSearchWord(String qnaSearchWord) {
		this.qnaSearchWord = qnaSearchWord;
	}
	
	
}
