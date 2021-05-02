<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
</head>
<body>
<div class="w1400_container font_ng">
	<h1>주문/결제</h1>
	<div id="j_productInfo"><!-- 상품정보 -->
		<div>상품정보</div>
		<table>
			<thead>
				<tr>
					<td>상품정보</td>
					<td>수량</td>
					<td>상품금액</td>	<!-- 할인가일 경우, 정상가 다음줄 할인가(한칸에 같이 입력) -->
					<td>배송비</td>
					<td>주문금액</td>
				</tr>
			</thead>
			<tbody>	<!-- 상품 갯수 만큼 반복 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="j_buyerInfo"><!-- 주문자정보 -->
		<div>주문자 정보</div>
		<table>
			<tr>
				<td>주문자</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>hong@naver.com</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>010-1111-2222</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>010-1111-2222</td>
			</tr>
		</table>
	</div>
	<div id="j_recipientInfo"><!-- 배송지정보 -->
		<div>배송지 정보</div> <input type="checkbox" id=""/>주문자 정보와 같음
		<table>
			<tr>
				<td>수령인</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="button" value="우편번호 검색"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>010-1111-2222</td>
			</tr>
			<tr>
				<td>배송시 요청사항</td>
				<td>ㄹ아허나ㅣ;ㅓ애;ㅓ;ㅐ</td>
			</tr>
		</table>
	</div>
	<div id="j_couponInfo"><!-- 적립금,쿠폰 -->
		<div>Coupon / Discount 쿠폰/추가 할인</div>
		<table>
			<tr>
				<td>적립금 사용</td>
				<td><input type="text" value="적립금 사용:"/><input type="text" value="사용가능 적립금:"/></td>
			</tr>
			<tr>
				<td>쿠폰 사용</td>
				<td><input type="text" value="쿠폰 사용:"/><input type="text" value="사용가능 쿠폰:"/></td>
			</tr>
		</table>
	</div>
	<div id="j_paymentInfo">
		<div>결제수단</div>
		<table>
			<tr>
				<td>결제수단</td>
				<td><input type="radio"/>신용카드결제</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>