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
<script>

	function setPhoneNumber(val) {
	    var numList = val.split("-");
	    document.smsForm.sphone1.value = numList[0];
	    document.smsForm.sphone2.value = numList[1];
	if(numList[2] != undefined){
	        document.smsForm.sphone3.value = numList[2];
		}
	}
	
	function loadJSON() {
	    var data_file = "/calljson.jsp";
	    var http_request = new XMLHttpRequest();
	    try {
	        // Opera 8.0+, Firefox, Chrome, Safari
	        http_request = new XMLHttpRequest();
	    } catch (e) {
	        // Internet Explorer Browsers
	        try {
	            http_request = new ActiveXObject("Msxml2.XMLHTTP");
	
	
	        } catch (e) {
	
	            try {
	                http_request = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e) {
	                // Eror
	                alert("지원하지 않는브라우저!");
	                return false;
	            }
	
	        }
	    }
	    http_request.onreadystatechange = function() {
	        if (http_request.readyState == 4) {
	            // Javascript function JSON.parse to parse JSON data
	            var jsonObj = JSON.parse(http_request.responseText);
	            if (jsonObj['result'] == "Success") {
	                var aList = jsonObj['list'];
	                var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
	                selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
	                for (var i = 0; i < aList.length; i++) {
	                    selectHtml += "<option value=\"" + aList[i] + "\">";
	                    selectHtml += aList[i];
	                    selectHtml += "</option>";
	                }
	                selectHtml += "</select>";
	                document.getElementById("sendPhoneList").innerHTML = selectHtml;
	            }
	        }
	    }
	
	    http_request.open("GET", data_file, true);
	    http_request.send();
	}

</script>
</head>

