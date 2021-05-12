package com.arbor.home.vo;

public class MemPagingCri {
	//페이징용 VO 여기에 다..? criteria
	private int pageNum;//페이지번호
	private int amount;//한페이지당 페이지 데이터
	private int skip;// 스킵할 게시물 수
	
	public MemPagingCri() {
        this(1,10);
        this.setSkip(0);
        
    }
    
	public MemPagingCri(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
        
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
	
}
