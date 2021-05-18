<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/sales.css" type="text/css"/>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function(){
		//datepicker 옵션 설정
		$.datepicker.setDefaults({
			dateFormat: "yy-mm-dd",
			dayNamesMin: ['일','월','화','수','목','금','토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearSuffix: "년",
			showOtherMonths: true,		//빈 공간에 앞뒤월의 날짜 표시
			showMonthAfterYear:true,	//년+월
			changeYear: true,			//콤보박스 연도 선택 가능
			changeMonth: true,			//콤보박스 월 선택 가능
			showOn: "focus"				//both:버튼을 누르거나 input을 클릭하면 달력 표시
		});
		$("#sales_from").datepicker({
			onClose : function(selectedDate){
		    	$("#sales_to").datepicker("option", "minDate", selectedDate);
		    }
		});
		$("#sales_to").datepicker({
			onClose : function(selectedDate){
		    	$("#sales_from").datepicker("option", "maxDate", selectedDate);
		    }
		});
		
		//매출 검색기간 유효성 검사
		$('#salesSearchBtn').click(function(){
			if($('#sales_from').val()=='' || $('#sales_from').val==null){
				alert("검색기간을 확인해주세요.");
				return false;
			}
			if($('#sales_to').val()=='' || $('#sales_to').val==null){
				alert("검색기간을 확인해주세요.");
				return false;
			}
			$('#salesFrm').submit();
		});
		
		$('#j_salesPopupClose').click(function(){
			$("#j_salesPopup_Wrap").css({
				"display":"none"
			});
		});
		
		
	});
	
	
	function salesDetailPopup(orderdate){
		$("#j_salesPopup_Wrap").css({
			"display":"block"
		});
		console.log("orderDate-->"+orderdate);
		
		var url = "dailySalesDetail";
		var params = "orderDate="+orderdate;
		$.ajax({
			url: url,
			data: params,
			success: function(result){
				var $result = $(result);
				var tag = "<li>주문번호</li><li>상품명</li><li>아이디</li><li>회원명</li><li>결제금액</li>";
				$result.each(function(idx, vo){
					tag += "<li>" + vo.orderno + "</li>";
					tag += "<li>" + vo.orderno + "</li>";
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.username + "</li>";
					tag += "<li>" + vo.subprice + "</li>";
				});
			}, error: function(error){
				console.log("주문상세보기 팝업 에러->"+error);
			}
		});
		
	}
	
	
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm" id="orderManagement">
		<p class="j_adminMemu"><span>매출관리</span></p>
		<div>
			<form id="salesFrm" action="salesManagement">
				<table id="salesDateSearch">
					<colgroup>
						<col width="200px"><col width="auto">
					</colgroup>
					<tr>
						<td>검색기간</td>
						<td>
							<input type="text" name="sales_from" id="sales_from"/>
							 ~ <input type="text" name="sales_to" id="sales_to"/>
							<input type="button" class="adminSubBtn" id="salesSearchBtn" value="검색"/>
						</td>
					</tr>
				</table>
			</form>
			<div id="dailySales">
				<ul class="clearfix">
					<li>날짜</li>
					<li>총매출</li>
					<li>주문건수</li>
					<li>배송비</li>
					<li>비고</li>
					
					<c:forEach var="salesVo" items="${salesList }">
						<li>${salesVo.orderdate }</li>
						<li>${salesVo.totalsales }원</li>
						<li>${salesVo.ordercnt }건</li>
						<li>${salesVo.totaldelivery }원</li>
						<li><input type="button" value="상세보기" onclick="javascript:salesDetailPopup('${salesVo.orderdate }')"/></li>
					</c:forEach>
				</ul>
			</div>
			<div>
			 ~ 페이징 할 곳 ~
			 ~ 페이징 해야겠지??????????????????? ~
			</div>
		</div>
	</div>
	<div id="j_salesPopup_Wrap">	<!-- 주문상세보기 팝업 -->
		<div style="width:500px; margin:0 auto;">
			<p>2021-02-17 매출</p>
			<ul class="clearfix" id="j_salesDetailList"></ul>
		</div>
		<input type="button" class="adminMainBtn" id="j_salesPopupClose" value="닫기"/>
		<div>
			~ 페이징 ~
		</div>
	</div>
</div>
</body>
</html>