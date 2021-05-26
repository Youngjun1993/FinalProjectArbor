package com.arbor.home.vo;

public class MemberQuitVO {
	
	private String userid;
	private String byetype;
	private String byereason;
	private String regdate;
	private String byedate;
	private int quitperiod;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getByetype() {
		return byetype;
	}
	public void setByetype(String byetype) {
		this.byetype = byetype;
	}
	public String getByereason() {
		return byereason;
	}
	public void setByereason(String byereason) {
		this.byereason = byereason;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getByedate() {
		return byedate;
	}
	public void setByedate(String byedate) {
		this.byedate = byedate;
	}
	public int getQuitperiod() {
		return quitperiod;
	}
	public void setQuitperiod(int quitperiod) {
		this.quitperiod = quitperiod;
	}
	
}
