<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberJoin.css" type="text/css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

<script>
		// 유효성 검사 전역변수
		 var idCheck = false;// 아이디
		 var idckCheck = false;// 아이디 중복 검사
		 var pwCheck = false;// 비번
		 var pwckCheck = false;// 비번 확인
		 var pwckcorCheck = false;// 비번 확인 일치 확인
		 var nameCheck = false;// 이름
		 var mailCheck = false;// 이메일
		 var mailnumCheck = false;// 이메일 인증번호 확인
		 var addressCheck = false;// 주소
		 var telCheck = false;//연락처
		 var termsCheck1 = false;//약관
		 var termsCheck2 = false;//개인정보
		 var captcha = false;//리캡챠
		 
	$(function() {
		
		//아이디 중복검사
		$('.h_idchk').click(function(){
			if($('#userid').val()!=""){
				window.open("<%=request.getContextPath()%>/idcheck?userid="+$('#userid').val(),"idchk","width=500,height=300");
			}else{
				alert("아이디 입력 후 중복검사 해주세요.");
			}
		});
		
		//중복검사해제
		var userid;
		$('#userid').keyup(function(){
			$('#hiddenCheck').val("N");
			userid = $('#userid').val();
		});
		
		$('#userid').change(function(){
			if(userid!=$('#userid')){
				$('#hiddenCheck').val("N");
				userid = $('#userid').val();
			}
		});
		
		//비밀번호확인 잠금 해제
		$('#userpwd').blur(function() {
			if($('#userpwd').val()!=""){
				$('#pwdCheck').attr("disabled", false);
				$('.h_pwdchk').css("background-color","white");
			}else {
				alert("비밀번호가 너무 짧습니다(영문/숫자/특수문자 중 2가지 이상 조합, 8자~16자)");
				$('#userid').focus();
			}
		});
		
		//비밀번호 확인
		$('#pwdCheck').blur(function(){
			   var inputpwd = $("#userpwd").val();//비밀번호
			   var checkpwd = $("#pwdCheck").val()
				//비밀번호 확인
				var checkResult = $(".h_pwd_ok");//span
				 if(inputpwd == checkpwd){// 일치할 경우
				        checkResult.html("비밀번호가 일치합니다");
				        checkResult.addClass("correct");        
				        checkResult.removeClass("incorrect");
				        pwckcorCheck = true;
				    } else {// 일치하지 않을 경우
				        checkResult.html("비밀번호를 다시 확인해주세요");
				        checkResult.addClass("incorrect");
				        checkResult.removeClass("correct");  
				        $('#pwdCheck').focus();
				        pwckcorCheck = false;
				    }
			   
		});
		
		//이메일인증 인증번호 전송 // 인터셉션으로 mailcheck끊기
		
		var emailcode = ""; 
		$('.h_check_btn.emailchk').click(function() {
			
			var emailid = $(".h_ipt.emailid").val();// 입력한 이메일
			var domain = $(".h_select.emaildomain").val()//도메인
			var email = emailid + "@" + domain;//입력한 이메일 아이디 완전체
			var chkBox = $("#emailvalid");        // 인증번호 입력란
			
			$.ajax({
		        
		        type:"POST",
		        url:"mailcheck?email=" + email,
		        success:function(data){
		        	alert("인증요청이 처리되었습니다. 메일을 확인하세요");
		        	 //console.log("data : " + data);/* 반환데이터 확인 : data는 컨트롤러 이메일 인증 메소드에서 생성해 리턴한 난수(String타입) */
		        	chkBox.attr("disabled", false);
		        	chkBox.attr("id", "emailvalid_ok");
		        	emailcode = data;
		        	
		        	$('.h_pwdchk').css("background-color","white");
		        }
		        		
		    });
			
		});
		
		//이메일 인증번호 비교
		$(".h_emailvalid").blur(function(){
			 var inputCode = $(".h_emailvalid").val();// 입력코드    
			 var checkResult = $(".h_email_warning");    // 비교 결과   
			 if(inputCode == emailcode){                            // 일치할 경우
			        checkResult.html("인증번호가 일치합니다");
			        checkResult.addClass("correct");        
			        checkResult.removeClass("incorrect");
			        mailnumCheck = true;
			    } else {                                            // 일치하지 않을 경우
			        checkResult.html("인증번호를 다시 확인해주세요");
			        checkResult.addClass("incorrect");
			        checkResult.removeClass("correct");  
			        $('.h_emailvalid').focus();
			        mailnumCheck = false;
			    }
			 
		});
		
		/////////////////////////////////////////////////////////가입 이벤트시작
	    	
		$('#memberjoin').mouseup(function() {
	    	
	    	$.ajax({
                url: 'VerifyRecaptcha',
                type: 'post',
                async: false,//동기방식으로 처리해야 script이전에 동작
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
              	  if(data == 0) {
              			alert("자동 가입 방지 봇 통과");
              			captcha = true;
              		}else if(data == 1) {
              			captcha = false
              		}else {
              			 alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
              			captcha = false;
              		}
                    
                }
            });
	    	
	    	/* 입력값 변수 */
	        var id = $('#userid').val();// id 입력란
	        var pw = $('#userpwd').val();// 비밀번호 입력란
	        var pwck = $('#pwdCheck').val();// 비밀번호 확인 입력란
	        var name = $('#username').val();// 이름 입력란
	        var mail = $('#emailid').val();// 이메일 입력란
	        var domain = $('#emaildomain').val();// 이메일도메인
	        var addr = $('#detailaddr').val();//상세주소 입력란
			var tel2 = $('#tel2').val();//연락처 
			var tel3 = $('#tel3').val();//연락처 
	        var termok = $('#termok').is(":checked"); 
	        var privacyok = $('#privacyok').is(":checked"); 
			var captchaChk = false;
	        
	    	if(id == ""){
	    		alert("아이디를 입력해주세요");
	    		idCheck = false;
	    	}else{
	    		idCheck = true;
	    		//아이디체크 유효성
	    		if($('#hiddenCheck').val()=="N"){
		        	alert("아이디 중복검사를 해주세요")
		        	idckCheck = false;
		        }else{
		        	idckCheck = true;
		        	//비밀번호 유효성
		        	if(pw == ""){
		        		alert("비밀번호를 입력 해주세요")
		                pwCheck = false;
		            }else{
		                pwCheck = true;
		            //비밀번호 확인 유효성
		                if(pwck == ""){
		            		alert("비밀번호를 확인 해주세요")
		                    pwckCheck = false;
		                }else{
		                    pwckCheck = true;
		                    //이름 입력
		                    if(name == ""){
		                    	alert("회원성함을 입력해주세요")
		                        nameCheck = false;
		                    }else{
		                        nameCheck = true;
		                        //주소입력
		                        if(addr == ""){
	                            	alert("주소를 입력해주세요")
	                                addressCheck = false;
	                            }else{
	                                addressCheck = true;
	                                //연락처 입력
	                                if(tel2 == "" || tel3 == ""){
			                        	alert("연락처를 입력해주세요")
			                            telCheck = false;
			                        }else{
			                            telCheck = true;
			                          	//이메일 입력
				                        if(mail == "" || domain == ""){
				                        	alert("이메일을 입력해주세요")
				                            mailCheck = false;
				                        }else{
				                            mailCheck = true;
				                            //개인정보 약관 체크
				                            if(termok == false){
				                            	alert("개인정보 및 약관을 동의해야 가입이 가능합니다.")
				                            	termsCheck1 = false;
				                            }else{
				                            	termsCheck1 = true;
				                            	if(privacyok == false){
					                            	alert("개인정보 및 약관을 동의해야 가입이 가능합니다.")
					                            	termsCheck2 = false;
					                            }else{
					                            	termsCheck2 = true;
					                            	if(captcha == false) {
					                            		alert("로봇 체크를 확인해주세요");
					                            	}else {
					                            		captchaChk = true;
					                            		 alert("서브밋발생")
					                     	    		$('.inputForm').attr('action', 'memberJoin');
					                     		    	$('.inputForm').submit;
					                            	}
					                            }
				                            }
				                        }
			                        }
	                            }
		                    }
		                }
		            }
		        }
	    	}
	    	/* if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&nameCheck&&addressCheck&&telCheck&&mailCheck&&termsCheck1&&termsCheck2&&captchaChk){
	    		
	   		 alert("서브밋발생")
	    		$('.inputForm').attr('action', 'memberJoin');
		    	$('.inputForm').submit;
	        }  */
		});
		
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
                $(".h_ipt.detailaddr").attr("readonly", false);
                $(".h_ipt.detailaddr").focus();
	 
	        }
	    
	    }).open();    
	    
	}
