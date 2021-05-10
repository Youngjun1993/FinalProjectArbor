package com.arbor.home.vo;

public class CartVO {
	private int cartno;
	private int pno;
	private String userid;
	private int quantity;
	private String optionvalue;
	private int price;
	
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

	public CartVO() {
		// TODO Auto-generated constructor stub
	}

}
