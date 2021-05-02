package com.arbor.home.vo;

public class TimeSaleVO {
	private int saleNo;
	private int pPrice;
	private String saleContent;
	private String saleStart;
	private String saleEnd;
	private String salePrice;
	
	private int pNo;
	private String pName;

	
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getSaleContent() {
		return saleContent;
	}
	public void setSaleContent(String saleContent) {
		this.saleContent = saleContent;
	}
	public String getSaleStart() {
		return saleStart;
	}
	public void setSaleStart(String saleStart) {
		this.saleStart = saleStart;
	}
	public String getSaleEnd() {
		return saleEnd;
	}
	public void setSaleEnd(String saleEnd) {
		this.saleEnd = saleEnd;
	}
	public String getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}	
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	
}
