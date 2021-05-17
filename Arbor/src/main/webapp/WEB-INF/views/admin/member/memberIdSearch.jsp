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
	<!-- <div class="h_pwdformbox">
		<h1>비밀번호 찾기</h1>
		<ul class="h_pwdsearch">
			<li><div class="h_pwdlistdiv">아이디</div><input type="text" size="30px" class="h_pwdChangeipt"/></li>
			
			<li>이름<input type="text" size="30px" class="h_pwdChangeipt"/></li>
			<li>휴대폰번호<input type="text" size="30px" class="h_pwdChangeipt"/></li>
			<li></li>
		</ul>
	</div> -->
	<div class="h_pwdsearchhead">아이디찾기</div>
	
		<div id="before_submit">
		<div class="h_pwdtapbox">
			<span class="h_tab emailsearch active"><a href="#">이메일로 찾기</a></span>
			<span class="h_tab phonesearch"><a href="#">휴대폰번호로 찾기</a></span>
		</div>
		<form class="h_emailtab">
		<table class="h_pwdformtable now">
				<tr><!-- 공백 --></tr>
				
				<tr>
				<td>
				<label for="username">이름</label>
				</td>
				<td>
				<input type="text" name="username" id="username" size="35px" class="h_pwdchangeipt">
				</td>
				</tr>
				
				<tr>
				<td>
				<label for="email">이메일</label>
				</td>
				<td>
				<input type="text" name="email" id="email" size="35px" class="h_pwdchangeipt">
				</td>
				</tr>
				
			</table>
			
			<!-- 2번째 휴대폰 -->
		<table class="h_pwd2formtable now">
				<tr><!-- 공백 --></tr>
				
				<tr>
				<td>
				<label for="username">이름</label>
				</td>
				<td>
				<input type="text" name="username" id="username" size="35px" class="h_pwdchangeipt">
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
				-<input type="text" name="tel1" size="7" class="h_pwdchangeipt">
				-<input type="text" name="tel2" size="7" class="h_pwdchangeipt">
				</td>
				</tr>
				
			</table>
					<input type="button" id="emailcheck" value="확인" class="h_check_btn search">
			</form>
		</div><!-- ///사라지는 div -->
		<div id = "after_submit" style ="none;"></div>
	</div>
</div>

<script>

$('.h_pwdtapbox .h_tab').click(function(){
    if ($(this).hasClass('emailsearch')) {
        $('.h_pwdtapbox .h_tab').removeClass('active');
        $(this).addClass('active');
        $('.now').hide();
        $('.h_pwdformtable').show();
    } 
    if ($(this).hasClass('phonesearch')) {
        $('.h_pwdtapbox .h_tab').removeClass('active');
        $(this).addClass('active');
        $('.now').hide();
        $('.h_pwd2formtable').show();
    }
});

$('#emailcheck').on('click',function() {
	var name = $('#username').val();
	var email = $('#email').val();
	
	var idArr = new Array();
	
	idArr.push(name);//배열에 이름값
	idArr.push(email);//배열에 이메일값
	
	console.log(idArr[0]);
	console.log(idArr[1]);
	
	
	if(idArr.length > 1) {
		
		$.ajax({
			url:'memberIdSearchOk',
			type:'POST',
			data: { idCheck : idArr},
			success : function(result) {
				console.log(result);
				if(result != null) {
					$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
					$('#after_submit').append(result);
					$('#after_submit').attr("style","display:block");//임시비밀번호 메일전송div보여주기
				}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
					alert('비밀번호가 잘못되었습니다 다시 입력해주세요');
				}
			}, error:function() {
				console.log("AJAX 에러");
			}
		});
		
	}

});


</script>

</body>
</html>