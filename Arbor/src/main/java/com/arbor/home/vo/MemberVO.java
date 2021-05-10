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
	
	private int memstat;
	
	//다중선택
	private String[] userList;
	
	//검색 데이터저장용	
	private String searchCate;
	private String searchWord;
	
	//페이징용 VO 여기에 다..? criteria
	
	private int pageNum = 2;//페이지번호
	private int amount = 10;//한페이지당 페이지 데이터
	
	//PageDTO 인터페이스 페이지수(화면아래)
	
	private int startPage;
	private int endPage;
	
	private boolean prev, next;
	private int total;
	

	public MemberVO() {
		
	}
	
	//pageDTO
	public MemberVO(int total) {
		
		System.out.println("페이지넘값 " + pageNum);
		System.out.println(amount);
		
		this.total = total;
		
		this.endPage = (int)(Math.ceil(pageNum/10.0)*10);
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/amount));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}
	///////////////////////
	
	
	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public String[] getUserList() {
		return userList;
	}
	public void setUserList(String[] userList) {
		this.userList = userList;
	}
	
	public String getSearchCate() {
		return searchCate;
	}
	public void setSearchCate(String searchCate) {
		this.searchCate = searchCate;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
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
	
	
	
}
