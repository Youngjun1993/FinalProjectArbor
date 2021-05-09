<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arbor > EventList</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/event.js"></script>
</head>
<body>
<div class="w1400_container font_ng clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>이벤트 목록</span></p>
		<div class="clearfix j_search">
			<form method="post" class="j_searchFrm" action="eventList">
				<select name="searchKey" id="j_searchKey">
					<option value="eventSubject">제목</option>
					<option value="eventContent">내용</option>
				</select>
				<input type="text" name="searchWord" placeholder="검색어 입력"/>
				<input type="submit" class="adminMainBtn" value="검색"/>
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
		<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="j_insertBtn" value="이벤트 등록"></p>
		</div>
		<ul class="adPaging clearfix">
			<c:if test="${pageVO.pageNum>1 }">
				<li style="border-bottom:none;"><a class="pagingAdLR_a" href="eventList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
			</c:if>
			<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
				<c:if test="${p<=pageVO.totalPage }">
					<c:if test="${p==pageVO.pageNum }">
						<li style="border-bottom:3px solid rgb(191,43,53);"><a href="eventList?pageNum=${p }">${p }</a></li>
					</c:if>
					<c:if test="${p!=pageVO.pageNum }">
						<li><a href="eventList?pageNum=${p }">${p }</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pageVO.pageNum<pageVO.totalPage }">
				<li style="border-bottom:none;"><a class="pagingAdLR_a" href="eventList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>