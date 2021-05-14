<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/orderAdmin.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
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
       	//buttonImage: "../../../img/calendar2.png",
       	//buttonImageOnly: true
       	//buttonText: '달력선택'
	});
	$("#orderSearch_from").datepicker({
		onClose : function(selectedDate){
	    	$("#orderSearch_to").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#orderSearch_to").datepicker({
		onClose : function(selectedDate){
	    	$("#orderSearch_from").datepicker("option", "maxDate", selectedDate);
	    }
	});
	$('#orderSearch_from').click(function(){
		if($('#orderSearch_from').text()!=null){
			$('#j_orderSearch li').removeClass("oSelected");
			$('#period').attr('value', '');
		}
	});
	$('#orderSearch_to').click(function(){
		if($('#orderSearch_from').text()!=null){
			$('#j_orderSearch li').removeClass("oSelected");
			$('#period').attr('value', '');
		}
	});
	
	
	$('#j_orderSearch li').click(function(){
		var period = $(this).text();
		$(this).addClass("oSelected");
		$('#period').attr('value', period);
		$('#orderSearch_from').val('');
		$('#orderSearch_to').val('');	
		$(this).siblings().removeClass("oSelected");
	});
	
	$('#j_selectAll').click(function(){
		if($('#j_selectAll').prop('checked')){
			console.log("전체선택 체크!")
			$('#j_orderList input[type=checkbox]').prop('checked', true);
		}else{
			$('#j_orderList input[type=checkbox]').prop('checked', false);
		}
	})
	$('#j_orderList input[type=checkbox]:not(#j_selectAll)').click(function(){
		if($('#j_selectAll').prop('checked')){
			$('#j_selectAll').prop('checked', false)
		}		
	});
	
	
	  
  });
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm" id="orderManagement">
		<p class="j_adminMemu"><span>주문관리</span></p>
		<div id="j_orderCnt" class="clearfix">	<!-- 주문현황 -->
			<ul>
				<li><span class="oStatus">신규주문</span> <span class="oCount"><span>${cnt.neworder }</span>건</span></li>
				<li><span class="oStatus">배송준비</span> <span class="oCount"><span>${cnt.ready }</span>건</span></li>
				<li><span class="oStatus">배송중</span> <span class="oCount"><span>${cnt.delivery }</span>건</span></li>
				<li><span class="oStatus">배송완료</span> <span class="oCount"><span>${cnt.complete }</span>건</span></li>
			</ul>
		</div>
		<div id="j_orderSearch" class="clearfix">	<!-- 주문 검색창 -->
			<div>
				<form method="post" action="orderAdmin">
					<div>
						<span>주문일자</span>
						<ul>
							<li><a href="#">당일</a></li>
							<li><a href="#">일주일</a></li>
							<li><a href="#">1개월</a></li>
							<li><a href="#">3개월</a></li>
						</ul>
						<input type="hidden" name="period" id="period" value=""/>
						<input type="text" name="orderSearch_from" id="orderSearch_from" placeholder="시작일"/>&nbsp;&nbsp;~&nbsp;&nbsp;
						<input type="text" name="orderSearch_to" id="orderSearch_to" placeholder="종료일"/>				
					</div>
					<div>
						<span>검색어</span>
						<select name="searchKey">
							<option value="orderno">주문번호</option>
							<option value="username">주문자</option>
							<option value="pno">상품번호</option>
							<option value="pname">상품명</option>
						</select>
						<input type="text" name="searchWord"/>
					</div>
					<div>
						<input type="submit" class="adminMainBtn" value="Search"/>
					</div>
				</form>			
			</div>
		</div>
		<div id="j_orderList">	<!-- 주문 리스트 -->
			<form method="post" id="j_orderListFrm" action="orderAdmin">
				<select name="status">
					<option value="">주문상태</option>
					<option value="신규주문">신규주문</option>
					<option value="배송준비">배송준비</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
					<option value="반품진행">반품진행중</option>
					<option value="반품완료">반품완료</option>
					<option value="교환중">교환진행중</option>
					<option value="교환완료">교환완료</option>
				</select>
				<input type="submit" class="adminSubBtn" id="changeStatusBtn" value="변경"/>
				<ul>
					<li><input type="checkbox" id="j_selectAll"/></li>
					<li>주문일시</li>
					<li>주문번호</li>
					<li>주문상태</li>
					<li>주문자명</li>
					<li>주문자연락처</li>
					<li>수령자명</li>
					<li>수령자연락처</li>
					<li>요청사항</li>
					
					<c:forEach var="orderVo" items="${list }">
						<li><input type="checkbox" name="orderno" value="${orderVo.orderno }"/></li>
						<li>${orderVo.orderdate }</li>
						<li><a href="#">${orderVo.orderno }</a></li>
						<li>${orderVo.status }</li>
						<li>${orderVo.username }</li>
						<li>${orderVo.tel }</li>
						<li>${orderVo.arr }</li>
						<li>${orderVo.arrtel }</li>
						<li>${orderVo.request }</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	</div> <!-- centerFrm -->	
</div>