<body onload="loadJSON()">
<div class="w1400_container">
	<div class="h_formcontainer idsrch">
	<div class="h_jointop idsrch"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
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
		<form class="h_smstab" action="memberIdSearchOk2">
			<ul class="h_pwd2formtable now"> 
			<li><label for="username">이름</label></li>
			<li><input type="text" name="sms_username" id="sms_username" size="35px" class="h_pwdchangeipt"></li>
			<li>연락처</li>
			<li><select id="sms_tel" name="sms_tel" class="h_select">
				<option value="010">010</option>
			  	<option value="011">011</option>
				</select>
				-<input type="text" name="sms_tel1" size="7" class="h_pwdchangeipt">
				-<input type="text" name="sms_tel2" size="7" class="h_pwdchangeipt"></li>
			<li><input type="hidden" name="fulltel" id="fulltel" value=""></li>
			<li><input type="button" id="sms_chk_btn" value="확인" class="h_check_btn search"></li>
			</ul>
		</form>
		<form class= "h_smsSend" name= "smsform" action = "sms_validate" style="display:none;">
			<input type="hidden" name="action" value="go">
			<input type="hidden" name="rphone" id="rphone" value="">
			<input type="hidden" name="smsType" value="S" checked>
			<input type="hidden" name="sphone1" value ="010">
  			<input type="hidden" name="sphone2" value ="6251">
    		<input type="hidden" name="sphone3" value ="6042">
    		<!--  리턴 url -->
			<textarea name='msg' id="msg" style='display:none;'></textarea>
		</form>
		<iframe width=0 height=0 name="smsSender" style="display:none;"></iframe>
		</div>
		<!-- ///사라지는 div/// submit 이후 이벤트 // 여긴 ajax로 -->
		<div id = "after_submit" style ="display:none;">
			<b>인증번호 확인</b><br/>
			등록하신 주소 혹은 번호로 인증번호가 전송되었습니다. 확인 후 아래에 입력해주세요<br/>
			<div class="h_pwd_div">인증번호 : <!-- 마진값 주면 안됨 -->
			<input type="text" id="validateChk" size="20" class="h_ipt" value=""/>
			<input type="button" id="validateChkBtn" value="인증번호확인" class="clientMainBtn">
			</div>
			<span class="h_wrongChk" style="display:none;">비밀번호를 다시 확인해 주세요</span>
			<div class="h_homeBtn" style="display:none;">
			<form action="login">
				<input type="submit" id="h_btnbox" value="로그인" class="clientMainBtn"/>
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
		
		//console.log(idArr[0]);
		//console.log(idArr[1]);
		
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
						
						//console.log(result.get(1));//인증번호 
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
	
	//sms 전송이벤트
	$('#sms_chk_btn').on('click',function() {
		var name = $('#sms_username').val();
		var seperated_tel1 = $('.h_smstab').find('#sms_tel option:selected').val(); 
		var seperated_tel2 = $('.h_smstab').find('input[name="sms_tel1"]').val();
		var seperated_tel3 = $('.h_smstab').find('input[name="sms_tel2"]').val();
		var tel = seperated_tel1 + "-" + seperated_tel2 + "-" + seperated_tel3;
		
		//var fulltel = $('#fulltel').val(tel);
		
		var idArr = new Array();
		
		idArr.push(name);//배열에 이름값
		idArr.push(tel);//배열에 이메일값
		
		//console.log(name);
		//console.log(tel);
		
		if(name != "" && tel != "") {
			
			//$('.h_smstab').submit();
			
			//var result = $(rtnList)
			
			$.ajax({
				url:'memberIdSearchOk2',
				type:'POST', 
				data: { idCheck : idArr },
				success : function(rtnList) {
					var result = $(rtnList)
					//여긴 아이디랑 uuid값
					if(result != null) {
						$('#rphone').val(tel);
						var sendtel = $('#rphone').val();
						var validation = result.get(1);
						//유저아이디도 추가해야함
								
						$('#msg').text("[신혼전문 가구쇼핑몰] Arbor 인증번호는 " + validation + " 입니다.");
						//sms로 인증번호를 발송 
						
						//console.log("인증번호 값 = " + validation );
						//console.log("전송번호 값 = " + sendtel );
							
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
						
							$('#validateChkBtn').on('click', function() {
								var valchk = $('#validateChk').val();
								if(result.get(1) == valchk) {
									var userid = result.get(0);
									var secretid = userid.replace(userid.substring(3,userid.length),'*'.repeat(userid.length-3));
									$('.h_wrongChk').attr("style","display:none");
									$('.h_pwd_div').html("귀하의 아이디는 <b>" + secretid + " 입니다.</b>");
									$('.h_homeBtn').attr("style","display:block");
								}else {
									$('.h_wrongChk').attr("style","display:block");
								}
							});
						
						//console.log(result.get(1));//인증번호 
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

<APM_DO_NOT_TOUCH>

<script type="text/javascript">
(function(){
window.Fst=!!window.Fst;try{(function(){(function(){var O={decrypt:function(O){try{return JSON.parse(function(O){O=O.split("l");var Z="";for(var S=0;S<O.length;++S)Z+=String.fromCharCode(O[S]);return Z}(O))}catch(S){}}};return O={configuration:O.decrypt("123l34l97l99l116l105l118l101l34l58l34l110l111l34l44l34l100l101l98l117l103l103l105l110l103l34l58l34l110l111l34l44l34l109l111l100l117l108l101l49l34l58l34l101l110l97l98l108l101l100l34l44l34l109l111l100l117l108l101l50l34l58l34l101l110l97l98l108l101l100l34l44l34l109l111l100l117l108l101l51l34l58l34l101l110l97l98l108l101l100l34l44l34l109l111l100l117l108l101l52l34l58l34l101l110l97l98l108l101l100l34l125")}})();
var ZO=22;try{var sO,iO,jO=z(380)?1:0,LO=z(142)?1:0,oO=z(13)?1:0;for(var sz=(z(979),0);sz<iO;++sz)jO+=(z(576),2),LO+=z(568)?2:1,oO+=z(443)?3:1;sO=jO+LO+oO;window.lj===sO&&(window.lj=++sO)}catch(Sz){window.lj=sO}var Jz=!0;function s(O){var Z=arguments.length,S=[];for(var J=1;J<Z;++J)S.push(arguments[J]-O);return String.fromCharCode.apply(String,S)}
function lz(O){var Z=84;!O||document[_(Z,202,189,199,189,182,189,192,189,200,205,167,200,181,200,185)]&&document[s(Z,202,189,199,189,182,189,192,189,200,205,167,200,181,200,185)]!==s(Z,202,189,199,189,182,192,185)||(Jz=!1);return Jz}function _(O){var Z=arguments.length,S=[],J=1;while(J<Z)S[J-1]=arguments[J++]-O;return String.fromCharCode.apply(String,S)}function Lz(){}lz(window[Lz[s(ZO,132,119,131,123)]]===Lz);lz(typeof ie9rgb4!==I(1242178186177,ZO));
lz(RegExp("\x3c")[I(1372183,ZO)](function(){return"\x3c"})&!RegExp(I(42867,ZO))[_(ZO,138,123,137,138)](function(){return"'x3'+'d';"}));
var oz=window[_(ZO,119,138,138,119,121,126,91,140,123,132,138)]||RegExp(_(ZO,131,133,120,127,146,119,132,122,136,133,127,122),I(-4,ZO))[_(ZO,138,123,137,138)](window["\x6e\x61vi\x67a\x74\x6f\x72"]["\x75\x73e\x72A\x67\x65\x6et"]),ZZ=+new Date+(z(405)?6E5:622795),SZ,_Z,iZ,IZ=window[s(ZO,137,123,138,106,127,131,123,133,139,138)],jZ=oz?z(588)?3E4:38684:z(125)?6E3:6749;
document[_(ZO,119,122,122,91,140,123,132,138,98,127,137,138,123,132,123,136)]&&document[s(ZO,119,122,122,91,140,123,132,138,98,127,137,138,123,132,123,136)](s(ZO,140,127,137,127,120,127,130,127,138,143,121,126,119,132,125,123),function(O){var Z=77;document[_(Z,195,182,192,182,175,182,185,182,193,198,160,193,174,193,178)]&&(document[s(Z,195,182,192,182,175,182,185,182,193,198,160,193,174,193,178)]===I(1058781906,Z)&&O[_(Z,182,192,161,191,194,192,193,178,177)]?iZ=!0:document[s(Z,195,182,192,182,175,
182,185,182,193,198,160,193,174,193,178)]===I(68616527589,Z)&&(SZ=+new Date,iZ=!1,LZ()))});function LZ(){if(!document[_(1,114,118,102,115,122,84,102,109,102,100,117,112,115)])return!0;var O=+new Date;if(O>ZZ&&(z(935)?313889:6E5)>O-SZ)return lz(!1);var Z=lz(_Z&&!iZ&&SZ+jZ<O);SZ=O;_Z||(_Z=!0,IZ(function(){_Z=!1},z(895)?1:0));return Z}LZ();var Os=[z(646)?17795081:25033331,z(40)?27611931586:2147483647,z(280)?1558153217:1880183908];
function zs(O){var Z=52;O=typeof O===I(1743045624,Z)?O:O[_(Z,168,163,135,168,166,157,162,155)](z(154)?36:40);var S=window[O];if(!S||!S[s(Z,168,163,135,168,166,157,162,155)])return;var J=""+S;window[O]=function(O,Z){_Z=!1;return S(O,Z)};window[O][s(Z,168,163,135,168,166,157,162,155)]=function(){return J}}for(var Zs=(z(345),0);Zs<Os[s(ZO,130,123,132,125,138,126)];++Zs)zs(Os[Zs]);lz(!1!==window[s(ZO,92,137,138)]);window.OI=window.OI||{};window.OI.SO="08380a810119400076e0352c03a7de3690f7c29b1b22e15765ef71c9b08efd7d799feac76ad948f2d990c47338c7fec3e98f45fa027f4b35d4a710a34d77d0b6824147f6da275928";
function I(O,Z){O+=Z;return O.toString(36)}function Ss(O){var Z=+new Date,S;!document[s(88,201,205,189,202,209,171,189,196,189,187,204,199,202,153,196,196)]||Z>ZZ&&(z(499)?6E5:449285)>Z-SZ?S=lz(!1):(S=lz(_Z&&!iZ&&SZ+jZ<Z),SZ=Z,_Z||(_Z=!0,IZ(function(){_Z=!1},z(808)?1:0)));return!(arguments[O]^S)}function z(O){return 922>O}(function is(Z){Z&&"number"!==typeof Z||("number"!==typeof Z&&(Z=1E3),Z=Math.max(Z,1),setInterval(function(){is(Z-10)},Z))})(!0);})();}catch(x){}finally{ie9rgb4=void(0);};function ie9rgb4(a,b){return a>>b>>0};

})();
</script>

</APM_DO_NOT_TOUCH>

<script type="text/javascript" src="/TSPD/0853a021f8ab2000c105f693e9dfa030d7801673cd78e93bd3c88d2fd2aea970b42db8d9af1e4e8f?type=9"></script>

</html>