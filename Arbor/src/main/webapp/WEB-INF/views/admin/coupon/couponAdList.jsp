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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/couponAd.css" type="text/css"/>
</head>
<body>
	<div id="y_adminCouponList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
        <div id="y_adminCouponList_rightcon" class="y_Adrightcon clearfix">
            <h2>쿠폰 관리</h2>
            <div class="clearfix">
                <div>
                    <span></span>
                </div>
                <div>
                    20%<br/>
                    DISCOUNT
                </div>
                <ul>
                    <li>행사쿠폰</li>
                    <li>기간 <b>2020/12/12~2020/12/12</b></li>
                    <li>적용품목 : <b>소파</b></li>
                    <li><button class="adminSubBtn">수정</button></li>
                </ul>
            </div>
            <div class="clearfix">
                <div>
                    <span></span>
                </div>
                <div>
                    30%<br/>
                    DISCOUNT
                </div>
                <ul>
                    <li>아아야아야아아쿠폰</li>
                    <li>기간 <b>2020/12/12~2020/12/12</b></li>
                    <li>적용품목 : <b>소파</b></li>
                    <li><button class="adminSubBtn">수정</button></li>
                </ul>
            </div>
            <div class="clearfix">
                <div>
                    <span></span>
                </div>
                <div>
                    10%<br/>
                    DISCOUNT
                </div>
                <ul>
                    <li>기념쿠폰</li>
                    <li>기간 <b>2020/12/12~2020/12/12</b></li>
                    <li>적용품목 : <b>소파</b></li>
                    <li><button class="adminSubBtn">수정</button></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>