<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/orderAdmin.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm" id="j_orderDetail_wrap">
		<p class="j_adminMemu"><span>주문상세내역</span></p>
		<div> 주문번호 : ${orderVo.orderno } </div>
		<div class="j_orderOkDiv">
			<div class="j_orderOkTitle">▶ 상품정보</div>
			<table class="j_tableFormAd" id="j_pInfoAd">
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
					<tr id="j_pListAd"> <!-- 상품 갯수 만큼 반복 -->
						<td>
							<div><span>${pVo.pname }</span><span>${pVo.optno }</span></div>
						</td>
						<td>${pVo.quantity }</td>
						<td>${pVo.pprice }</td>
						<td>${pVo.saleprice }</td>
						<td>${pVo.deliveryprice }</td>
						<td>${pVo.subprice }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="j_orderOkDiv">
			<div class="j_orderOkTitle">▶ 주문자 정보</div>
			<table class="j_tableFormAd">
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
			<div class="j_orderOkTitle">▶ 배송지 정보</div>
			<table class="j_tableFormAd">
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
			<div class="j_orderOkTitle">▶ 쿠폰/추가 할인</div>
			<table class="j_tableFormAd">
				<colgroup>
					<col width="250px">
					<col width="auto">
				</colgroup>
				<tr>
					<td>적립금 사용</td>
					<td>${orderVo.usepoint }원</td>
				</tr>
				<tr>
					<td>쿠폰 사용</td>
					<td>${orderVo.usecoupon }</td>
				</tr>
			</table>
		</div>
		<div class="j_orderOkDiv">
			<div class="j_orderOkTitle">▶ 결제정보</div>
			<table class="j_tableFormAd">
				<colgroup>
					<col width="250px">
					<col width="auto">
				</colgroup>
				<tr>
					<td>최종결제금액</td>
					<td>${orderVo.totalprice }원</td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td>신용카드</td>
				</tr>
				<tr>
					<td>승인번호</td>
					<td>12121212</td>
				</tr>
			</table>
		</div>
		<div class="j_orderOkDiv">
			<input type="button" class="adminMainBtn" onclick="location.href='orderAdmin'" value="주문목록"/>
		</div>
	</div>
</div>
</body>
</html>