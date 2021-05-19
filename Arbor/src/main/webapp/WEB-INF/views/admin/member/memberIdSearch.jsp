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
		
		<form class="h_emailtab" action="memberIdSearchOk">
			<ul class="h_pwdformtable now"> 
			<li><label for="username">이름</label></li>
			<li><input type="text" name="username" id="username" size="40px" class="h_pwdchangeipt"></li>
			<li><label for="email">이메일</label></li>
			<li>
			<input type="text" name="email" id="email" size="40px" class="h_pwdchangeipt">
			</li>
			<li><input type="button" id="email_chk_btn" value="확인" class="h_check_btn search"></li>
			</ul>
		</form>
			<!-- 2번째 휴대폰 -->
		<form class="h_smstab">
			<ul class="h_pwd2formtable now"> 
			<li><label for="username">이름</label></li>
			<li><input type="text" name="sms_username" id="sms_username" size="35px" class="h_pwdchangeipt"></li>
			<li>연락처</li>
			<li><select id="sms_tel" name="sms_tel" class="h_select">
				<option value="010">010</option>
			  	<option value="011">011</option>
				<option value="02">02</option>
				</select>
				-<input type="text" name="tel1" size="7" class="h_pwdchangeipt">
				-<input type="text" name="tel2" size="7" class="h_pwdchangeipt"></li>
			<li><input type="button" id="sms_chk_btn" value="확인" class="h_check_btn search"></li>
			</ul>
		</form>
		</div>
		<!-- ///사라지는 div/// submit 이후 이벤트 // 여긴 ajax로 -->
		<div id = "after_submit" style ="display:none;">
			<b>인증번호 확인</b><br/>
			등록하신 주소로 메일이 전송되었습니다. 메일을 확인해주세요<br/>
			<div class="h_pwd_div">인증번호 : <!-- 마진값 주면 안됨 -->
			<input type="text" id="validateChk" size="20" class="h_ipt" value=""/>
			<input type="button" id="validateChkBtn" value="메일인증">
			</div>
			<span class="h_wrongChk" style="display:none;">비밀번호를 다시 확인해 주세요</span>
			<div class="h_homeBtn" style="display:none;">
			<form action="login">
				<input type="submit" value="로그인" class="clientMainBtn"/>
			</form>
			</div>
		</div>
	</div>
</div>

<script>
	//탭박스 이벤트
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
	
	//이메일 전송이벤트
	$('#email_chk_btn').on('click',function() {
		var name = $('#username').val();
		var email = $('#email').val();
		
		var idArr = new Array();
		
		idArr.push(name);//배열에 이름값
		idArr.push(email);//배열에 이메일값
		
		console.log(idArr[0]);
		console.log(idArr[1]);
		
		/* 서브밋방식으로 아이디 값을 입력했으면*/
		/*
		if(name != "" && email != "") {
			$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
			$('#after_submit').attr("style","display:block");//이메일값 확인
			
			var list = ${list}
			
			console.log(list);
			console.log(list[0]);
			
			$('.h_emailtab').submit();
		}else {
			alert("이메일과 성함을 입력해주세요")
		}*/
	
		//${list}를 반환해야한다
		if(name != "" && email != "") {
			
			$.ajax({
				url:'memberIdSearchOk',
				type:'POST',
				data: { idCheck : idArr },
				success : function(rtnList) {
					var result = $(rtnList)
					if(result != null) {
						$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
						$('#after_submit').attr("style","display:block");//임시비밀번호 메일전송 div보여주기
						
							$('#validateChkBtn').on('click', function() {
								var valchk = $('#validateChk').val();
								if(result.get(1) == valchk) {
									var userid = result.get(0);
									var secretid = userid.replace(userid.substring(3,userid.length),'*'.repeat(userid.length-3));
									$('.h_wrongChk').attr("style","display:none");
									$('.h_pwd_div').html("귀하의 아이디는 <b>" + secretid + " 입니다.</b>");
									$('.h_homeBtn').attr("style","display:block");//임시비밀번호 메일전송 div보여주기
								}else {
									$('.h_wrongChk').attr("style","display:block");
								}
							});
						
						console.log(result.get(1));//인증번호 
					}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
						alert('아이디와 이메일이 일치하지않습니다. 다시 입력해주세요');
					}
				}, error:function() {
					alert("아이디와 이메일이 일치하지 않습니다. 다시 입력해주세요");
				}
			});
			
		}else{
			alert("이메일과 성함을 입력해주세요");
		}
			/* $.ajax({
				url:'memberIdSearchOk',
				type:'POST',
				data: { idCheck : idArr },
				success : function(rtnList) {
					console.log(rtnList);
					if(rtnList != null) {//원래리턴타입은 아이디
						$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
						$('#after_submit').append(rtnList);
						$('#after_submit').attr("style","display:block");//임시비밀번호 메일전송 div보여주기
					}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
						alert('아이디와 이메일이 일치하지않습니다. 다시 입력해주세요');
					}
				}, error:function() {
					alert("아이디와 이메일이 일치하지 않습니다. 다시 입력해주세요");
				}
			}); */
	
		/* var list = request.getAttribute("list"); */
	});


</script>

</body>
</html>