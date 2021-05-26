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
	<div class="h_login"><a href="/home"><img src="<%=request.getContextPath() %>/img/logo.png"/></a></div>
	<div class="h_half">
		<div class="h_content">
				<form action="loginOk" method="post">
					<input type="text" name="userid" id="userid" class="h_input" required="required" placeholder="아이디를 입력하세요">
					<input type="password" name="userpwd" id="userpwd" class="h_input" required="required" placeholder="비밀번호를 입력하세요">
					<input type="checkbox" id="remember" class="h_checkbox">
					<label for="remember">Remember me</label>
					<div class="h_submit_wrap">
					<input type="submit" value="Join in" class="h_submit">
					<div class="h_anchor_wrap"><a href="joinform">Join us</a>&nbsp;Ι&nbsp;<a href="idsearch">Find ID</a>&nbsp;Ι&nbsp;<a href="pwdSearch">Find Password</a></div>
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
	 var result = '${msg}';
	 
	 if(result == 'failed'){
		alert('아이디 또는 비밀번호가 정확하지 않습니다');
	 }
	 
	 //로그인페이지 아이디 저장
	 $(document).ready(function(){
		 
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("remember");
		    $("#userid").val(key); 
		     
		    if($("#userid").val() != ""){ // 그 전에 쿠키를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#remember").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("remember", $("#userid").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("remember", $("#userid").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		});
	 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
	 
</script>
</body>
</html>
