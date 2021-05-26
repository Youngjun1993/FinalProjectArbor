<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arbor > EventView</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/event.js"></script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>이벤트 상세보기</span></p>
		<div>
			<span class="j_category">제목</span> ${vo.eventSubject }<br/>
			<span class="j_category">이벤트 기간</span> ${vo.eventStart } ~ ${vo.eventEnd }<br/>
			<span class="j_category">타이틀 이미지</span> ${vo.eventImg1 }<br/>
			<br/><br/>
			<span id="j_contentImg">${vo.eventContent }</span>
			<hr/>
			<p class="j_eventSetBtn">
				<input type="button" class="adminMainBtn" onclick="location.href='eventEdit?eventNo=${vo.eventNo}'" id="j_eventEditBtn" value="수정"/> 
				<input type="button" class="adminSubBtn" onclick="javascript:eventDel(${vo.eventNo})" value="삭제"/> 
				<input type="button" class="adminSubBtn" id="j_eventListBtn" value="목록"/>
			</p>
		</div>
	</div>
</div>
</body>
</html>