</script>

</head>
<body>

<div class="w1400_container">
	<div class="h_formcontainer">
<div class="h_jointop"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
			
	<div class ="h_formbox">
	<form method="post" name="inputForm" class="inputForm">
		<table class="h_formtable">
		<tr><!-- 공백 --></tr>
		<!-- 아이디 -->
		<tr>
		<td>
		<label for="userid">아이디 *</label>
		</td>
		<td>
		<input type="text" name="userid" id="userid" size="50" class="h_ipt" required="required" value="">
		&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" class="h_check_btn h_idchk">
		<!-- 입력검사 확인용 -->				
		<input type="hidden" name="hiddenCheck" id="hiddenCheck" size="4px" value="N"/>
		</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
		<td>
		<label for="pwd">비밀번호 *</label>
		</td>
		<td>
		<input type="password" name="userpwd" id="userpwd" size="50" class="h_ipt" required="required" value=""><br/>(영문/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="pwdCheck">비밀번호 확인 *</label>
		</td>
		<td>
		<input type="password" name="pwdCheck" id="pwdCheck" size="50" class="h_pwdchk" required="required" disabled="disabled" value="">
		<!-- <input type="button" id="pwdconfirm" value="확 인" class="h_pwdchk_btn"/> -->
		<span class="h_pwd_ok"></span>
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="username">이름 *</label>
		</td>
		<td>
		<input type="text" name="username" id="username" size="50" class="h_ipt" required="required" value="">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="addr">주 소</label>
		</td>
		<td>
		<input type="text" name="zipcode" id="zipcode" size="50" class="h_ipt zipcode" readonly="readonly">
		&nbsp;&nbsp;&nbsp;<input type="button" id="zipcode_btn" value="우편번호찾기" class="h_check_btn" onclick="kakao_address()"/>
		
	  	<input type="text" name="addr" id="addr" size="50" class="h_ipt addr" readonly="readonly">&nbsp;&nbsp;&nbsp;기본주소
		
		<input type="text" name="detailaddr" id="detailaddr" size="50" class="h_ipt detailaddr" required="required">&nbsp;&nbsp;&nbsp;나머지 주소
		</td>
		</tr>
		
		<tr>
		<td>
		연락처
		</td>
		<td>
		<select id="tel" name="tel1" class="h_select" style="width:110px">
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
		&nbsp;-&nbsp;<input type="text" name="tel2" id="tel2" size="11" class="h_ipt" required="required" value="">
		&nbsp;-&nbsp;<input type="text" name="tel3" id="tel3" size="11" class="h_ipt" required="required" value="">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="smsok">광고SMS 수신동의</label>
		</td>
	 	<td>
		<input type="radio" name="smsok" value="Y" checked>예
		<input type="radio" name="smsok" value="N">아니오
		<input type="text" class="h_trans"  disabled="disabled">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="email">이메일</label>
		</td>
		<td>
		<input type="text" name="emailid" id="emailid" size="22" class="h_ipt emailid" required="required" value=""> @ 
		<select name="emaildomain" id="emaildomain" class="h_select emaildomain" required="required" style="width:210px">
			<option value=""></option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
			<option value="hotmail.com">hotmail.com</option>
		</select>
		
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="emailvalid">인증번호</label>
		</td>
	 	<td>
	 	<input type="text" name="emailvalid" id="emailvalid" size="50" class="h_emailvalid" required="required" disabled="disabled">
		&nbsp;&nbsp;&nbsp;<input type="button" id="emailcheck" value="인증 요청" class="h_check_btn emailchk">
		<span class="h_email_warning"></span>
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="emailok">광고성메일 수신동의</label>
		</td>
	 	<td>
		<input type="radio" name="emailok" value="Y" checked>예
		<input type="radio" name="emailok" value="N">아니오
		<input type="text" class="h_trans"  disabled="disabled">
		</td>
		</tr>
		</table>
		
		<ul class="h_2box">
			<li class="h_terms"><div class="h_title">쇼핑몰 이용약관</div><div class ="h_termcontent">
제1조(목적) 이 약관은 Arbor(전자상거래 사업자)가 운영하는 Arbor 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br/>
제2조(정의)<br/>
  ① “몰”이란 Arbor가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br/>
제3조 (약관 등의 명시와 설명 및 개정) <br/>
  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 Arbor 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br/>
제4조(서비스의 제공 및 변경) <br/>
  ① “몰”은 다음과 같은 업무를 수행합니다.
    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타 “몰”이 정하는 업무
  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br/>
제5조(서비스의 중단) <br/>
  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br/>
제6조(회원가입) <br/>
  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br/>
제7조(회원 탈퇴 및 자격 상실 등) <br/>
  ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
  ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
    1. 가입 신청 시에 허위 내용을 등록한 경우
    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
  ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
  ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br/>
			</div></li>
			<li class="h_privacy"><div class="h_title">개인정보수집,이용동의</div><div class ="h_termcontent">■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br/><br/>
ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록<br/>
ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식<br/><br/>

■ 개인정보의 수집 및 이용목적<br/>

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br/><br/>

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송<br/>
ο 회원 관리<br/>
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br/><br/>

■ 개인정보의 보유 및 이용기간<br/>

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</div></li>
		</ul>
		<div class="h_term_chk"><input type="checkbox" name="termok" id="termok" required="required">약관에 동의하시겠습니까?</div>
		<div class="h_term_chk"><input type="checkbox" name="privacyok" id="privacyok" required="required">개인정보수집에 동의하시겠습니까?</div>
    	<div id="h_google_recaptha">
		<div class="g-recaptcha" data-sitekey="6LeRXsgaAAAAACGTfFgrnZhBDe76aaMSCLv8yz1D"></div>
		</div>
		<input type="submit" id="memberjoin" value="Join NOW" class="h_check_btn join">
	</form>
		</div>
	</div>
</div>
</body>


</html>