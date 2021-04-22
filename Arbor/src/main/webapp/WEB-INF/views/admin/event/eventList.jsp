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
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm" id="j_listFrm">
		<h1>이벤트 목록</h1>
		<ul class="clearfix" id="eventList">
			<li>NO</li>
			<li>이벤트 타이틀</li>
			<li>이벤트 기간</li>
			<li>등록일</li>
			
			<c:forEach var="vo" items="${list }">
				<li>${vo.eventNo }</li>
				<li class="wordcut">${vo.eventSubject }</li>
				<li>${vo.eventStart } ~ ${vo.eventEnd }</li>
				<li>등록일</li>
			</c:forEach>
		</ul>
	</div>

</div>
</body>
</html>