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
 
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<!-- 회원검색 컨테이너-->
	<div class="h_memberSearch_header">탈퇴회원 검색</div>
	<div class="h_mainContainer">
		
	</div>
</div>


</body>
</html>