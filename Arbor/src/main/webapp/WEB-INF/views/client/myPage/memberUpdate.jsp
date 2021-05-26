<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberUpdate.css" type="text/css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>'
<div id="h_memquit_container" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>

	<div class="h_memUpdate_header pageTitle"><span>회원정보 수정</span></div>
	<div class="h_memUpdate_container">
		<div class="h_memPwdCheck_container">
			<div class="h_password_checkbox">
			<img src="<%=request.getContextPath() %>/img/password_lock.png"/>
			</div>
			<div class="h_pwdconfirm_div">
			<b>비밀번호 재확인</b><br/>
			회원정보의 보호를 위해 비밀번호를 다시 확인합니다<br/>
			<div class="h_pwd_div">비밀번호 : <input type="text" id="pwdCheck" size="30" class="h_ipt" value=""/></div>
			</div>
		</div>
		<div class="h_UpdateWriteForm font_ng">
		<form method="post" class="h_memUpdate_form" action="memberUpdateOk">
			<ul class = "h_memUpdate_ul">	
			<li>아이디</li>
			<li>${vo.userid }</li>
			<li>비밀번호</li>
			<li><input type="text" name="userpwd" id="userpwd" class="h_ipt userpwd" size="58" value="" /></li>
			<li>비밀번호 확인</li>
			<li>
			<input type="text" name="pwdCheck" id="update_pwdCheck" class="h_ipt pwdCheck"  size="58" value="" />
			<span class="h_pwd_ok"></span>
			</li>
			<li>이름</li>
			<li>${vo.username}</li>
			<li>주소</li>
			<li>
			<input type="text" name="zipcode" class="h_ipt zipcode" size="36" value="${vo.zipcode }" /><input type="button" size="14" class="h_check_btn font_ng" value="우편번호"  onclick="kakao_address()"/>
			</li>
			<li></li>
			<li>
			<input type="text" name="addr" id="addr" class="h_ipt addr" size="58" value="${vo.addr }" />
			</li>
			<li></li>
			<li>
			<input type="text" name="detailaddr" id="detailaddr" class="h_ipt detailaddr" size="58" value="${vo.detailaddr }" />
			</li>
			<li>연락처</li>
			<li>
			<select id="tel" name="tel1" class="h_select">
				<option value="010">010</option>
			  	<option value="011">011</option>
				<option value="070">070</option>
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>
				<option value="044">044</option>
				<option value="051">051</option>
				<option value="052">052</option>
				<option value="053">053</option>
				<option value="054">054</option>
				<option value="055">055</option>
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>
				<option value="064">064</option>
			</select>
			<span class="p_telhipen">-</span><input type="text" name="tel2" id="tel2" size="10" class="h_ipt" required="required" value="${vo.tel2}">
			<span class="p_telhipen">-</span><input type="text" name="tel3" id="tel3" size="10" class="h_ipt" required="required" value="${vo.tel3}">
			</li>
			<li>이메일</li>
			<li>
			<input type="text" name="emailid" id="emailid" size="25" class="h_ipt emailid" required="required" value="${vo.emailid}">
			<span class="p_mailhipen">@</span> <select name="emaildomain" id="emaildomain" class="h_select emaildomain" required="required" >
				<option value=""></option>
				<option value="gmail.com" <c:if test="${vo.emaildomain eq 'gmail.com' }">selected</c:if>>gmail.com</option>
				<option value="naver.com" <c:if test="${vo.emaildomain eq 'naver.com' }">selected</c:if>>naver.com</option>
				<option value="daum.net" <c:if test="${vo.emaildomain eq 'daum.net' }">selected</c:if>>daum.net</option>
				<option value="nate.com" <c:if test="${vo.emaildomain eq 'nate.com' }">selected</c:if>>nate.com</option>
				<option value="hotmail.com" <c:if test="${vo.emaildomain eq 'hotmail.com' }">selected</c:if>>hotmail.com</option>
			</select>
			</li>
			</ul>
		</form>
			<div class="h_memUpdate_submitbox">
				<input type="button" class="clientMainBtn Update" value="정보수정" />
			</div>
		</div>
	</div>
</div>

<script>
	$("#y_leftMenu>ul>li:nth-child(3) a").css({
		"font-weight":"bold",
		"background" :"rgb(94, 94, 94)",
		"color":"#fff"
	});
/* 카카오주소api 연동 */
	function kakao_address(){
	 
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                //주소변수 문자열과 합치기
	                addr += extraAddr;
	            
	            } else {
	            	addr += ' ';
	            }
	
	            $(".h_ipt.zipcode").val(data.zonecode);//우편변호
	            $(".h_ipt.addr").val(addr);//주소
	            
	            // 커서를 상세주소 필드로 이동한다.
	            $(".h_ipt.detailaddr").focus();
	 
	        }
	    
	    }).open();    
	    
	}
	/* pwd 체크 div */
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
					alert('비밀번호가 일치합니다.');
					$('.h_memPwdCheck_container').attr("style","display:none");
					$('.h_UpdateWriteForm').attr("style","display:block");
					
				}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
					alert('비밀번호를 다시 입력해주세요');
				}
			}, error:function() {
				console.log("AJAX 에러");
			}
		});
		
		}else{
			alert("비밀번호를 입력해주세요");
		}
	});
	
	/* 수정 비밀번호 확인 */
	
	//비밀번호 확인
	
	var inputpwd;//비밀번호;
	var checkpwd;
	var addr;
	var detailaddr;
	var tel2;
	var tel3;
	var emailid;
	
	$('#update_pwdCheck').blur(function(){
			//비밀번호 확인
			inputpwd = $("#userpwd").val();
			checkpwd = $("#update_pwdCheck").val();
			var checkResult = $(".h_pwd_ok");//span
			 if(inputpwd != "" && checkpwd != "" && inputpwd == checkpwd){// 일치할 경우
			        checkResult.html("비밀번호가 일치합니다");
			        checkResult.addClass("correct");        
			        checkResult.removeClass("incorrect");
			    } else {// 일치하지 않을 경우
			        checkResult.html("비밀번호를 다시 확인해주세요");
			        checkResult.addClass("incorrect");
			        checkResult.removeClass("correct");  
			    }
	});
	
	$('.clientMainBtn.Update').click(function() {
		inputpwd = $("#userpwd").val();
		checkpwd = $("#update_pwdCheck").val();
		addr = $("#addr").val();
		detailaddr = $("#detailaddr").val();
		tel2 = $("#tel2").val();
		tel3 = $("#tel3").val();
		emailid = $("#emailid ").val();
		emaildomain = $("#emaildomain option:selected").val();
		
		console.log(inputpwd);
		console.log(checkpwd);
		console.log(addr);
		console.log(tel2);
		console.log(tel3);
		console.log(emailid);
		console.log(emaildomain);
		
		if(inputpwd != "" && checkpwd != "" && addr != "" && tel2 != "" && tel3 != "" && emailid != "" && emaildomain != "") {
			alert('수정이 완료되었습니다.');
			$('.h_memUpdate_form').submit();
		}else {
			alert('수정할 정보를 모두 입력해주세요');
		}
	});
	
</script>