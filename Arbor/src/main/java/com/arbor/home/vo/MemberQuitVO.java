package com.arbor.home.vo;

public class MemberQuitVO {
	private String userid;
	private String byetype;
	private String byereason;
	private int regdate;
	private int byedate;
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
	public int getRegdate() {
		return regdate;
	}
	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}
	public int getByedate() {
		return byedate;
	}
	public void setByedate(int byedate) {
		this.byedate = byedate;
	}
	public int getQuitperiod() {
		return quitperiod;
	}
	public void setQuitperiod(int quitperiod) {
		this.quitperiod = quitperiod;
	}
	
}
