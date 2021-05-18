<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>      
<script type="text/javascript">
	
	function receiver() {
		
		var chknum = $('#smsSelect option:checked').val();
		console.log(chknum);
		$('#rphone').val(chknum);
		
	}
	
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
<form method="post" name="smsForm" action="smsOk">
    <input type="hidden" name="action" value="go"> 발송타입
    <span>
      <input type="radio" name="smsType" value="S">단문(SMS)</span>
    <span>
      <input type="radio" name="smsType" value="L">장문(LMS)</span>
    <br /> 제목 :
    <input type="text" name="subject" value="Arbor 휴면 알림 문자"> 장문(LMS)인 경우 (한글30자이내)
    <br /> 전송메세지 <br/>
    <textarea name="msg" cols="30" rows="10" style="width:455px;">
   	Ａ Ｒ B 0 Ｒ
	▼ ▼ ▼
	휴 복 삼
	면 귀 만
	메 회 쿠
	일 원 폰
	▲ ▲ ▲
    </textarea>
    <br />
    <!-- <p>단문(SMS) : 최대 90byte까지 전송할 수 있으며, 잔여건수 1건이 차감됩니다.
        <br /> 장문(LMS) : 한번에 최대 2,000byte까지 전송할 수 있으며 1회 발송당 잔여건수 3건이 차감됩니다.
    </p> -->
    <!--////////////////////////////받는번호 체크체크  -->
    <br />받는 번호
    <select id="smsSelect" onchange="receiver()">
    	<option value=""></option>
    <c:forEach var="vo" items="${list}"  varStatus="status">
    	<option value="${status.current}">${status.current}</option>
	</c:forEach>
    </select>
    <input type="text" name="rphone" id="rphone" value="">
    <!-- <br />이름삽입번호
    <input type="text" name="destination" value="" size=80> 예) 010-000-0000|홍길동 -->
    
    <input type="hidden" name="sphone1" value ="010">
    <input type="hidden" name="sphone2" value ="6251">
    <input type="hidden" name="sphone3" value ="6042">
    <span id="sendPhoneList"></span>
    <!-- <br />예약 날짜
    <input type="hidden" name="rdate" maxlength="8"> 예)20090909
    <br />예약 시간
    <input type="hidden" name="rtime" maxlength="6"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정. -->
   	<!--  리턴 url -->
    <input type="hidden" name="returnurl" maxlength="64" value="">
    <br /> test flag
    <input type="text" name="testflag" maxlength="1"> 예) 테스트시: Y
   <!--  <br />nointeractive
    <input type="hidden" name="nointeractive" maxlength="1"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략. -->
   <!--  <br />반복설정
    <input type="checkbox" name="repeatFlag" value="Y">
    <br /> 반복횟수
    <select name="repeatNum">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
    </select> 예) 1~10회 가능.
    <br />전송간격
    <select name="repeatTime"> 예)15분 이상부터 가능.
        <option value="15">15</option>
        <option value="20">20</option>
        <option value="25">25</option>
    </select>분마다 -->
    <input type="submit" value="전송">
    <br/>이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
</form>
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