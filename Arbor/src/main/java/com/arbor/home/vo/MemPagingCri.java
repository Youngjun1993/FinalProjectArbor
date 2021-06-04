package com.arbor.home.vo;

public class MemPagingCri {
	//페이징용 VO 여기에 다..? criteria
	private int pageNum;//페이지번호
	private int amount;//한페이지당 페이지 데이터
	private int skip;// 스킵할 게시물 수
	
	//검색 데이터저장용
	private String searchWord;
	
	//검색타입 searchCate
	private String type;
	//검색타입 배열
	private String[] typeArr;
	
	//회원검색페이지
	private String emailok;
	private String smsok;
	
	//휴면페이지
	private String dormailok;
	
	//삭제페이지 탈퇴기간과 탈퇴일 검색
	private String byetype;
	private int byedate1;
	private int byedate2;
	private int quitperiod;
	
	public MemPagingCri() {
        this(1,10);
        this.setSkip(0);
        
    }
	public MemPagingCri(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
        
    }
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	public String[] getTypeArr() {
		return typeArr;
	}
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
	
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
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
    public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		
		this.skip = (pageNum-1)*this.amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public String getDormailok() {
		return dormailok;
	}
	public void setDormailok(String dormailok) {
		this.dormailok = dormailok;
	}
	public String getByetype() {
		return byetype;
	}
	public void setByetype(String byetype) {
		this.byetype = byetype;
	}
	public int getQuitperiod() {
		return quitperiod;
	}
	public void setQuitperiod(int quitperiod) {
		this.quitperiod = quitperiod;
	}
	public int getByedate1() {
		return byedate1;
	}
	public void setByedate1(int byedate1) {
		this.byedate1 = byedate1;
	}
	public int getByedate2() {
		return byedate2;
	}
	public void setByedate2(int byedate2) {
		this.byedate2 = byedate2;
	}
	
	
}
