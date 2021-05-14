package com.arbor.home.vo;

public class SubOrderVO {
	private int suborderno;
	private int orderno;
	private int pno;
	private int optno;
	private int quantity;
	private int subprice;
	private String pname;
	
	private int pprice;
	private int saleprice;
	private int deliveryprice;
	
	
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
	
}
