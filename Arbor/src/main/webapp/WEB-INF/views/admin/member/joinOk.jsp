<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberJoin.css" type="text/css" />

</head>
<body>
<div class="w1400_container">
	<div class="h_formcontainer">
	<div class="h_jointop"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
			<!-- 아이디 <input type="text" id="userid" class="" maxlength="20"/>
			비밀번호 <input type="password" id="userpwd" class=""/>
			비밀번호 확인 <input type="password" id="pwdconfirm" class=""/>
			이름 <input type="text" id="username" class=""/>
			주소 <input type="text" id="useraddr1" class=""/>
			<input type="text" id="useraddr2" class=""/> 기본주소
			<input type="text" id="useraddr3" class=""/> 나머지주소
			연락처 
			SMS수신동의 
			이메일
			인증번호
			이메일 수신동의 -->
	<div class ="h_formbox">
		<img src="<%=request.getContextPath() %>/img/okcheck.png"/>
		<h3 class="h_check_headline">회원가입이 완료 되었습니다</h3>
		로그인 후 모든 서비스를 이용하실 수 있습니다.
	</div>
	<div class="h_check_btn_box">
		<input type="button" name="tohome" value="홈으로" class="h_check_btn joinok" onclick = "location.href = '/home'"/>
		<input type="button" name="tologin" value="로그인" class="h_check_btn joinok" onclick = "location.href = '/home/login'"/>
	</div>
	</div>
</div>
</body>
</html>