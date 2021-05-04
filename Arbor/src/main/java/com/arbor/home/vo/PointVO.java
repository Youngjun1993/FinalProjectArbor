package com.arbor.home.vo;

import java.text.DecimalFormat;

public class PointVO {
	private int pointno;
	private String pointdate;
	private String pointcontent;
	private String point;
	private String userid;
	private String beforePoint;
	private String mfpoint;
	
	
	public int getPointno() {
		return pointno;
	}
	public void setPointno(int pointno) {
		this.pointno = pointno;
	}
	public String getBeforePoint() {
		return beforePoint;
	}
	public void setBeforePoint(int beforePoint) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.beforePoint = formatter.format(beforePoint);
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
	public String getPoint() {
		return point;
	}
	public void setPoint(int point) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.point = formatter.format(point);
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMfpoint() {
		return mfpoint;
	}
	public void setMfpoint(int mfpoint) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		this.mfpoint = formatter.format(mfpoint);
	}
	
	
	
}
