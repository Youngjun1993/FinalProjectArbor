<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 다음 주소록 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport 결제 API -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function(){
		//결제정보 setting
		var sumPaymentStr = $('#sumPayment').val();
		var payment = Number(sumPaymentStr);
		var sumDeliveryStr = $('#sumDelivery').val();
		var delivery = Number(sumDeliveryStr);
		var total = payment+delivery;
		var totalPayment = total.toLocaleString();
		
		var tag = "<span>"+totalPayment+"</span>원";
		$('#j_totalPayment').html(tag);	//결제예정금액
		$('#j_totalPrice').val(total);
		
		var plus = parseInt(payment*0.02);
	 	var plusPoint = plus.toLocaleString();
		console.log("plus->"+plus+" / plusPoint->"+plusPoint);
		$('#pPoint').text(plusPoint);	//적립예정금액
		$('#j_plusPoint').val(plus);
		
		
		//수령인 정보 - '주문자와 같음' 체크박스
		$('#j_desCheckBox').click(function(){
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
			$('#j_usePoint').val('${pointVo.point}');
			//결제정보란에 사용적립금 적용
			var usepointStr = $('#j_usePoint').val();
			var usepoint = Number(usepointStr).toLocaleString();
			$('#j_usedPoint').text(usepoint+'원');
			cal_totalpayment();
		});
		
		$('#j_usePoint').focusin(function(){
			$('#j_usePoint').val('');
		});
		//적립금 수동 입력시, 결제정보란에 사용적립금 적용
		$('#j_usePoint').focusout(function(){
			var pointStr = $('#j_usePoint').val();	//사용할 적립금
			var point = Number(pointStr).toLocaleString();
			var mypoint = '${pointVo.point}';	//보유 적립금
			
			if(mypoint<point){
				alert("보유 적립금을 확인해 주시기 바랍니다.");
				$('#j_usePoint').val('');
				$('#j_usePoint').focus();
				return false;
			}else{
				$('#j_usedPoint').text(point+'원');
				cal_totalpayment();
			}
		});
		
		$('#j_selectCpn').on('change', function(){
			alert(this.value);
		/* 	var cpnno = $('#j_selectCpn option:selected').val();
			console.log("선택한 쿠폰"+cpnno); */
		});
		
		
		//주문,결제페이지 유효성 검사
		$('#checkoutBtn').on('click', function(){
			if($('#j_username').val()=='' || $('#j_username').val()==null){
				alert("주문자는 필수 입력 항목입니다.");
				$('#j_username').focus();
				return false;
			}else if($('#j_emailid').val()=='' || $('#j_emailid').val()==null){
				alert("이메일은 필수입력 항목입니다.");
				$('#j_emailid').focus();
				return false;
			}else if($('#j_tel2').val()=='' || $('#j_tel2').val()==null){
				alert("주문자 연락처는 필수 입력 항목입니다.");
				$('#j_tel2').focus();
				return false;
			}else if($('#j_tel3').val()=='' || $('#j_tel3').val()==null){
				alert("주문자 연락처는 필수 입력 항목입니다.");
				$('#j_tel3').focus();
				return false;
			}else if($('#j_arr').val()=='' || $('#j_arr').val()==null){
				alert("수령자는 필수 입력 항목입니다.");
				$('#j_arr').focus();
				return false;
			}else if($('#j_arrzipcode').val()=='' || $('#j_arrzipcode').val()==null){
				alert("배송지 우편번호는 필수 입력 항목입니다.");
				$('#j_arrzipcode').focus();
				return false;
			}else if($('#j_arraddr').val()=='' || $('#j_arraddr').val()==null){
				alert("배송지 주소는 필수 입력 항목입니다.");
				$('#j_arraddr').focus();
				return false;
			}else if($('#j_arrdetailaddr').val()=='' || $('#j_arrdetailaddr').val()==null){
				alert("배송지 상세주소는 필수 입력 항목입니다.");
				$('#j_arrdetailaddr').focus();
				return false;
			}else if($('#j_arrtel2').val()=='' || $('#j_arrtel2').val()==null){
				alert("수령인 연락처는 필수 입력 항목입니다.");
				$('#j_arrtel2').focus();
				return false;
			}else if($('#j_arrtel3').val()=='' || $('#j_arrtel3').val()==null){
				alert("수령인 연락처는 필수 입력 항목입니다.");
				$('#j_arrtel3').focus();
				return false;
			}else if(!$('input[name="payType"]').is(':checked')){
				alert("결제수단을 선택하여 주시기 바랍니다.");
				return false;
			}else if(!$('#j_orderRegulation input[type="checkbox"]').is(':checked')){
				alert("주문동의란을 확인하여 주시기 바랍니다.")
				return false;
			}
			checkout();
		});
		
		//요청사항 직접입력
		$('#j_request').change(function(){
			if($('#j_inputRequest').is(':selected')){
				console.log("요청사항 직접입력 선택");
				$(this).next().attr('type', 'text');
				$(this).next().attr('name', 'request');
				$(this).next().css('display', 'inline-block');
				$(this).next().css('width', '350px');
				$(this).attr('name', '');
			}else{
				console.log("요청사항 직접입력 선택 해제");			
				$(this).next().attr('type', 'hidden');
				$(this).next().attr('name', '');
				$(this).next().css('display', 'none');
				$(this).attr('name', 'request');
			}
		});
		
		
		
	});
	
 	function checkout(){ 		
		// 결제 //////////////////////////////
		var IMP = window.IMP;
		IMP.init('imp60549605');	//가맹점 key
		var msg="";
		var applyNum="";	//결제 승인번호
		var paidAt="";		//결제 승인시각
		
	 	IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 10,
		    buyer_email : '${memberVo.email}',
		    buyer_name : '${memberVo.username}',
		    buyer_tel : '${memberVo.tel}',
		    buyer_addr : '${memberVo.addr}',
		    buyer_postcode : '${memberVo.zipcode}'
		}, function(rsp) {
		    if(rsp.success){
		        var msg = '결제가 완료되었습니다.';
		        var msg2 = '결제완료 => ' 
		        msg2 += '고유ID : ' + rsp.imp_uid;
		        msg2 += ' / 상점 거래ID : ' + rsp.merchant_uid;
		        msg2 += ' / 결제 금액 : ' + rsp.paid_amount;
		        msg2 += ' / 카드 승인번호 : ' + rsp.apply_num;
		        msg2 += ' / 결제승인시각 : ' + rsp.paid_at;
		        applyNum = rsp.apply_num;
		        paidAt = rsp.paid_at;
		        console.log(msg2);
		    }else{
		    	var msg = '결제에 실패하였습니다.';
		    	msg += "('" + rsp.error_msg + "')";
		   		console('에러내용 : ' + rsp.error_msg);
		    }
		    alert(msg);
		    console.log("결제승인번호->"+applyNum+", 결제승인시각->"+paidAt);
		    $('#j_applyNum').attr('value', applyNum)
		    $("#j_checkoutFrm").submit();
		});
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
	
	function cal_totalpayment(){
		//사용 적립금
		var pointStr = $('#j_usePoint').val();
		var point = Number(pointStr);
		//주문상품금액
		var sumPaymentStr = $('#sumPayment').val();
		var payment = Number(sumPaymentStr);
		//배송비
		var sumDeliveryStr = $('#sumDelivery').val();
		var delivery = Number(sumDeliveryStr);
		//결졔예정금액
		var total = payment+delivery-point;
		var totalPayment = total.toLocaleString();
		var tag = "<span>"+totalPayment+"</span>원";
		$('#j_totalPayment').html(tag);
		$('#j_totalPrice').val(total);
		//적립예정금액
		var plus = parseInt((payment-point)*0.02);
	 	var plusPoint = plus.toLocaleString();
	 	console.log("plus->"+plus+" / plusPoint->"+plusPoint);
		$('#pPoint').text(plusPoint);
		$('#j_plusPoint').val(plus);
	}
	
	

