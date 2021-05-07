<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 다음 주소록 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport 결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function(){
		
		//수령인 정보 - '주문자와 같음' 체크박스
		$('#j_desCheckBox').change(function(){
			if($('#j_desCheckBox').is(':checked')){
				console.log("'주문자와 같음' 체크");
				$('#j_arr').val($('#j_username').val());
				$('#j_arrzipcode').val('${memberVo.zipcode}');
				$('#j_arraddr').val('${memberVo.addr}');
				$('#j_arrdetailaddr').val('${memberVo.detailaddr}');
				$('#j_arrtel1').val($('#j_tel1').val()).prop('selected', true);
				$('#j_arrtel2').val($('#j_tel2').val());
				$('#j_arrtel3').val($('#j_tel3').val());
			}else{
				console.log("'주문자와 같음' 체크 해제");
				$('#j_arr').val('');
				$('#j_arrzipcode').val('');
				$('#j_arraddr').val('');
				$('#j_arrdetailaddr').val('');
				$('#j_arrtel1 option:eq(0)').prop('selected', true);
				$('#j_arrtel2').val('');
				$('#j_arrtel3').val('');
			}
		});
		
		//적립금 모두 사용 체크박스
		$('#j_allPoint').click(function(){
			console.log("클릭");
			$('#j_usePoint').val('${pointVo.point}');
		});

	});
	
	function startPay(){
		// 결제 //////////////////////////////
		var IMP = window.IMP;
		IMP.init('imp60549605');	//가맹점 key
		var msg;
		
		IMP.request_pay({
			pg: 'inicis',
            pay_method: 'card',	//지불수단
            merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한 id
            name: '@@@외 1',	//상품명
            amount: 50, //결제 금액
            buyer_email: '${memberVo.email}', //구매자 이메일
            buyer_name: '${memberVo.username}', //구매자 이름
            buyer_tel: '${memberVo.tel}', //구매자 연락처
            buyer_addr: '${memberVo.addr}', //구매자 주소지
            buyer_postcode: '${memberVo.zipcode}', //구매자 우편번호
		}, function(rsp){	//결제완료 후 실행될 콜백함수(결제 성공여부, 결제정보, 에러정보 등 포함)
			console.log("rsp : "+rsp);
			if(rsp.success){
				$.ajax({
					url: "http://www.myservice.com/payments/complete", //가맹점 서버
					method: "POST",
					headers: {"Content:Type":"application/json"},
					data: {
						imp_uid: rsp.imp_uid,
						merchant_uid: rsp.merchant_uid
					}
				}).done(function(data){
					//가맹점 서버 결제 API 성공시 로직
					switch(data.status){
						case: "success"
						break;
					}
				})
			}else{
				alert("결제에 실패하였습니다. 에러 내용 : "+rep.error_msg);
			}
		});
	}
	
	
	function inputEmail(){
		console.log("직접입력 선택");
		$(this).parent().after('<input type="text" name="emaildomain"/>');
	}
	
	function daum_address(){
		new daum.Postcode({	//주소 검색 팝업창 실행
			oncomplete: function(data){	//data : 사용자가 선택한 주소 정보를 담고 있는 객체
				//팝업에서 검색결과 클릭했을때 실행할 코드
				var addr = "";
				var extraAddr = "";
				
				if(data.userSelectedType === 'R'){	//도로명주소 선택
					addr = data.roadAddress;
				}else{	//지번주소 선택
					addr = data.jibunAddress;
				}
				
				if(data.userSelectedType === 'R'){
					if(data.bname !== '' && /[동/로/가]$/g.test(data.bname)){	//법정동명이 존재할 경우
						extraAddr += data.bname;
					}
					if(data.buildingName != '' && data.apartment === 'Y'){	//건물명이 있고 공통주택일 경우
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if(extraAddr !== ''){	//표시할 참고항목이 있을 경우
						extraAddr = '(' + extraAddr + ')';
					}
					addr += extraAddr;
				}else{
					addr += '';
				}
				
				$("#j_arrzipcode").val(data.zonecode);
				$("#j_arraddr").val(addr);
				$("#j_arrdetailaddr").attr("readonly", false);
				$("#j_arrdetailaddr").focus();
			}			
		}).open();
	}
	
	
	
	
	
	
	
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<h1>주문/결제</h1><hr/>
	<div class="j_orderDiv" id="j_productInfo"><!-- 상품정보 -->
		<div class="j_orderTitle">상품정보</div>
		<table class="j_tableForm">
		<colgroup>
			<col width="600px">
			<col width="150px">
			<col width="165px">
			<col width="165px">
			<col width="120px">
			<col width="170px">
		</colgroup>
			<thead>
				<tr>
					<td>상품정보</td>
					<td>수량</td>
					<td>상품금액</td>	<!-- 할인가일 경우, 정상가 다음줄 할인가(한칸에 같이 입력) -->
					<td>할인금액</td>
					<td>배송비</td>
					<td>주문금액</td>
				</tr>
			</thead>
			<tbody>	<!-- 상품 갯수 만큼 반복 -->
				<tr>
					<td>6인용 식탁</td>
					<td>1</td>
					<td>1,500,000</td>
					<td>1,000,000</td>
					<td>30,000</td>
					<td>1,000,000</td>
				</tr>
			</tbody>
		</table>
		<div id="amountDiv">결제예정금액 : <span id="preAmount">10,000원</span></div>
	</div>
	<div class="j_orderDiv" id="j_buyerInfo"><!-- 주문자정보 -->
		<div class="j_orderTitle">주문자 정보</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>주문자</td>
				<td>
					<input type="text" name="username" id="j_username" value="${memberVo.username }" size="30"/>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="emailid" value="${memberVo.emailid }" size="30"/>@ 
					<select name="emaildomain" id="j_emaildomain">
						<option value="none">이메일 선택</option>
						<option value="google" <c:if test="${memberVo.emaildomain=='google.com'}">selected</c:if>>google.com</option>
						<option value="naver" <c:if test="${memberVo.emaildomain=='naver.com'}">selected</c:if>>naver.com</option>
						<option value="daum" <c:if test="${memberVo.emaildomain=='daum.net'}">selected</c:if>>daum.net</option>
						<option value="direct" onclick="inputEmail()">직접 입력</option>						
					</select>				
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<select name="tel1" id="j_tel1">
						<option value="010" <c:if test="${memberVo.tel1=='010'}">selected</c:if>>010</option>
						<option value="011" <c:if test="${memberVo.tel1=='011'}">selected</c:if>>011</option>
						<option value="02" <c:if test="${memberVo.tel1=='02'}">selected</c:if>>02</option>
					</select>
					- <input type="text" name="tel2" id="j_tel2" value="${memberVo.tel2 }" size="5"/>
					- <input type="text" name="tel3" id="j_tel3" value="${memberVo.tel3 }" size="5"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv" id="j_arrInfo" class="clearfix"><!-- 배송지정보 -->
		<div id="j_orderFlex" >
			<div class="j_orderTitle" class="clearfix">배송지 정보</div>
			<span><input type="checkbox" id="j_desCheckBox"/>주문자 정보와 같음</span>
		</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>수령인</td>
				<td>
					<input type="text" name="arr" id="j_arr" size="30"/>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td id="j_addr">
					<input type="text" name="arrzipcode" id="j_arrzipcode" size="15" placeholder="우편번호" readonly/>
					<input type="button" value="우편번호 검색" onclick='daum_address()'><br/>
					<input type="text" name="arraddr" id="j_arraddr" size="65" placeholder="기본주소" readonly/><br/>
					<input type="text" name="arrdetailaddr" id="j_arrdetailaddr" size="65" placeholder="상세주소" readonly/>			
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<select name="arrtel1" id="j_arrtel1">
						<option value="02">02</option>
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
					- <input type="text" name="arrtel2" id="j_arrtel2" size="5"/>
					- <input type="text" name="arrtel3" id="j_arrtel3" size="5"/>
				</td>
			</tr>
			<tr>
				<td>배송시 요청사항</td>
				<td>
					<select id="request" name="request">
						<option value="none">배송시 요청사항을 선택해 주세요</option>
						<option value="문앞">부재시 문앞에 놓아주세요.</option>
						<option value="경비실">부재시 경비실에 맡겨 주세요.</option>
						<option value="전화문자">부재시 전화 또는 문자 주세요.</option>
						<option value="택배함">택배함에 넣어주세요.</option>
						<option value="연락">배송전에 연락주세요.</option>
						<option value="직접입력">직접 입력</option>
					</select> 
				</td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv" id="j_couponInfo"><!-- 적립금,쿠폰 -->
		<div class="j_orderTitle">쿠폰/추가 할인</div>	<!-- Coupon / Discount -->
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>적립금 사용</td>
				<td>
					<input type="text" name="usePoint" id="j_usePoint" placeholder="0"/> <input type="button" id="j_allPoint" value="모두 사용"/>보유 적립금 ${pointVo.point}p
				</td>
			</tr>
			<tr>
				<td>쿠폰 사용</td>
				<td>
					<select>
						<option>사용가능 쿠폰 ${cpnCount }장</option>
						
						<c:if test="${cpnCount>0}">
							<c:forEach var="cpnVo" items="${list }">
								<option>${cpnVo.cpnname }</option>
							</c:forEach>
						</c:if>
						
					</select>
				</td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv" id="j_paymentInfo">
		<div class="j_orderTitle">결제수단</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>결제수단</td>
				<td><input type="radio"/>신용카드결제</td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv clearfix" id="j_paymentDetail">
		<div class="j_orderTitle">결제상세</div>
		<div>
			<div class="clearfix" id="akakak">
				<!-- <ul>
					<li>총 상품금액<span>123,500</span>원</li>
					<li>배송비<span>2,500</span>원</li>
					<li>적립금 사용<span>5,000</span>원</li>
					<li>쿠폰 사용<span>10,000</span>원</li>
				</ul> -->
				<!-- <table>
					<tr>
						<td>총 상품금액</td><td><span>123,500원</span></td>
					</tr>
					<tr>
						<td>배송비</td><td><span>2,500</span>원</td>
					</tr>
						<td>적립금 사용</td><td><span>5,000</span>원</td>
					<tr>
						<td>쿠폰 사용</td><td><span>10,000</span>원</td>
					</tr>
				</table> -->
				<div class="paymentFlex">
					<div class="celth">총 상품금액</div><div class="celtd">123,500원</div>					
				</div>
				<div class="paymentFlex">
					<div class="celth">배송비</div><div class="celtd">2,500원</div>					
				</div>
				<div class="paymentFlex">
					<div class="celth">적립금 사용</div><div class="celtd">5,000원</div>
				</div>
				<div class="paymentFlex">
					<div class="celth">쿠폰 사용</div><div class="celtd">10,000원</div>
				</div>
			</div>
			<div>
				총 결제금액<br/><span>111,000</span>원
			</div>		
		</div>
	</div>
	<p id="j_orderBtn"><input type="button" class="clientMainBtn" id="j_paymentBtn" onclick="startPay()" value="결제하기"/> <input type="button" class="clientSubBtn" id="paymentCnlBtn" value="취소"/></p>
</div>






















