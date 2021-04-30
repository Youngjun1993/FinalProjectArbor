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
<script>
	$("#j_insertBtn").click(function(){
		location.href="eventInsert";
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm">
		<h1 class="j_adminMemu">이벤트 목록</h1>
		<div class="clearfix j_search">
			<form method="post" class="searchFrm" action="eventList">
				<select id="j_searchKey" name="searchKey">
					<option value="eventSubject">제목</option>
					<option value="eventContent">내용</option>
				</select>
				<input type="text" name="searchWord" id="j_searchWordNow" placeholder="검색어 입력"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
		<div>
		<ul class="clearfix" id="eventList">
			<li>NO</li>
			<li></li>
			<li>이벤트 타이틀</li>
			<li>이벤트 기간</li>
			<li>등록일</li>
			
			<c:forEach var="vo" items="${list }">
				<li>${vo.eventNo }</li>
				<li></li>
				<li class="wordcut"><a href="eventView?eventNo=${vo.eventNo }">${vo.eventSubject }</a></li>
				<li>${vo.eventStart } ~ ${vo.eventEnd }</li>
				<li>${vo.eventDate }</li>
			</c:forEach>
		</ul>
		<p class="j_eventSetBtn"><input type="button" id="j_insertBtn" value="이벤트 등록"></p>
		</div>
	</div>
</div>
</body>
</html>