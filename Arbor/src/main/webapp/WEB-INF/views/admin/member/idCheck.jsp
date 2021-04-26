<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name = "viewport" content = "width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
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
	<c:if test="${!checkResult}">
		<span style="color:red" id="checkId">${userid}</span>은 사용가능한 아이디 입니다.
		<input type="button" value="아이디 사용하기" id="setId"/>
	</c:if>
	<c:if test="${checkResult}">
	<span>${userid}</span>은 사용 불가능한 아이디 입니다.
	</c:if>
	
	<hr/>
	
	<h3>아이디를 입력 후 중복 검사버튼 누르세요</h3>
	<form method="post" id="frm" action="<%=request.getContextPath() %>/member/idCheck.do" >
		아이디 : <input type="text" name="userid" id="userid"/>
		
		<input type="submit" value="아이디 중복 검사하기"/>
	</form>
	
	
</body>
</html>