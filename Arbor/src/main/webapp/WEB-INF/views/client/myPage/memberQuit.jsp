<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="h_memquit_container" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
	<div class="h_memberQuit_header">회원 탈퇴</div>
	<div class="h_memberQuit_Container">
		<div class="h_password_checkbox">
		<img src="<%=request.getContextPath() %>/img/password_lock.png"/>
		</div> 
		<div class="h_pwdconfirm_div">
		<b>비밀번호 재확인</b><br/>
		회원정보의 보호를 위해 비밀번호를 다시 확인합니다<br/>
		<div class="h_pwd_div">비밀번호 : <input type="text" id="pwdCheck" size="20" class="h_ipt" value=""/></div>
		<span class="h_wrongPwd">비밀번호를 다시 확인해 주세요</span>
		</div>
		<div class="h_quitReason_div">
		탈퇴사유<br/>
		<select name="quitReason" id="h_quitReason" class="h_quitReason" required="required">
			<option value=""></option>
			<option value="방문빈도">방문빈도 낮음</option>
			<option value="고객서비스">고객서비스 불만</option>
			<option value="배송">배송 불만</option>
			<option value="교환반품">교환/반품 불만</option>
			<option value="상품가격">상품가격 불만</option>
			<option value="쇼핑기능">쇼핑기능 불만</option>
			<option value="개인정보">개인정보 유출 우려</option>
		</select>
			<div class="h_quitBtn_div"><input type="button" id="h_quitBtn" class="clientSubBtn" value="탈퇴"/></div>
		</div>
	</div>
</div>

<script>
$('#pwdCheck').blur(function(){
	if($('#pwdCheck').val()!=""){
		var pwdArr = new Array();
		//controller로 넘겨서 세션아이디와 비밀번호 일치 확인
		
		pwdArr.push($('#pwdCheck').val());//배열에 비밀번호입력값 넣기
		
		console.log(pwdArr);
		
		$.ajax({
			url:'pwdCheck',
			type:'POST',
			data: { pwdCheck : pwdArr},
			success : function(result) {
				if(result == 1) {
					$('.h_pwd_div').html("비밀번호가 일치합니다");
					$('.h_pwd_div').addClass("correct");
					$('.h_pwd_div').removeClass("incorrect");
					$('.h_quitReason_div').attr("style","display:block");
					$('.h_wrongPwd').attr("style","display:none");
				}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
					$('.h_wrongPwd').attr("style","display:block");
					$('.h_pwd_div').focus();
				}
			}, error:function() {
				console.log("AJAX 에러");
			}
		});
		
	}else{
		alert("비밀번호를 입력해주세요");
	}
	
});

//버튼을 선택하면
$('#h_quitBtn').click(function (){
	var quitReason = $('.h_quitReason').val();
	
	if(confirm('정말 탈퇴하시겠습니까?')) {
		$.ajax({
			url:'memberGoodbye',
			type:'POST',
			data:{ reason : quitReason },
			success : function(result) {
				if(result == 1) {
					alert('탈퇴처리가 완료되었습니다.');
					location.href = "/home"	
				}else{
					alert('탈퇴가 실패하였습니다.');
				}
			},error:function() {
				console.log('ajax에러');
			}
			
		});
	}else {
		return false;
	};
	
});

//select의 option 밸류값을ㅏㅏㅏ앙ㅇ

//memberOutOk로 1.겟방식 2.ajax? 로 컨트롤러로 넘겨준다.

//마지막은 /home으로 뷰페이지 반환
	
</script>