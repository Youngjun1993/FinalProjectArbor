package com.arbor.home.vo;

public class SubOrderVO {
	private int suborderno;
	private int orderno;
	private int pno;
	private int optno;
	private int quantity;
	private int subprice;
	
	private String pname;
	private String img1;
	private int pprice;
	private int saleprice;
	private int deliveryprice;
	private String optinfo;
	
	public int getSuborderno() {
		return suborderno;
	}
	public void setSuborderno(int suborderno) {
		this.suborderno = suborderno;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getOptno() {
		return optno;
	}
	public void setOptno(int optno) {
		this.optno = optno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSubprice() {
		return subprice;
	}
	public void setSubprice(int subprice) {
		this.subprice = subprice;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getOptinfo() {
		return optinfo;
	}
	public void setOptinfo(String optinfo) {
		this.optinfo = optinfo;
	}
	@Override
	public String toString() {
		return "SubOrderVO [suborderno=" + suborderno + ", orderno=" + orderno + ", pno=" + pno + ", optno=" + optno
				+ ", quantity=" + quantity + ", subprice=" + subprice + ", pname=" + pname + ", img1=" + img1
				+ ", pprice=" + pprice + ", saleprice=" + saleprice + ", deliveryprice=" + deliveryprice + ", optinfo="
				+ optinfo + "]";
	}
	
}
