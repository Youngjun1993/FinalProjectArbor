package com.arbor.home.vo;

import java.text.DecimalFormat;

public class PointVO {
	private int pointno;
	private String pointdate;
	private String pointcontent;
	private int point;
	private String userid;
	private int beforePoint;
	private int mfpoint;
	
	
	public int getPointno() {
		return pointno;
	}
	public void setPointno(int pointno) {
		this.pointno = pointno;
	}
	public int getBeforePoint() {
		return beforePoint;
	}
	public void setBeforePoint(int beforePoint) {
		this.beforePoint = beforePoint;
	}
	public String getPointdate() {
		return pointdate;
	}
	public void setPointdate(String pointdate) {
		this.pointdate = pointdate;
	}
	public String getPointcontent() {
		return pointcontent;
	}
	public void setPointcontent(String pointcontent) {
		this.pointcontent = pointcontent;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMfpoint() {
		return mfpoint;
	}
	public void setMfpoint(int mfpoint) {
		this.mfpoint = mfpoint;
	}	
}