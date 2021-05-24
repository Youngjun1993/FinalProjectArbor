<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name = "viewport" content = "width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberJoin.css" type="text/css" />
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
	$(function(){
		$('#setId').click(function(){
			//opener : 현재 윈도우를 열어준 객체
			opener.document.getElementById("userid").value = $('#checkId').text();
			opener.document.getElementById("hiddenCheck").value = "Y";
			self.close();//window.close();
		});
		$('#frm').submit(function(){
			if($('#userid').val()==""){
				alert("아이디 입력 후 중복검사하세요..");
				return false;
			}
			
		});
	});
</script>

<body>
	<div style="margin:5px 5px;">
		<div id="h_idcheck_banner">
			<p id="idCheckTitle"><img src="<%=request.getContextPath() %>/img/logo_transparent.png"/></p>
		</div>
		<div id ="h_confirm_div">
		<c:if test="${checkResult eq 'Y'}">
			<span style="color:rgb(93, 121, 115)" id="checkId">${userid}</span>은 사용가능한 아이디 입니다.
			<input type="button" value="아이디 사용하기" id="setId" class="clientSubBtn"/>
		</c:if>
		<c:if test="${checkResult eq 'N'}">
		<span style="color:rgb(191,43,53); font-weight:bold">${userid}</span>&nbsp;은(는) 이미 존재하는 아이디 입니다.
		</c:if>
		</div>
		<hr/>
		
		<h3>아이디를 입력 후 중복 검사버튼 누르세요</h3><br>
		<div id ="h_confirm_div2">
			<form method="post" id="frm" action="<%=request.getContextPath() %>/idcheck" >
				아이디&nbsp;<input type="text" name="userid" id="userid" class="h_ipt"/>
				<input type="submit" value="중복검사 다시하기" class="clientSubBtn"/>
			</form>
		</div>
	</div>
	
</body>
</html>