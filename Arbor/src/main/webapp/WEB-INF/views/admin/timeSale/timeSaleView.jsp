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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/timeSale.css" type="text/css"/>
<script>
	$(function(){
		$("#j_tsEditBtn").click(function(){
			console.log("*** 수정버튼 클릭 ***")
			location.href="timeSaleEdit?saleNo=${vo.saleNo}";
		});
		$("#j_tsDelBtn").click(function(){
			console.log("*** 삭제버튼 클릭 ***")
			if(confirm("삭제하시겠습니까?")){
				location.href="timeSaleDelete?saleNo=${vo.saleNo}";							
			}
		});
		/*
		var msg = "";
		if(${msg}!=null){
			alert(${msg});
		}
		*/
		
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm">
		<h1>타임세일</h1>
		<!-- 등록된 타임세일이 있을 경우 -->
		<c:if test="${vo.saleNo!=null }">
			<div>
				<span class="j_category">TIMESALE No.</span> ${vo.saleNo }<br/>
				<span class="j_category">상품번호</span> ${vo.pNo }<br/>
				<span class="j_category">상품명</span> ${vo.pName }<br/>
				<span class="j_category">상품가격</span> ${vo.pPrice }<br/>
				<span class="j_category">할인가격</span> ${vo.salePrice }<br/>
				<span class="j_category">이벤트 기간</span> ${vo.saleStart } ~ ${vo.saleEnd }
				<br/><br/>
				<span id="j_saleContent">${vo.saleContent }</span>
			<hr/>
			<p class="j_eventSetBtn">
				<input type="button" id="j_tsEditBtn" value="수정"/> 
				<input type="button" id="j_tsDelBtn" value="삭제"/> 
			</p>
			</div>
		</c:if>
		<!-- 등록된 타임세일이 없을 경우 -->
		<c:if test="${vo.saleNo==null }">
			<div id="j_emptyTimeSale">진행중인 타임세일이 존재하지 않습니다.</div>
			<hr/>
			<p class="j_eventSetBtn">
				<input type="button" id="j_tsInsertBtn" onclick="location.href='timeSaleInsert.jsp'" value="등록"/> 
			</p>
		</c:if>
	</div>
</div>
</body>
</html>