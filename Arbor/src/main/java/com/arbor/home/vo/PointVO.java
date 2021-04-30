package com.arbor.home.vo;

import java.text.DecimalFormat;

public class PointVO {
	private String pointdate;
	private String pointcontent;
	private String point;
	private String userid;
	
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
	
	
}
