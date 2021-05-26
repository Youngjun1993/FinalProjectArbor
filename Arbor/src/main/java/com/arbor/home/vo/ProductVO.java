package com.arbor.home.vo;

public class ProductVO {

	private int pno;
	private int subno;
	private String pname;
	private int stock;
	private int allstock;
	private int pprice;
	private int saleprice;
	private String img1;
	private String img2;
	private String description;
	private int deliveryprice;
	private String pdate;
	
	private String subname;
	private int mainno;
	private String mainname;
	
	private int salepercent;
	
	public int getSalepercent() {
		return salepercent;
	}
	public void setSalepercent(int salepercent) {
		this.salepercent = salepercent;
	}
	public int getMainno() {
		return mainno;
	}
	public void setMainno(int mainno) {
		this.mainno = mainno;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getMainname() {
		return mainname;
	}
	public void setMainname(String mainname) {
		this.mainname = mainname;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getSubno() {
		return subno;
	}
	public void setSubno(int subno) {
		this.subno = subno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getAllstock() {
		return allstock;
	}
	public void setAllstock(int allstock) {
		this.allstock = allstock;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
}
