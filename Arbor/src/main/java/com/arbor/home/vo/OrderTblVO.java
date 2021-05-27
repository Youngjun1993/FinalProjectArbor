package com.arbor.home.vo;


public class OrderTblVO {
	private int orderno;
	private String orderdate;
	
	private String userid;
	private String arr;
	
	private String arrtel;
	private String arrtel1;
	private String arrtel2;
	private String arrtel3;
	
	private String arrzipcode;
	private String arraddr;
	private String arrdetailaddr;
	
	private String request;
	
	private int pluspoint;
	private int usepoint;
	private String usecoupon;
	private int couponprice;
	
	private int deliveryprice;
	private int totalprice;
	
	private int applynum;
	private String imp_uid;	//취소할 거래의 아임포트 고유번호
	private String merchant_uid;	//가맹점에서 전달한 거래 고유번호
	
	private String status="";
	private String changestatus="";	
	
	private String pname;
	private int productcnt;
	
	private String username;
	private String tel;
	
	/* 주문관리 페이지 변수 */
	private int neworder;	//신규주문
	private int ready;		//배송준비
	private int delivery;	//배송중
	private int complete;	//배송완료
	
	/* 주문 리스트 검색 변수 */
	private String orderSearch_from="";
	private String orderSearch_to="";
	private String searchKey;
	private String searchWord="";	
	
	
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getArrtel() {
		arrtel = arrtel1 + "-" + arrtel2 + "-" + arrtel3;
		return arrtel;
	}
	public void setArrtel(String arrtel) {
		this.arrtel = arrtel;
		
		String[] t = arrtel.split("-");
		arrtel1 = t[0];
		arrtel2 = t[1];
		arrtel3 = t[2];
	}	
	public String getArrtel1() {
		return arrtel1;
	}
	public void setArrtel1(String arrtel1) {
		this.arrtel1 = arrtel1;
	}
	public String getArrtel2() {
		return arrtel2;
	}
	public void setArrtel2(String arrtel2) {
		this.arrtel2 = arrtel2;
	}
	public String getArrtel3() {
		return arrtel3;
	}
	public void setArrtel3(String arrtel3) {
		this.arrtel3 = arrtel3;
	}
	public String getArrzipcode() {
		return arrzipcode;
	}
	public void setArrzipcode(String arrzipcode) {
		this.arrzipcode = arrzipcode;
	}
	public String getArraddr() {
		return arraddr;
	}
	public void setArraddr(String arraddr) {
		this.arraddr = arraddr;
	}
	public String getArrdetailaddr() {
		return arrdetailaddr;
	}
	public void setArrdetailaddr(String arrdetailaddr) {
		this.arrdetailaddr = arrdetailaddr;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getPluspoint() {
		return pluspoint;
	}
	public void setPluspoint(int pluspoint) {
		this.pluspoint = pluspoint;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public String getUsecoupon() {
		return usecoupon;
	}
	public void setUsecoupon(String usecoupon) {
		this.usecoupon = usecoupon;
	}
	public int getCouponprice() {
		return couponprice;
	}
	public void setCouponprice(int couponprice) {
		this.couponprice = couponprice;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getApplynum() {
		return applynum;
	}
	public void setApplynum(int applynum) {
		this.applynum = applynum;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getChangestatus() {
		return changestatus;
	}
	public void setChangestatus(String changestatus) {
		this.changestatus = changestatus;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getProductcnt() {
		return productcnt;
	}
	public void setProductcnt(int productcnt) {
		this.productcnt = productcnt;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getNeworder() {
		return neworder;
	}
	public void setNeworder(int neworder) {
		this.neworder = neworder;
	}
	public int getReady() {
		return ready;
	}
	public void setReady(int ready) {
		this.ready = ready;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public String getOrderSearch_from() {
		return orderSearch_from;
	}
	public void setOrderSearch_from(String orderSearch_from) {
		this.orderSearch_from = orderSearch_from;
	}
	public String getOrderSearch_to() {
		return orderSearch_to;
	}
	public void setOrderSearch_to(String orderSearch_to) {
		this.orderSearch_to = orderSearch_to;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return "OrderTblVO [orderSearch_from=" + orderSearch_from + ", orderSearch_to=" + orderSearch_to + ", searchKey="
				+ searchKey + ", searchWord=" + searchWord + "]";
	}
	
}
