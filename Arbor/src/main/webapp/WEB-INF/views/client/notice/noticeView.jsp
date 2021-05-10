<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w1400_container clearfix">
	<h1>공지사항</h1>
	<ul>
		<li>${noticeView.noticesubject}<li>
		<li>아르보르 | ${noticeView.noticedate}<li>
		<li>${noticeView.noticecontent}</li>
	</ul>
</div>