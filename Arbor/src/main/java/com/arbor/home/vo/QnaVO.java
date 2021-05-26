package com.arbor.home.vo;

public class QnaVO {
	private int qnano;
	private String userid;
	private String qnacate;
	private String qnasubject;
	private String qnacontent;
	private int orderno;
	private int qnaorgno;
	private int qnastep;
	private int qnaprint;
	private String answercontent;
	private String qnadate;
	private String ansdate;
	private int countans;
	private String ansBtnCheck="N";
	
	public String getAnsBtnCheck() {
		return ansBtnCheck;
	}
	public void setAnsBtnCheck(String ansBtnCheck) {
		this.ansBtnCheck = ansBtnCheck;
	}
	public int getCountans() {
		return countans;
	}
	public void setCountans(int countans) {
		this.countans = countans;
	}
	public String getAnsdate() {
		return ansdate;
	}
	public void setAnsdate(String ansdate) {
		this.ansdate = ansdate;
	}
	public int getQnaorgno() {
		return qnaorgno;
	}
	public void setQnaorgno(int qnaorgno) {
		this.qnaorgno = qnaorgno;
	}
	public int getQnastep() {
		return qnastep;
	}
	public void setQnastep(int qnastep) {
		this.qnastep = qnastep;
	}
	public int getQnaprint() {
		return qnaprint;
	}
	public void setQnaprint(int qnaprint) {
		this.qnaprint = qnaprint;
	}
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQnacate() {
		return qnacate;
	}
	public void setQnacate(String qnacate) {
		this.qnacate = qnacate;
	}
	public String getQnasubject() {
		return qnasubject;
	}
	public void setQnasubject(String qnasubject) {
		this.qnasubject = qnasubject;
	}
	public String getQnacontent() {
		return qnacontent;
	}
	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public String getQnadate() {
		return qnadate;
	}
	public void setQnadate(String qnadate) {
		this.qnadate = qnadate;
	}
	
}
