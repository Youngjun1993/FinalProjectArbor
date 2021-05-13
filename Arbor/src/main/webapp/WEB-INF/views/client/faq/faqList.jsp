<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="w1400_container clearfix">
	<div id="d_board_top">
		<img src="<%=request.getContextPath()%>/img/d_boardimg.png"/>
		<div>
			<p>CUMMUNITY</p>
			<p>커뮤니티</p>
		</div>
	</div>
	<h1>자주하는질문(FAQ)</h1>
	<ul id="d_list" class="d_noticeList">
		<li><p>번호</p></li>
		<li>제목</li>
		<li>등록일</li>
	</ul>
	<ul class="d_noticeList">
		<c:forEach var="noticeList" items="${noticeList}">
		<li><p>${noticeList.noticeno }</p></li>
		<li class="wordcut"><a href="noticeView?no=${noticeList.noticeno }">${noticeList.noticesubject }</a></li>
		<li>${noticeList.noticedate }</li>
		</c:forEach>
	</ul>
</div>
