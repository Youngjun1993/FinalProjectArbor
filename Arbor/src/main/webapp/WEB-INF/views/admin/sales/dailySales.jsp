<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/sales.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/orderAdmin.css" type="text/css"/>
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
		var params = "orderdate="+orderdate;
		$.ajax({
			url: url,
			data: params,
			success: function(result){
				var $result = $(result);
				var tag = "<li>주문번호</li><li>상품명</li><li>아이디</li><li>회원명</li><li>결제금액</li>";
				$result.each(function(idx, vo){
					$("#j_salesPopup_Wrap>div>p").text(orderdate+" 매출")
					tag += "<li>"+ vo.orderno +"</li>";
					tag += "<li>"+ vo.orderno +"</li>";
					tag += "<li>"+ vo.userid +"</li>";
					tag += "<li>"+ vo.username +"</li>";
					tag += "<li>"+ vo.subprice +"원</li>";
					$("#j_salesDetailList").html(tag);
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
	<div class="j_centerFrm">
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
					
					<c:set var="t_sales" value="0"/>
					<c:set var="t_ordercnt" value="0"/>
					<c:set var="t_delivery" value="0"/>
					<c:forEach var="salesVo" items="${salesList }">
						<li>${salesVo.orderdate }</li>
						<li><span><fmt:formatNumber value="${salesVo.totalsales }"/>원</span></li>
						<li><span>${salesVo.ordercnt}건</span></li>
						<li><span><fmt:formatNumber value="${salesVo.totaldelivery }"/>원</span></li>
						<li><input type="button" value="상세보기" onclick="javascript:salesDetailPopup('${salesVo.orderdate }')"/></li>
						
						<c:set var="t_sales" value="${t_sales + salesVo.totalsales}"/>
						<fmt:parseNumber var="n_ordercnt" value = "${fn:trim(salesVo.ordercnt)}" />
						<c:set var="t_ordercnt" value="${t_ordercnt + n_ordercnt}"/>
						<c:set var="t_delivery" value="${t_delivery + salesVo.totaldelivery}"/>
						
					</c:forEach>
					
					<li>합계</li>
					<li><span><fmt:formatNumber value="${t_sales }"/>원</span></li>
					<li><span><fmt:formatNumber value="${t_ordercnt }"/>건</span></li>
					<li><span><fmt:formatNumber value="${t_delivery }"/>원</span></li>
					<li>-</li>					
				</ul>
			</div>
			<div class="j_paging">
				<ul class="adPaging clearfix">
					<c:if test="${pageVO.pageNum>1 }">
						<li style="border-bottom:none;"><a class="pagingAdLR_a" href="dailySales?pageNum=${pageVO.pageNum-1 }">＜</a></li>
					</c:if>
					<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
						<c:if test="${p<=pageVO.totalPage }">
							<c:if test="${p==pageVO.pageNum }">
								<li style="border-bottom:3px solid rgb(191,43,53);"><a href="dailySales?pageNum=${p }">${p }</a></li>
							</c:if>
							<c:if test="${p!=pageVO.pageNum }">
								<li><a href="dailySales?pageNum=${p }">${p }</a></li>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${pageVO.pageNum<pageVO.totalPage }">
						<li style="border-bottom:none;"><a class="pagingAdLR_a" href="dailySales?pageNum=${pageVO.pageNum+1 }">＞</a></li>
					</c:if>
				</ul>
		 	</div>
		</div>
	</div>
	<div id="j_salesPopup_Wrap">	<!-- 주문상세보기 팝업 -->
		<div>
			<p></p>
			<ul class="clearfix" id="j_salesDetailList"></ul>
		</div>
		<input type="button" class="adminMainBtn" id="j_salesPopupClose" value="닫기"/>
	</div>
</div>
</body>
</html>