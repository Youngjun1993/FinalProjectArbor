<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<script>
	$(function(){
		$("#j_eventListBtn").click(function(){
			location.href="event";
		});
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_eventMenu">
		<span>진행중인 이벤트</span>
	</div>
	<div id="j_eventTitle">
		2021 봄제품 사은품 증정
	</div>
	<div id="j_eventContent">
		<img src="<%=request.getContextPath()%>/img/eventSample.PNG">
	</div>
	<div id="j_contentList">
		▲ 이전글 : ㅇㄹㄴㅇㄹㄴㅇㄹ<br/>
		▼ 다음글 : ㄹㄴㅇㅎㄴㅇㅎㅇㄴ
	</div>
	<form action="event">
		<input type="button" value="목록" id="j_eventListBtn"/>
	</form>
</div>
</body>
</html>