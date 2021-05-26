package com.arbor.home.vo;

public class OptionVO {
	private int optno;
	private int pno;
	private String optname;
	private String optvalue;
	private String rgbvalue;
	private int optprice;
	// suborder 조인
	private int suborderno;
	private int quantity;
	
	
	public int getSuborderno() {
		return suborderno;
	}
	public void setSuborderno(int suborderno) {
		this.suborderno = suborderno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getOptno() {
		return optno;
	}
	public void setOptno(int optno) {
		this.optno = optno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getOptname() {
		return optname;
	}
	public void setOptname(String optname) {
		this.optname = optname;
	}
	public String getOptvalue() {
		return optvalue;
	}
	public void setOptvalue(String optvalue) {
		this.optvalue = optvalue;
	}
	public String getRgbvalue() {
		return rgbvalue;
	}
	public void setRgbvalue(String rgbvalue) {
		this.rgbvalue = rgbvalue;
	}
	public int getOptprice() {
		return optprice;
	}
	public void setOptprice(int optprice) {
		this.optprice = optprice;
	}
}
