package com.arbor.home.vo;

public class ExchangeVO {
	private int exchanno;
	private int orderno;
	private int suborderno;
	private String exchanselect;
	private String exchancontent;
	private String username;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String addr;
	private String detailaddr;
	private String zipcode;
	private String userid;
	
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public int getExchanno() {
		return exchanno;
	}
	public void setExchanno(int exchanno) {
		this.exchanno = exchanno;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getSuborderno() {
		return suborderno;
	}
	public void setSuborderno(int suborderno) {
		this.suborderno = suborderno;
	}
	public String getExchanselect() {
		return exchanselect;
	}
	public void setExchanselect(String exchanselect) {
		this.exchanselect = exchanselect;
	}
	public String getExchancontent() {
		return exchancontent;
	}
	public void setExchancontent(String exchancontent) {
		this.exchancontent = exchancontent;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		tel = tel1 + "-" + tel2 + "-" + tel3;
		
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String[] t = tel.split("-");
		tel1 = t[0];
		tel2 = t[1];
		tel3 = t[2];
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
