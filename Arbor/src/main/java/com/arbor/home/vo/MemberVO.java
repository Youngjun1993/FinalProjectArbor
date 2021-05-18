package com.arbor.home.vo;

public class MemberVO {
	
	private String userid;
	private String userpwd;
	private String username;
	
	private String zipcode;
	private String addr;
	private String detailaddr;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String smsok;
	
	private String email;
	private String emailid;
	private String emaildomain;
	private String emailok;
	
	private String regdate;
	private String lastdate;
	private String dordate;
	
	private int memstat;
	
	//다중선택
	private String[] userList;
	
	
	public String[] getUserList() {
		return userList;
	}
	public void setUserList(String[] userList) {
		this.userList = userList;
	}
	
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getSmsok() {
		return smsok;
	}
	public void setSmsok(String smsok) {
		this.smsok = smsok;
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
	public String getEmailok() {
		return emailok;
	}
	public void setEmailok(String emailok) {
		this.emailok = emailok;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getMemstat() {
		return memstat;
	}
	public void setMemstat(int memstat) {
		this.memstat = memstat;
	}
	public String getDordate() {
		return dordate;
	}
	public void setDordate(String dordate) {
		this.dordate = dordate;
	}
	
	
}
