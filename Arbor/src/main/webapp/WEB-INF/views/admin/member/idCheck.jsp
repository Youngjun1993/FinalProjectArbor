<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name = "viewport" content = "width=device-width, initial-scale=1"/>
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
	<c:if test="${!checkResult}">
		<span style="color:red" id="checkId">${userid}</span>은 사용가능한 아이디 입니다.
		<input type="button" value="아이디 사용하기" id="setId"/>
	</c:if>
	<c:if test="${checkResult}">
	<span>${userid}</span>은 사용 불가능한 아이디 입니다.
	</c:if>
	
	<hr/>
	
	<h3>아이디를 입력 후 중복 검사버튼 누르세요</h3>
	<form method="post" id="frm" action="<%=request.getContextPath() %>/idcheck" >
		아이디 : <input type="text" name="userid" id="userid"/>
		
		<input type="submit" value="아이디 중복 검사하기"/>
	</form>
	
	
</body>
</html>