package com.arbor.home.vo;

public class DibsVO {
	private int dibsno;
	private int pno;
	private String userid;
	private int quantity;
	private String optionvalue;
	private int price;
	private String dibsdate;
	
	// product 조인
	private String pname;
	private int stock;
	private String img1;
	private int pprice;
	private int saleprice;
	
	
	
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

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getDibsno() {
		return dibsno;
	}

	public void setDibsno(int dibsno) {
		this.dibsno = dibsno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getOptionvalue() {
		return optionvalue;
	}

	public void setOptionvalue(String optionvalue) {
		this.optionvalue = optionvalue;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDibsdate() {
		return dibsdate;
	}

	public void setDibsdate(String dibsdate) {
		this.dibsdate = dibsdate;
	}

	public DibsVO() {
		// TODO Auto-generated constructor stub
	}

}