</script>
</head>
<body>
<div class="w1400_container font_ng" id="j_order_wrap">
	<div>
		<!-- <h1>주문/결제</h1> -->
		<div>
			<ul class="clearfix">
				<li><i class="fas fa-cart-arrow-down fa-3x"></i></li>
				<li></li>
				<li><i class="far fa-credit-card fa-3x"></i></li>
				<li></li>
				<li><i class="far fa-check-square fa-3x"></i></li>
			</ul>
	         <ul class="clearfix">
	             <li>장바구니</li>
	             <li>주문/결제</li>
	             <li>주문완료</li>
	         </ul>
		</div>
	</div>
	<div>
		<form method="post" id="j_checkoutFrm" action="orderOk">
			<div class="j_orderTable" id="j_productInfo">	<!-- 상품정보 -->
				<div class="j_orderTitle">상품정보</div>
				<ul>
					<li>상품정보</li>
					<li>상품금액</li>
					<li>할인금액</li>
					<li>수량</li>
					<li>배송비</li>
					<li>주문금액</li>
					
					<c:set var="sumDelivery" value="0"/>
					<c:set var="sumPayment" value="0"/>
					<c:forEach var="pInfoVo" items="${pInfoList }"  varStatus="i">
						<li>
							<div>
								<img src="<%=request.getContextPath() %>/img/${pInfoVo.img1 }"/> <!-- 상품이미지 -->
								<div><span>${pInfoVo.pname }</span><span>${pInfoVo.optinfo }</span></div>
								<input type="hidden" name="pno" value="${pInfoVo.pno} "/>
								<input type="hidden" name="pname" value="${pInfoVo.pname }"/>
								<input type="hidden" name="optinfo" value="${pInfoVo.optinfo }"/>
								<input type="hidden" name="quantity" value="${pInfoVo.quantity }"/>
								<input type="hidden" name="subprice" value="${pInfoVo.subprice }"/>
								<input type="hidden" name="cartno" value="${pInfoVo.cartno }"/>
							</div>
						</li>
						<li>${pInfoVo.pprice }</li>
						<li>${pInfoVo.saleprice }</li>
						<li>${pInfoVo.quantity }</li>
						<li>${pInfoVo.deliveryprice }</li>
						<li>${pInfoVo.quantity*pInfoVo.subprice }</li>
						<c:set var="sumDelivery" value='${sumDelivery + pInfoVo.deliveryprice }'/>
						<c:set var="sumPayment" value='${sumPayment + pInfoVo.quantity*pInfoVo.subprice }'/>
					</c:forEach>
				</ul>
				<input type="hidden" id="sumDelivery" value="${sumDelivery }"/>
				<input type="hidden" id="sumPayment" value="${sumPayment }"/>
			</div>
			<div class="clearfix" id="orderCenterDiv"> <!-- 센터div -->
				<div id="orderFrm_left"> <!-- 센터 왼쪽div -->
					<div class="j_orderTable" id="j_userInfo">
						<div class="j_orderTitle">주문자 정보</div>
						<table>
							<colgroup>
								<col width="200px">
								<col width="auto">
							</colgroup>
							<tr>
								<td>주문자</td>
								<td>
									<input type="text" name="username" id="j_username" value="${memberVo.username }" size="30" readonly/>
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="emailid" id="j_emailid" value="${memberVo.emailid }" size="30" readonly/>@ 
									<select name="emaildomain" id="j_emaildomain">
										<option value="none">이메일 선택</option>
										<option value="gmail" <c:if test="${memberVo.emaildomain=='gmail.com'}">selected</c:if>>gmail.com</option>
										<option value="naver" <c:if test="${memberVo.emaildomain=='naver.com'}">selected</c:if>>naver.com</option>
										<option value="daum" <c:if test="${memberVo.emaildomain=='daum.net'}">selected</c:if>>daum.net</option>
										<option value="nate" <c:if test="${memberVo.emaildomain=='nate.com'}">selected</c:if>>nate.com</option>
										<option value="hotmail" <c:if test="${memberVo.emaildomain=='hotmail.com'}">selected</c:if>>hotmail.com</option>					
									</select>
								</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>
									<select name="tel1" id="j_tel1">
										<option value="010" <c:if test="${memberVo.tel1=='010'}">selected</c:if>>010</option>
										<option value="011" <c:if test="${memberVo.tel1=='011'}">selected</c:if>>011</option>
										<option value="070" <c:if test="${memberVo.tel1=='070'}">selected</c:if>>011</option>
										<option value="02" <c:if test="${memberVo.tel1=='02'}">selected</c:if>>02</option>
										<option value="031" <c:if test="${memberVo.tel1=='031'}">selected</c:if>>031</option>
										<option value="032" <c:if test="${memberVo.tel1=='032'}">selected</c:if>>032</option>
										<option value="033" <c:if test="${memberVo.tel1=='033'}">selected</c:if>>033</option>
										<option value="041" <c:if test="${memberVo.tel1=='041'}">selected</c:if>>041</option>
										<option value="042" <c:if test="${memberVo.tel1=='042'}">selected</c:if>>042</option>
										<option value="043" <c:if test="${memberVo.tel1=='043'}">selected</c:if>>043</option>
										<option value="044" <c:if test="${memberVo.tel1=='044'}">selected</c:if>>044</option>
										<option value="051" <c:if test="${memberVo.tel1=='051'}">selected</c:if>>051</option>
										<option value="052" <c:if test="${memberVo.tel1=='052'}">selected</c:if>>052</option>
										<option value="053" <c:if test="${memberVo.tel1=='053'}">selected</c:if>>053</option>
										<option value="054" <c:if test="${memberVo.tel1=='054'}">selected</c:if>>054</option>
										<option value="055" <c:if test="${memberVo.tel1=='055'}">selected</c:if>>055</option>
										<option value="061" <c:if test="${memberVo.tel1=='061'}">selected</c:if>>061</option>
										<option value="062" <c:if test="${memberVo.tel1=='062'}">selected</c:if>>062</option>
										<option value="063" <c:if test="${memberVo.tel1=='063'}">selected</c:if>>063</option>
										<option value="064" <c:if test="${memberVo.tel1=='064'}">selected</c:if>>064</option>
									</select>
									- <input type="text" name="tel2" id="j_tel2" value="${memberVo.tel2 }" size="5" readonly/>
									- <input type="text" name="tel3" id="j_tel3" value="${memberVo.tel3 }" size="5" readonly/>
								</td>
							</tr>
						</table>
					</div>
					<div class="j_orderTable" id="j_shippingInfo"> <!-- 배송지정보 -->
						<div id="j_orderFlex" >
							<div class="j_orderTitle" class="clearfix">배송지 정보</div>
							<span><input type="checkbox" id="j_desCheckBox"/><label for="j_desCheckBox">주문자 정보와 같음</label></span>
						</div>
						<table>
							<colgroup>
								<col width="200px">
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
									<input type="button" value="우편번호 검색" class="clientSubBtn" onclick='daum_address()'><br/>
									<input type="text" name="arraddr" id="j_arraddr" size="65" placeholder="기본주소" readonly/><br/>
									<input type="text" name="arrdetailaddr" id="j_arrdetailaddr" size="65" placeholder="상세주소" readonly/>			
								</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>
									<select name="arrtel1" id="j_arrtel1">
										<option value="010" <c:if test="${memberVo.tel1=='010'}">selected</c:if>>010</option>
										<option value="011" <c:if test="${memberVo.tel1=='011'}">selected</c:if>>011</option>
										<option value="070" <c:if test="${memberVo.tel1=='070'}">selected</c:if>>011</option>
										<option value="02" <c:if test="${memberVo.tel1=='02'}">selected</c:if>>02</option>
										<option value="031" <c:if test="${memberVo.tel1=='031'}">selected</c:if>>031</option>
										<option value="032" <c:if test="${memberVo.tel1=='032'}">selected</c:if>>032</option>
										<option value="033" <c:if test="${memberVo.tel1=='033'}">selected</c:if>>033</option>
										<option value="041" <c:if test="${memberVo.tel1=='041'}">selected</c:if>>041</option>
										<option value="042" <c:if test="${memberVo.tel1=='042'}">selected</c:if>>042</option>
										<option value="043" <c:if test="${memberVo.tel1=='043'}">selected</c:if>>043</option>
										<option value="044" <c:if test="${memberVo.tel1=='044'}">selected</c:if>>044</option>
										<option value="051" <c:if test="${memberVo.tel1=='051'}">selected</c:if>>051</option>
										<option value="052" <c:if test="${memberVo.tel1=='052'}">selected</c:if>>052</option>
										<option value="053" <c:if test="${memberVo.tel1=='053'}">selected</c:if>>053</option>
										<option value="054" <c:if test="${memberVo.tel1=='054'}">selected</c:if>>054</option>
										<option value="055" <c:if test="${memberVo.tel1=='055'}">selected</c:if>>055</option>
										<option value="061" <c:if test="${memberVo.tel1=='061'}">selected</c:if>>061</option>
										<option value="062" <c:if test="${memberVo.tel1=='062'}">selected</c:if>>062</option>
										<option value="063" <c:if test="${memberVo.tel1=='063'}">selected</c:if>>063</option>
										<option value="064" <c:if test="${memberVo.tel1=='064'}">selected</c:if>>064</option>
									</select>
									- <input type="text" name="arrtel2" id="j_arrtel2" size="5"/>
									- <input type="text" name="arrtel3" id="j_arrtel3" size="5"/>
								</td>
							</tr>
							<tr>
								<td>배송시 요청사항</td>
								<td>
									<select name="request" id="j_request">
										<option value="-">배송 시 요청사항을 선택해 주세요.</option>
										<option value="부재시 문앞에 놓아주세요.">부재시 문앞에 놓아주세요.</option>
										<option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
										<option value="부재시 전화 또는 문자 주세요.">부재시 전화 또는 문자 주세요.</option>
										<option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
										<option value="배송전에 연락주세요.">배송전에 연락주세요.</option>
										<option value="직접입력" id="j_inputRequest">직접 입력</option>
									</select> 
									<input type="hidden" name=""/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<p>- 특정 상품 및 도서산간 지역의 경우 추후 수령 시 추가 배송비가 발생할 수 있습니다.</p>
									<p>- 배송지 불분명 및 수신불가 연락처 기입으로 반송되는 왕복 택배 비용은 구매자 부담으로 정확한 주소 및 연락처를 필수 기입해 주시기 바랍니다.</p>
								</td>
							</tr>
						</table>
					</div>
					<div class="j_orderTable" id="j_couponInfo">
						<div class="j_orderTitle">적립금 및 쿠폰</div>	<!-- Coupon / Discount -->
						<table>
							<colgroup>
								<col width="200px">
								<col width="auto">
							</colgroup>
							<tr>
								<td>적립금 사용</td>
								<td>
									<input type="text" name="usepoint" id="j_usePoint" value="0" onkeyup=""/>
									<input type="button" class="clientSubBtn" id="j_allPoint" value="모두 사용"/>
									<span>보유 적립금 <c:if test="${pointVo.point!=null }"><fmt:formatNumber value='${pointVo.point }'/>원</c:if>
										<c:if test="${pointVo.point==null }">0</c:if>p</span>
								</td>
							</tr>
							<tr>
								<td>쿠폰 사용</td>
								<td>
									<select id="j_selectCpn">
										<option value="-">사용가능 쿠폰 ${cpnCount }장</option>
										<c:if test="${cpnCount>0}">
											<c:forEach var="cpnVo" items="${couponList }" varStatus="i">
												<option value="${cpnVo.cpnno }">${cpnVo.cpnname } (사용기간 : ${cpnVo.cpnstart }~${cpnVo.cpnend })</option>
											</c:forEach>
											<input type="hidden" name="couponprice" id="j_couponprice" value="${cpnVo.salerate }"/>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<p>- 할인쿠폰 제외 상품이 포함되어 있는 경우, 해당 제품을 제외하고 할인이 적용됩니다.</p>
									<p>- 쿠폰에 따라 최대 쿠폰 사용 금액이 제한될 수 있습니다.</p>
								</td>
							</tr>
						</table>
					</div>
					<div class="j_orderTable" id="j_paymentInfo">
						<div class="j_orderTitle">결제수단</div>
						<table>
							<colgroup>
								<col width="200px">
								<col width="auto">
							</colgroup>
							<tr>
								<td>결제수단</td>
								<td>
									<input type="radio" name="payType" id="j_creditCard"/><label for="j_creditCard">신용카드</label>
								</td>
							</tr>
						</table>
					</div>
				</div>	<!-- 센터 왼쪽div -->
				<div id="orderFrm_right">	<!-- 센터 오른쪽div -->
					<div id="j_paymentDetail">
						<div>
							<p>결제정보</p>
							<table>
								<colgroup>
									<col width="100px">
									<col width="auto">
								</colgroup>
								<tr>
									<td>주문상품금액</td>
									<td><span><fmt:formatNumber value='${sumPayment }'/></span>원</td>
								</tr>
								<tr>
									<td>적립금 사용</td>
									<td id="j_usedPoint">0원</td>
								</tr>
								<tr>
									<td>쿠폰 사용</td>
									<td id="j_usedcoupon">0원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td><fmt:formatNumber value='${sumDelivery }'/>원</td>
								</tr>
							</table>
							<div>
								<p>총 결제예정금액</p>
								<p id="j_totalPayment"></p>
								<input type="hidden" name="totalprice" id="j_totalPrice" value=""/>
							</div>
							<div>
								<p>적립예정금액 <span id="pPoint">0</span>원</p>
								<input type="hidden" name="pluspoint" id="j_plusPoint" value=""/>
							</div>
						</div>
						<input type="hidden" name="applyNum" id="j_applyNum" value=""/>
						<div id="j_orderRegulation">
							<p><b>주문동의</b></p>
							<p>주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?<br/>
							(전자상거래법 제8조 제2항)<br/><br/>
							주문제작상품의 경우, 교환/반품이 불가능하다는 내용을 확인하였으며 이에 동의합니다.</p>
							<p><input type="checkbox" id="orderAgree"/> <label for=orderAgree><b>동의합니다.</b></label></p>
						</div>
						<input type="button" class="clientMainBtn" id="checkoutBtn" value="결제하기"/>
					</div>		
				</div>	<!-- 센터 오른쪽div -->
			</div>	<!-- 센터div -->
		</form>
	</div>	
</div>