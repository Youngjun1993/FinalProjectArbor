<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberLogin.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
</head>
<body>
<div class="w1400_container">

<div class="h_loginContainer">
	<div class="h_login"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
	<div class="h_half">
		<div class="h_content">
				<form action="loginOk" method="post">
					<input type="text" name="userid" id="userid" class="h_input" required="required" placeholder="아이디를 입력하세요" value="test">
					<input type="password" name="userpwd" id="userpwd" class="h_input" required="required" placeholder="비밀번호를 입력하세요" value="1234">
					<input type="checkbox" id="remember" class="h_checkbox">
					<label for="remember">Remember me</label>
					<div class="h_submit_wrap">
					<input type="submit" value="Join in" class="h_submit">
					<a href="#">Join us | Find ID | Find Password </a>
					</div>
				</form>
		</div>
	</div>
	<div class="h_half img">
	<img src="<%=request.getContextPath()%>/img/login_main.png"/>
	</div>
</div>
</div>
<script>
	 
</script>
</body>
</html>
