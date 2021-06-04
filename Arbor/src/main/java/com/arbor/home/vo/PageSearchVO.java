package com.arbor.home.vo;

public class PageSearchVO {
	private int pageNum=1;
	private int onePageNum=5;
	private int startPageNum=1;
	private int totalPage;
	private int totalRecord;
	private int onePageRecord=10;
	private int lastPageRecord;
	private String searchKey;
	private String searchWord="";
	private String userid;
	
	/* Admin - productController */
	private String startdate;
	private String enddate;
	private int subno;
	private int mainno;
	
	/* Admin - OrderController */
	private String orderSearch_from="";
	private String orderSearch_to="";
	private String status;

	/* Admin - memberDormant */
	private String smsok;
	private String emailok;
	private String dormailok;

	/* Admin - SalesController */
	private String sales_from="";
	private String sales_to="";
	
	public int getMainno() {
		return mainno;
	}
	public void setMainno(int mainno) {
		this.mainno = mainno;
	}
	public String getSmsok() {
		return smsok;
	}
	public void setSmsok(String smsok) {
		this.smsok = smsok;
	}
	public String getEmailok() {
		return emailok;
	}
	public void setEmailok(String emailok) {
		this.emailok = emailok;
	}
	public String getDormailok() {
		return dormailok;
	}
	public void setDormailok(String dormailok) {
		this.dormailok = dormailok;
	}
	
	/*Admin review 정렬*/
	private String sort;
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getSubno() {
		return subno;
	}
	public void setSubno(int subno) {
		this.subno = subno;
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
	public String getOrderSearch_from() {
		return orderSearch_from;
	}
	public void setOrderSearch_from(String orderSearch_from) {
		this.orderSearch_from = orderSearch_from;
	}
	public String getOrderSearch_to() {
		return orderSearch_to;
	}
	public void setOrderSearch_to(String orderSearch_to) {
		this.orderSearch_to = orderSearch_to;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSales_from() {
		return sales_from;
	}
	public void setSales_from(String sales_from) {
		this.sales_from = sales_from;
	}
	public String getSales_to() {
		return sales_to;
	}
	public void setSales_to(String sales_to) {
		this.sales_to = sales_to;
	}
	@Override
	public String toString() {
		return "PageSearchVO [pageNum=" + pageNum + ", onePageNum=" + onePageNum + ", startPageNum=" + startPageNum
				+ ", totalPage=" + totalPage + ", totalRecord=" + totalRecord + ", onePageRecord=" + onePageRecord
				+ ", lastPageRecord=" + lastPageRecord + ", searchKey=" + searchKey + ", searchWord=" + searchWord
				+ ", userid=" + userid + ", startdate=" + startdate + ", enddate=" + enddate + ", subno=" + subno
				+ ", mainno=" + mainno + ", orderSearch_from=" + orderSearch_from + ", orderSearch_to=" + orderSearch_to
				+ ", status=" + status + ", smsok=" + smsok + ", emailok=" + emailok + ", dormailok=" + dormailok
				+ ", sales_from=" + sales_from + ", sales_to=" + sales_to + ", sort=" + sort + "]";
	}
	
	
}
