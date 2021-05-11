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
<script>
	$(function(){
		// 수정버튼 이벤트
		$(".y_viewCoupon>ul li:last-child button").click(function(){
			/* $(this).parent().parent().parent().css({
				"display":"none"
			}) */
			$(this).parent().parent().parent().css("display","none");
			$(".y_viewCoupon>ul li:last-child button").attr("disabled", true)
			$(".y_viewCoupon>ul li:last-child button").removeClass("adminSubBtn");
			$(".y_viewCoupon>ul li:last-child button").addClass("y_disabledBtn");
			$(this).parent().parent().parent().next().fadeIn()
		});
		// 완료버튼 이벤트
		$(".y_inputCoupon>form").submit(function(){
			$(this).parent().css("display","none")
			$(".y_viewCoupon>ul li:last-child button").attr("disabled", false)
			$(".y_viewCoupon>ul li:last-child button").removeClass("y_disabledBtn");
			$(".y_viewCoupon>ul li:last-child button").addClass("adminSubBtn");
			$(this).parent().prev().css("display","none")
		});
	});
</script>
<body>
	<div id="y_adminCouponList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
        <div id="y_adminCouponList_rightcon" class="y_Adrightcon clearfix">
            <h2>쿠폰 관리</h2>
            <div class="y_viewCoupon clearfix">
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
            <div class="y_inputCoupon">
            	<form action="">
            		<div>
	                    <span></span>
	                </div>
	                <div>
	                    <input type="text" value="20"><br/>
	                    DISCOUNT
	                </div>
	                <ul>
	                    <li><input type="text" value="행사쿠폰"></li>
	                    <li>기간 <input type="text" value="2020/12/12">~<input type="text" value="2020/12/12"></b></li>
	                    <li>적용품목 : <input type="text" value="소파"></li>
	                    <li><input type="submit" class="adminSubBtn" value="완료"></li>
	                </ul>
            	</form>
            </div>
            <div class="y_viewCoupon clearfix">
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
            <div class="y_inputCoupon">
            	<form action="">
            		<div>
	                    <span></span>
	                </div>
	                <div>
	                    <input type="text" value="20"><br/>
	                    DISCOUNT
	                </div>
	                <ul>
	                    <li><input type="text" value="행사쿠폰"></li>
	                    <li>기간 <input type="text" value="2020/12/12">~<input type="text" value="2020/12/12"></b></li>
	                    <li>적용품목 : <input type="text" value="소파"></li>
	                    <li><input type="submit" class="adminSubBtn" value="완료"></li>
	                </ul>
            	</form>
            </div>
        </div>
    </div>
</body>
</html>