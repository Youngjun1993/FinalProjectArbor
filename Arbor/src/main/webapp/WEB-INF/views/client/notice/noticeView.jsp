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
	<h1>공지사항</h1>
	<div id="d_viewBox">
		<div id="d_viewSubject">
			<h3>${noticeView.noticesubject }</h3>
		</div>
		<div>
			<span>Arbor |  ${noticeView.noticedate }</span>
		</div>
		<div>
			<span>${noticeView.noticecontent }</span>
		</div>
	</div>
</div>