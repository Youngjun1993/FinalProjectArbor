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
	<form method="post" name="inputForm" action = "">
		<table class="h_formtable">
		<tr><!-- 공백 --></tr>
		<!-- 아이디 -->
		<tr>
		<td>
		<label for="userid">아이디*</label>
		</td>
		<td>
		<input type="text" name="userid" id="userid" size="20px" class="h_ipt">
		<input type="button" id="idcheck" value="중복확인" class="h_check_btn">
		</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
		<td>
		<label for="pwd">비밀번호*</label>
		</td>
		<td>
		<input type="text" name="userpwd" id="userpwd" size="20px" class="h_ipt">(영문/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="pwdCheck">비밀번호 확인*</label>
		</td>
		<td>
		<input type="text" name="pwdCheck" id="pwdCheck" size="20px" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="username">이름*</label>
		</td>
		<td>
		<input type="text" name="username" id="username" size="20px" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="addr">주 소</label>
		</td>
		<td>
		<input type="text" name="zipcode" id="zipcode" size="5" class="h_ipt">
		<input type="button" id="zipcode" value="우편번호 찾기" class="h_check_btn">
		
	  	<input type="text" name="addr" id="addr" size="60" class="h_ipt"> 기본주소
		
		<input type="text" name="detailaddr" id="detailaddr" size="60" class="h_ipt"> 나머지 주소
		</td>
		</tr>
		
		<tr>
		<td>
		연락처
		</td>
		<td>
		<select id="tel" name="tel" class="h_select">
		<option value="010">010</option>
	  	<option value="011">011</option>
		<option value="02">02</option>
		</select>
		-<input type="text" name="tel1" size="5" class="h_ipt">
		-<input type="text" name="tel2" size="5" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="smsok">SMS수신 동의</label>
		</td>
	 	<td>
		<input type="radio" name="smsok" checked>예
		<input type="radio" name="smsno">아니오
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="email">이메일</label>
		</td>
		<td>
		<input type="text" name="email" id="email" size="10px" class="h_ipt"> @ 
		<select id="emaildomain" class="h_select">
		<option value=""></option>
		<option value="1">http://www.google.com</option>
		<option value="2">http://www.naver.com</option>
		<option value="3">http://www.daum.com</option>
		</select>
		<input type="button" id="emailcheck" value="중복확인" class="h_check_btn">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="emailok">이메일 수신동의</label>
		</td>
	 	<td>
		<input type="radio" name="emailok" checked>예
		<input type="radio" name="emailno">아니오
		</td>
		</tr>
		
		</table>
		<div class="h_terms"> 약관1234</div>
		
		<div class="h_privacy"> 약관2342</div>
		
		<input type="submit" id="memberjoin" value="Join NOW" class="h_check_btn join">
	</form>
    
	</div>
	</div>
</div>
</body>
</html>