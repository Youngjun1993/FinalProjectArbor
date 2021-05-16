package com.arbor.home.vo;

public class CartVO {
	private int cartno;
	private int pno;
	private String userid;
	private int quantity;
	private String optionvalue;
	private int price;
	private int quantitySum;
	private int totalPrice;
	//장바구니 추가
	private int optsumprice;
	private int optquantity;
	private int point;
	private int totalquantity;
	private int totaldeliv;
	private int totalpoint;
	private int totalprice;
	
	//product테이블 조인
	private String pname;
	private int stock;
	private String img1;
	private int saleprice;
	
	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public int getOptsumprice() {
		return optsumprice;
	}

	public void setOptsumprice(int optsumprice) {
		this.optsumprice = optsumprice;
	}

	public int getOptquantity() {
		return optquantity;
	}

	public void setOptquantity(int optquantity) {
		this.optquantity = optquantity;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalquantity() {
		return totalquantity;
	}

	public void setTotalquantity(int totalquantity) {
		this.totalquantity = totalquantity;
	}

	public int getTotaldeliv() {
		return totaldeliv;
	}

	public void setTotaldeliv(int totaldeliv) {
		this.totaldeliv = totaldeliv;
	}

	public int getTotalpoint() {
		return totalpoint;
	}

	public void setTotalpoint(int totalpoint) {
		this.totalpoint = totalpoint;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getQuantitySum() {
		return quantitySum;
	}

	public void setQuantitySum(int quantitySum) {
		this.quantitySum = quantitySum;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
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

}
