package com.arbor.home.vo;

import java.text.DecimalFormat;

public class CouponVO {
	private int cpnno;
	private String userid;
	private String cpnname;
	private String apply;
	private String salerate;
	private int salerateInt;
	private String cpnstart;
	private String cpnend;
	
	/*maincate, subcate 데이터 끌고오기*/
	private int mainno;
	private String mainname;
	private int subno;
	private String subname;
	/* couponad 추가 */
	private int cpnadno;
	
	
	public int getSalerateInt() {
		return salerateInt;
	}
	public void setSalerateInt(String salerate) {
		this.salerateInt = Integer.parseInt(salerate);
	}
	public int getCpnadno() {
		return cpnadno;
	}
	public void setCpnadno(int cpnadno) {
		this.cpnadno = cpnadno;
	}
	public int getMainno() {
		return mainno;
	}
	public void setMainno(int mainno) {
		this.mainno = mainno;
	}
	public String getMainname() {
		return mainname;
	}
	public void setMainname(String mainname) {
		this.mainname = mainname;
	}
	public int getSubno() {
		return subno;
	}
	public void setSubno(int subno) {
		this.subno = subno;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
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
	public String getSalerate() {
		return salerate;
	}
	public void setSalerate(String salerate) {
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
