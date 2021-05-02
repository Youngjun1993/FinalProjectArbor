package com.arbor.home.vo;

import java.text.DecimalFormat;

public class CouponVO {
	private int cpnno;
	private String userid;
	private String cpnname;
	private String apply;
	private String available;
	private int salerate;
	private String cpnstart;
	private String cpnend;
	public int getCpnno() {
		return cpnno;
	}
	public void setCpnno(int cpnno) {
		this.cpnno = cpnno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCpnname() {
		return cpnname;
	}
	public void setCpnname(String cpnname) {
		this.cpnname = cpnname;
	}
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		int availableInt = Integer.parseInt(available);
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.available = formatter.format(availableInt);
	}
	public int getSalerate() {
		return salerate;
	}
	public void setSalerate(int salerate) {
		this.salerate = salerate;
	}
	public String getCpnstart() {
		return cpnstart;
	}
	public void setCpnstart(String cpnstart) {
		this.cpnstart = cpnstart;
	}
	public String getCpnend() {
		return cpnend;
	}
	public void setCpnend(String cpnend) {
		this.cpnend = cpnend;
	}
	
	
}
