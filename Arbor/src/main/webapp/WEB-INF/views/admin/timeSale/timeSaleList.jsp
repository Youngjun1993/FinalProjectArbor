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
	$("#j_timeSaleInsertBtn").click(function(){
		location.href="timeSaleInsert";
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>타임세일 목록</span></p>
		<div class="clearfix j_search">
			<form method="post" class="searchFrm" action="eventList">
				<select id="j_searchKey" name="searchKey">
					<option value="pNo">상품번호</option>
					<option value="pName">상품명</option>
				</select>
				<input type="text" name="searchWord" id="j_searchWordNow" placeholder="검색어 입력"/>
				<input type="submit" class="adminMainBtn" value="검색"/>
			</form>
		</div>
		<div>
		<ul class="clearfix" id="timeSaleList">
			<li>NO</li>
			<li>상품번호</li>
			<li>상품명</li>
			<li>상품가격</li>
			<li>할인가격</li>
			<li>이벤트 기간</li>
			
			<c:forEach var="vo" items="${list }">
				<li>${vo.saleNo }</li>
				<li>${vo.pNo }</li>
				<li class="wordcut"><a href="timeSaleView?saleNo=${vo.saleNo }">${vo.pName }</a></li>
				<li>${vo.pPrice }</li>
				<li>${vo.salePrice }</li>
				<li>${vo.saleStart } ~ ${vo.saleEnd }</li>
			</c:forEach>
		</ul>
		<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="j_timeSaleInsertBtn" value="등록"></p>
		</div>
	</div>
</div>
</body>
</html>