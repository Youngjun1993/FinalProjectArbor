package com.arbor.home.vo;

public class ReviewVO {
   private int reviewno;
   private int pno;
   private String userid;
   private int grade;
   private String reviewcontent;
   private String reviewdate;
   
   private String username;
   
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public int getReviewno() {
      return reviewno;
   }
   public void setReviewno(int reviewno) {
      this.reviewno = reviewno;
   }
   public int getPno() {
      return pno;
   }
   public void setPno(int pno) {
      this.pno = pno;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public int getGrade() {
      return grade;
   }
   public void setGrade(int grade) {
      this.grade = grade;
   }
   public String getReviewcontent() {
      return reviewcontent;
   }
   public void setReviewcontent(String reviewcontent) {
      this.reviewcontent = reviewcontent;
   }
   public String getReviewdate() {
      return reviewdate;
   }
   public void setReviewdate(String reviewdate) {
      this.reviewdate = reviewdate;
   }
   
}