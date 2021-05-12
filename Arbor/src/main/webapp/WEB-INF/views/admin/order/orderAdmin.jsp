<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/orderAdmin.css" type="text/css"/>
<script>

</script>
</head>
<body>
<div class="1400_container font_ng">
	<div>	<!-- 주문현황 -->
		<ul>
			<li>신규주문 0건</li>
			<li>배송준비 0건</li>
			<li>배송중 0건</li>
			<li>배송완료 0건</li>
		</ul>
	</div>
	
	
	<div>	<!-- 주문 검색창 -->
		<span>주문일자</span>
		<ul>
			<li>당일</li>
			<li>일주일</li>
			<li>1개월</li>
			<li>3개월</li>
		</ul>
		<input type="text" name="" id="orderSearch_from" placeholder="시작일"/> ~ 
		<input type="text" name="" id="orderSearch2_to" placeholder="종료일"/>
		<br/><br/>
		<span>검색어</span>
		<select>
			<option>전체</option>
			<option>주문번호</option>
			<option>주문상태</option>
			<option></option>
			<option></option>
		</select>
	</div>
	
	
	<div>	<!-- 주문 리스트 -->
	
	</div>
	
	
</div>