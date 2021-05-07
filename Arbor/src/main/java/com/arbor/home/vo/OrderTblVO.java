package com.arbor.home.vo;

import java.text.DecimalFormat;

public class OrderTblVO {
	private int orderno;
	private String orderdate;
	private String userid;
	private String arr;
	
	private String arrtel;
	private String arrtel1;
	private String arrtel2;
	private String arrtel3;
	
	private String arrzipcode;
	private String arraddr;
	private String arrdetailaddr;
	
	private String request;
	
	private int pluspoint;
	private int usepoint;
	private String usecoupon;
	
	private String deliveryprice;
	private String totalprice;
	
	private String status;
	private String pname;
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getArrtel() {
		arrtel = arrtel1 + "-" + arrtel2 + "-" + arrtel3;
		return arrtel;
	}
	public void setArrtel(String arrtel) {
		this.arrtel = arrtel;
		
		String[] t = arrtel.split("-");
		arrtel1 = t[0];
		arrtel2 = t[1];
		arrtel3 = t[2];
	}	
	public String getArrtel1() {
		return arrtel1;
	}
	public void setArrtel1(String arrtel1) {
		this.arrtel1 = arrtel1;
	}
	public String getArrtel2() {
		return arrtel2;
	}
	public void setArrtel2(String arrtel2) {
		this.arrtel2 = arrtel2;
	}
	public String getArrtel3() {
		return arrtel3;
	}
	public void setArrtel3(String arrtel3) {
		this.arrtel3 = arrtel3;
	}
	public String getArrzipcode() {
		return arrzipcode;
	}
	public void setArrzipcode(String arrzipcode) {
		this.arrzipcode = arrzipcode;
	}
	public String getArraddr() {
		return arraddr;
	}
	public void setArraddr(String arraddr) {
		this.arraddr = arraddr;
	}
	public String getArrdetailaddr() {
		return arrdetailaddr;
	}
	public void setArrdetailaddr(String arrdetailaddr) {
		this.arrdetailaddr = arrdetailaddr;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getPluspoint() {
		return pluspoint;
	}
	public void setPluspoint(int pluspoint) {
		this.pluspoint = pluspoint;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public String getUsecoupon() {
		return usecoupon;
	}
	public void setUsecoupon(String usecoupon) {
		this.usecoupon = usecoupon;
	}
	public String getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.deliveryprice = formatter.format(deliveryprice);
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.totalprice = formatter.format(totalprice);
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
