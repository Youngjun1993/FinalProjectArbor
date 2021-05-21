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
	<div class="h_formcontainer idsrch">
	<div class="h_jointop idsrch"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
	<div class="h_pwdsearchhead">비밀번호찾기</div>
	<div id="before_submit">
	<div class="h_pwdtapbox">
		<span class="h_tab emailsearch active"><a href="#">이메일로 찾기</a></span>
		<span class="h_tab phonesearch"><a href="#">휴대폰번호로 찾기</a></span>
	</div>
	<!-- 이메일 비번찾기  -->
	<form class="h_emailtab" action="memberPwdSearchOk">
		<ul class="h_pwdformtable now"> 
		<li><label for="userid">아이디</label></li>
		<li><input type="text" name="mail_userid" id="mail_userid" size="35px" class="h_pwdchangeipt"></li>
		
		<li><label for="email">이메일</label></li>
		<li>
		<input type="text" name="mail_email" id="mail_email" size="35px" class="h_pwdchangeipt">
		</li>
		<li><input type="button" id="email_chk_btn" value="확인" class="h_check_btn search"></li>
		</ul>
	</form>
	<!-- 2번째 휴대폰 -->
		<form class="h_smstab" action="memberIdSearchOk2">
			<ul class="h_pwd2formtable now"> 
			<li><label for="userid">아이디</label></li>
			<li><input type="text" name="sms_userid" id="sms_userid" size="35px" class="h_pwdchangeipt"></li>
			<li>연락처</li>
			<li><select id="sms_tel" name="sms_tel" class="h_select">
				<option value="010">010</option>
			  	<option value="011">011</option>
				</select>
				-<input type="text" name="sms_tel1" size="7" class="h_pwdchangeipt">
				-<input type="text" name="sms_tel2" size="7" class="h_pwdchangeipt"></li>
			<li><input type="button" id="sms_chk_btn" value="확인" class="h_check_btn search"></li>
			</ul>
		</form>
		<form class="h_smsSend" name= "smsform" action = "sms_validate" style="display:none;">
			<input type="hidden" name="action" value="go">
			<input type="hidden" name="rphone" id="rphone" value="">
			<input type="hidden" name="smsType" value="S" checked>
			<input type="hidden" name="sphone1" value ="010">
  			<input type="hidden" name="sphone2" value ="6251">
    		<input type="hidden" name="sphone3" value ="6042">
    		<!-- <input type="text" name="testflag" maxlength="1" value="Y"> -->
    		<!--  리턴 url -->
			<textarea name='msg' id="msg" style='display:none;'></textarea>
		</form>
		<iframe width=0 height=0 name="smsSender" style="display:none;"></iframe>
	</div>
	<!-- 이메일 발송 알림창 -->
		<div id = "after_submit" style ="display:none;">
			<br/>
			등록하신 주소로 임시비밀번호가 전송되었습니다. 임시비밀번호로 로그인해주세요.<br/>
			<br/>로그인 후 반드시 비밀번호를 변경해 주시기 바랍니다.
			<div class="h_homeBtn">
			<form action="login">
				<input type="submit" value="로그인" class="clientMainBtn"/>
			</form>
			</div>
		</div>
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
	
	//이메일 이벤트
	//이메일 전송이벤트
	$('#email_chk_btn').on('click',function() {
		var userid = $('#mail_userid').val();
		var email = $('#mail_email').val();
		
		var idArr = new Array();
		
		idArr.push(userid);//배열에 이름값
		idArr.push(email);//배열에 이메일값
		
		console.log(idArr[0]);
		console.log(idArr[1]);
		  
		
		if(userid != "" && email != "") {
			$.ajax({
				url:'memberPwdSearchOk',
				type:'POST',
				data: { idCheck : idArr },
				success : function(result) {
					
					if(result == 1) {
						$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
						$('#after_submit').attr("style","display:block");//임시비밀번호 메일전송 div보여주기
						//임시비밀번호를 메일로 보내는 이벤트
						alert("임시비밀번호가 전송되었습니다.");
						
					}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
						alert('아이디와 이메일이 일치하지않습니다. 다시 입력해주세요');
					}
				}, error:function() {
					alert("가입한 아이디와 이메일을 입력해주세요");
				}
			});
			
		}else{
			alert("아이디와 이메일을 입력해주세요");
		}
	});
	
	//sms비번 찾기 이벤트
	$('#sms_chk_btn').on('click',function() {
		var id = $('#sms_userid').val();
		var seperated_tel1 = $('.h_smstab').find('#sms_tel option:selected').val(); 
		var seperated_tel2 = $('.h_smstab').find('input[name="sms_tel1"]').val();
		var seperated_tel3 = $('.h_smstab').find('input[name="sms_tel2"]').val();
		var tel = seperated_tel1 + "-" + seperated_tel2 + "-" + seperated_tel3;
		
		//var fulltel = $('#fulltel').val(tel);
		
		var idArr = new Array();
		
		idArr.push(id);//배열에 이름값
		idArr.push(tel);//배열에 이메일값
		
		console.log(id);
		console.log(tel);
		
		if(id != "" && tel != "") {
			
			//var result = $(rtnList)
			
			$.ajax({
				url:'memberPwdSearchOk2',
				type:'POST', 
				data: { idCheck : idArr },
				success : function(result) {
					
					////////////////////////////////////////////////////////// 조건수정해야함
					if(result != "") {
						$('#rphone').val(tel);
						var sendtel = $('#rphone').val();
						var tmppwd = result;
						//유저아이디도 추가해야함
								
						$('#msg').text("[신혼전문 가구쇼핑몰] Arbor 임시비밀번호는 " + tmppwd + " 입니다. 접속 후 변경해주세요");
						//sms로 인증번호를 발송 
						
						console.log("임시비밀번호 값 = " + tmppwd );
						console.log("전송번호 값 = " + sendtel );
							
						//새창을 만들어서 보내고 클로즈시킴
						window.open('','smsSender','width=0,height=1');
						
						var frm =document.smsform;
						frm.target ="smsSender";
						frm.method ="post";
						frm.submit();
						
						///여기서 끊김
						alert("문자 전송 완료");
						
						$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
						$('#after_submit').attr("style","display:block");//
						
					}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
						alert('가입한 아이디와 핸드폰 번호를 입력해주세요');
					}
				}, error:function() {
					alert("가입한 아이디와 핸드폰 번호를 입력해주세요");
				}
			});
			
		}else{
			alert("핸드폰 번호와 아이디을 입력해주세요");
		}
		
	});

</script>

</body>
</html>