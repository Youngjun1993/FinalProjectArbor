<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/order.css" type="text/css"/>
</head>
<body>
<div class="w1400_container font_ng" id="j_orderPage">
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
		<div id="totalAmount">결제예정금액 : <span>10,000원</span></div>
	</div>
	<div class="j_orderDiv" id="j_buyerInfo"><!-- 주문자정보 -->
		<div class="j_orderTitle">주문자 정보</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="150px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>주문자</td>
				<td><input type="text" value="홍길동" name="username" id="j_username"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" value="" name="email"/></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
					<select id="tel" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="02">02</option>
					</select> 
					- <input type="text" name="tel2" size="4"/> 
					- <input type="text" name="tel3" size="4"/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<select id="tel" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="02">02</option>
					</select> 
					- <input type="text" name="tel2" size="4"/> 
					- <input type="text" name="tel3" size="4"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv" id="j_recipientInfo" class="clearfix"><!-- 배송지정보 -->
		<div id="j_orderFlex">
			<div class="j_orderTitle">배송지 정보</div> <input type="checkbox" id=""/>주문자 정보와 같음
		</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="150px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>수령인</td>
				<td><input type="text" name="arr"/></td>
			</tr>
			<tr>
				<td rowspan="3">주소</td>
				<td><input type="text" name="arrzipcode"/> <input type="button" value="우편번호 검색"/></td>
			</tr>
			<tr>
				<td class="j_addr"><input type="text" name="arraddr"/></td>
			</tr>
			<tr>	
				<td class="j_addr"><input type="text" name="arrdetailaddr" placeholder="상세주소 입력"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<select id="tel" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="02">02</option>
					</select> 
					- <input type="text" name="tel2" size="4"/> 
					- <input type="text" name="tel3" size="4"/>
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
				<col width="150px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>적립금 사용</td>
				<td><input type="text" placeholder="0"/> <input type="button" value="모두 사용"/>보유 적립금 25,542p</td>
			</tr>
			<tr>
				<td>쿠폰 사용</td>
				<td><select><option>사용가능 쿠폰 3장</option><option>VIP회원 15% 할인 쿠폰</option><option>5월 가정의달 맞이 10% 할인 쿠폰</option></select></td>
			</tr>
		</table>
	</div>
	<div class="j_orderDiv" id="j_paymentInfo">
		<div class="j_orderTitle">결제수단</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="150px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>결제수단</td>
				<td><input type="radio"/>신용카드결제</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>