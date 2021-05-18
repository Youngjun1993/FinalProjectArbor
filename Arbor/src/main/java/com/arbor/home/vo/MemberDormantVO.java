package com.arbor.home.vo;

public class MemberDormantVO {
	
	private String userid;
	private String username;
	private String email;
	private String emailid;
	private String emaildomain;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String dortype;
	private String dormailok;
	
	private String regdate;	
	private String dordate;
	
	private String emailok;
	private String smsok;
	
	public String getEmailok() {
		return emailok;
	}
	public void setEmailok(String emailok) {
		this.emailok = emailok;
	}
	public String getSmsok() {
		return smsok;
	}
	public void setSmsok(String smsok) {
		this.smsok = smsok;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getEmaildomain() {
		return emaildomain;
	}
	public void setEmaildomain(String emaildomain) {
		this.emaildomain = emaildomain;
	}
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
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		
		email = emailid+"@"+emaildomain;
		
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		
		String e[] = email.split("@");
		emailid = e[0];
		emaildomain = e[1];
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDordate() {
		return dordate;
	}
	public void setDordate(String dordate) {
		this.dordate = dordate;
	}
	
	public String getDortype() {
		return dortype;
	}
	public void setDortype(String dortype) {
		this.dortype = dortype;
	}
	public String getDormailok() {
		return dormailok;
	}
	public void setDormailok(String dormailok) {
		this.dormailok = dormailok;
	}
	
	@Override
	public String toString() {
		return "MemberDormantVO [userid=" + userid + ", username=" + username + ", email=" + email + ", emailid="
				+ emailid + ", emaildomain=" + emaildomain + ", tel=" + tel + ", tel1=" + tel1 + ", tel2=" + tel2
				+ ", tel3=" + tel3 + ", dortype=" + dortype + ", dormailok=" + dormailok + ", regdate=" + regdate
				+ ", dordate=" + dordate + ", emailok=" + emailok + ", smsok=" + smsok + "]";
	}
	
}
