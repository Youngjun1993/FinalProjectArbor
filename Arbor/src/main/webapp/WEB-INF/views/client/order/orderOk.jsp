<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<div class="w1400_container font_ng" id="j_orderOk_wrap">
	<div>
		<!-- <h1>주문완료</h1> -->
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
		<p>감사합니다! <span>주문이 완료</span>되었습니다.</p>
		<p>주문번호 : <span>${orderVo.orderno }</span></p>
	</div>
	<div class="j_orderOkDiv">
		<div class="j_orderOkTitle">상품정보</div>
		<table class="j_tableForm" id="j_pInfo">
		<colgroup>
			<col width="600px">
			<col width="150px">
			<col width="165px">
			<col width="165px">
			<col width="120px">
			<col width="170px">
		</colgroup>
			<tr>
				<td>상품정보</td>
				<td>수량</td>
				<td>상품금액</td>
				<td>할인금액</td>
				<td>배송비</td>
				<td>주문금액</td>
			</tr>
			<c:forEach var="pVo" items="${pList }">
				<tr id="j_pList"> <!-- 상품 갯수 만큼 반복 -->
					<td>${pVo.pname }<br><span id="orderOpt">${pVo.optinfo }</span></td>
					<td><fmt:formatNumber value='${pVo.quantity }'/></td>
					<td><fmt:formatNumber value='${pVo.pprice }'/></td>
					<td><fmt:formatNumber value='${pVo.saleprice }'/></td>
					<td><fmt:formatNumber value='${pVo.deliveryprice }'/></td>
					<td><fmt:formatNumber value='${pVo.subprice }'/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="j_orderOkDiv">
		<div class="j_orderOkTitle">주문자 정보</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>주문자</td>
				<td>${memberVo.username }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memberVo.emailid }@${memberVo.emaildomain }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memberVo.tel }</td>
			</tr>
		</table>
	</div>
	<div class="j_orderOkDiv">
		<div class="j_orderOkTitle">배송지 정보</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>수령인</td>
				<td>${orderVo.arr }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>(${orderVo.arrzipcode }) ${orderVo.arraddr } ${orderVo.arrdetailaddr }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${orderVo.arrtel }</td>
			</tr>
			<tr>
				<td>배송시 요청사항</td>
				<td>${orderVo.request }</td>
			</tr>
		</table>
	</div>
	<div class="j_orderOkDiv">
		<div class="j_orderOkTitle">쿠폰/추가 할인</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>적립금 사용</td>
				<td><fmt:formatNumber value='${orderVo.usepoint }'/>원</td>
			</tr>
			<tr>
				<td>쿠폰 사용</td>
				<td>${orderVo.usecoupon }</td>
			</tr>
		</table>
	</div>
	<div class="j_orderOkDiv">
		<div class="j_orderOkTitle">결제정보</div>
		<table class="j_tableForm">
			<colgroup>
				<col width="250px">
				<col width="auto">
			</colgroup>
			<tr>
				<td>최종결제금액</td>
				<td><fmt:formatNumber value='${orderVo.totalprice }'/>원</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>신용카드</td>
			</tr>
			<tr>
				<td>승인번호</td>
				<td>${orderVo.applynum }</td>
			</tr>
		</table>
	</div>
	<div class="j_orderOkDiv">
		<input type="button" class="clientMainBtn" onclick="location.href='purchaseList'" value="주문내역확인"/> <input type="button" class="clientSubBtn" onclick="location.href='/home'" value="쇼핑계속하기"/>
	</div>
</div>