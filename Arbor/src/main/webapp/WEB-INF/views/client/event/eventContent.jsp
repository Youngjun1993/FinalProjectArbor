<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
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
		<c:if test="${vo.eventEnd > today}">
			진행중인 이벤트
		</c:if>
		<c:if test="${vo.eventEnd < today}">
			지난 이벤트		
		</c:if>
	</div>
	<div id="j_eventTitle">
		${vo.eventSubject }
	</div>
	<div id="j_eventContent">
		${vo.eventContent }
	</div>
	<!-- 이전글, 다음글 : 진행중인 이벤트 상세페이지에서만 보이도록 설정 -->
	<c:if test="${vo.eventEnd > today }">
		<div id="j_contentList">
			<b>▲ 이전글</b> : 
			<c:if test="${pnList.prevNo==0 }">
				${pnList.prevSubject }
			</c:if>
			<c:if test="${pnList.prevNo>0 }">
				<a href="eventContent?eventNo=${pnList.prevNo }">${pnList.prevSubject }</a>
			</c:if>
			<br/>
			<b>▼ 다음글</b> :
			<c:if test="${pnList.nextNo==0 }">
				${pnList.nextSubject }
			</c:if>
			<c:if test="${pnList.nextNo>0 }">
				<a href="eventContent?eventNo=${pnList.nextNo }">${pnList.nextSubject }</a>
			</c:if>
		</div>
	</c:if>
	<form action="event">
		<input type="button" value="목록" id="j_eventListBtn"/>
	</form>
</div>
</body>
</html>