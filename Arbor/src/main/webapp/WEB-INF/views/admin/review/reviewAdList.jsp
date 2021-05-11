<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/reviewAd.css" type="text/css"/>
</head>
<body>
	<div id="y_adminReviewList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	    <div id="y_adminReviewList_rightcon" class="y_Adrightcon">
	        <h2>상품후기 관리</h2>
	        <div>
	            <form method="get" action="reviewList">
	                후기검색
	                <select name="reviewSubCate" id="reviewSubCate">
	                    <option value="">중분류 목록</option>
	                </select>
	                <select name="seachKey" id="seachKey">
	                    <option value="">카테고리</option>
	                    <option value="">상품명</option>
	                    <option value="">작성일</option>
	                </select>
	                <input type="text" name="searchWord" id="searchWord">
	                <input type="submit" class="adminMainBtn" value="검색">
	            </form>
	        </div>
	        <div>
	            <div class="clearfix">
	                <button class="adminSubBtn">선택삭제</button>
	                <p>총 <span class="y_reviewAdRed">2</span>개</p>
	            </div>
	            <ul class="clearfix">
	                <li><input type="checkbox"></li>
	                <li>상품명</li>
	                <li>리뷰내용</li>
	                <li>평점</li>
	                <li>등록일</li>
	            </ul>
	            <ul class="clearfix">
	                <li><input type="checkbox"></li>
	                <li>상품명</li>
	                <li>리뷰내용</li>
	                <li>평점</li>
	                <li>등록일</li>
	            </ul>
	        </div>
	    </div>
	</div>
</body>
</html>