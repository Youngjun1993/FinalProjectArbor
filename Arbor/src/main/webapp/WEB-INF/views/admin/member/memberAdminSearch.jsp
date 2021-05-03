<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>

</head>
<body>
<div class="w1400_container clearfix">

	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<!-- 관리자공통메뉴 -->
	
	<!-- 회원검색 컨테이너-->
	<div class="h_memberSearch_header">회원 검색</div>
	<div class="h_mainContainer">
	<form method="get" action="memberSearch">
	<table class="h_formtable">
	<!-- 검색어 -->
	<tr>
		<td>
		<label for="userid">검색어</label>
		</td>
		<td>
		<select name="searchCate" id="searchCate" class="h_searchSelect">
			<option value="userid">아이디</option>
			<option value="username">성명</option>
			<option value="email">이메일</option>
		</select>
		<input type="text" name="searchWord" id="memSearchWord" size="20px" class="h_ipt">
		</td>
	<!-- 이메일수신여부 -->
		<tr>
		<td>
		<label for="emailok">이메일 수신 여부</label>
		</td>
	 	<td>
	 	<input type="radio" name="emailok" class="h_radiochk" value="All" checked>전체
		<input type="radio" name="emailok" class="h_radiochk" value="Y">예
		<input type="radio" name="emailok" class="h_radiochk" value="N">아니오
		</td>
		</tr>
	<!-- 문자수신여부 -->
		<tr>
		<td>
		<label for="userid">문자수신여부</label>
		</td>
		<td class="h_last_td">
		<select name="smsok" id="smsok" class="h_searchSelect">
			<option value=""></option>
			<option value="Y">예</option>
			<option value="N">아니오</option>
		</select>
		</td>
	</tr>
	</table>
	<div class="h_searchBtnBox"><input type="submit" id="memSearchBtn" value="검색" class="adminMainBtn"></div>	
	</form>
	<hr/>
	<!-- 폼 가운데 버튼 -->
		<div class= "h_searchMultiBtn">
			<input type="button" id="" value="문자발송" class="adminSubBtn">
			<input type="button" id="" value="엑셀다운" class="adminSubBtn">
			<input type="button" id="" value="버튼2" class="adminSubBtn">
		</div>
	<!-- 회원목록 -->
	
	<ul class="clearfix">
		
		<li class="h_listHeader">선택</li>
		<li class="h_listHeader">아이디</li>
		<li class="h_listHeader">성명</li>
		<li class="h_listHeader">이메일</li>
		<li class="h_listHeader">연락처</li>
		<li class="h_listHeader">가입일</li>
		<li class="h_listHeader">최근접속일</li>
		<li class="h_listHeader">관리</li>
		
	<c:forEach var="vo" items="${list}">
		<li><input type="checkbox" name="memberChk" value="vo번호"/></li>
		<li>${vo.userid}</li>
		<li>${vo.username}</li>
		<li class="wordcut">${vo.email}</li>
		<li>${vo.tel}</li>
		<li>${vo.regdate}</li>
		<li>${vo.lastdate},${vo.smsok }+${vo.emailok }</li>
		<li><input type="button" name="memberDelBtn" value="삭제"/></li>
	</c:forEach>
	</ul>
	</div>
</div>

</body>
</html>




	



