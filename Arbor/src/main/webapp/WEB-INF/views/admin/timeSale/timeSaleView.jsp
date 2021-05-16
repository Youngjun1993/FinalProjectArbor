<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/timeSale.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script>
	$(function(){
		$("#j_tsEditBtn").click(function(){
			location.href="timeSaleEdit?saleNo=${vo.saleNo}";
		});
		$("#j_tsDelBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="timeSaleDelete?saleNo=${vo.saleNo}";							
			}
		});
		$("#j_tsListBtn").click(function(){
			location.href="timeSaleList";
		});
		/*
		var msg = "";
		if(${msg}!=null){
			alert(${msg});
		}
		*/
		
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>타임세일</span></p>
		<div>
			<span class="j_category">TIMESALE No.</span> ${vo.saleNo }<br/>
			<span class="j_category">상품번호</span> ${vo.pNo }<br/>
			<span class="j_category">상품명</span> ${vo.pName }<br/>
			<span class="j_category">상품가격</span> ${vo.pPrice }<br/>
			<span class="j_category">할인가격</span> ${vo.salePrice }<br/>
			<span class="j_category">이벤트 기간</span> ${vo.saleStart } ~ ${vo.saleEnd }
			<br/><br/>
			<span id="j_saleContent">${vo.saleContent }</span>
		<hr/>
		<p class="j_eventSetBtn">
			<input type="button" class="adminMainBtn" id="j_tsEditBtn" value="수정"/> 
			<input type="button" class="adminSubBtn" id="j_tsDelBtn" value="삭제"/>
			<input type="button" class="adminSubBtn" id="j_tsListBtn" value="목록"/>
		</p>
		</div>
	</div>
</div>
</body>
</html>