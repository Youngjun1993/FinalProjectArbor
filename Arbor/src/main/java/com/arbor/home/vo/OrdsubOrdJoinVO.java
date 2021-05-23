package com.arbor.home.vo;

import java.text.DecimalFormat;

public class OrdsubOrdJoinVO {
	private int orderno;
	private String orderdate;
	private String userid;
	private String arr;
	private String arraddr;
	private String arrtel;
	private String arrzipcode;
	private String arrdetailaddr;
	private String request;
	private int pluspoint;
	private int usepoint;
	private String usecoupon = "-";
	private String deliveryprice;
	private String totalprice;
	private String status;
	private String pname;
	private int subno;
	private int pno;
	private int optno;
	private int quantity;
	private String subprice;
	private String couponprice="0";
	private String img1;
	private String optinfo;
	
	
	public String getOptinfo() {
		return optinfo;
	}
	public void setOptinfo(String optinfo) {
		this.optinfo = optinfo;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getCouponprice() {
		return couponprice;
	}
	public void setCouponprice(int couponprice) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.couponprice = formatter.format(couponprice);
	}
	public String getArraddr() {
		return arraddr;
	}
	public void setArraddr(String arraddr) {
		this.arraddr = arraddr;
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
		return arrtel;
	}
	public void setArrtel(String arrtel) {
		this.arrtel = arrtel;
	}
	public String getArrzipcode() {
		return arrzipcode;
	}
	public void setArrzipcode(String arrzipcode) {
		this.arrzipcode = arrzipcode;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getSubno() {
		return subno;
	}
	public void setSubno(int subno) {
		this.subno = subno;
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
	public String getSubprice() {
		return subprice;
	}
	public void setSubprice(int subprice) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.subprice = formatter.format(subprice);
	}
	
}
