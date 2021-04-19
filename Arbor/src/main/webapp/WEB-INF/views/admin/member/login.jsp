<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberLogin.css" type="text/css" />

</head>
<body>
<div class="w1400_container">
<div class="h_login">
	<h1>로그인 폼</h1>
	<form method="post" action="loginOk">
	아이디 <input type = "text" name ="userid"/><br/>
	비밀번호	<input type = "password" name ="userpwd"/><br/>
	<input type="submit" value="LOGIN"/>
	</form>
</div>
</div>
</body>
</html>