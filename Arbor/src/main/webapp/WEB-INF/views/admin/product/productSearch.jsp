<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/productInsert.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script>

</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>상품 목록</span></p>
			<div id="insertInfo">
				<p><span class=pTitle>상품 검색</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<form method="post" action="productSearch">
						<span class="pContent">카테고리</span>
						<select name="mainno" id="maincate">
						<option value="" selected disabled hidden>==선택하세요==</option>
							<c:forEach var="mainCate" items="${mainCate }">
								<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
									<option value=${mainCate.mainno }>${mainCate.mainname }</option>
								</c:if>
							</c:forEach>
						</select>
						<select name="subno" id="subcate">
						<option value="" selected disabled hidden>==선택하세요==</option>
							<c:forEach var="subCate" items="${subCate }">
								<option value=${subCate.subno }>${subCate.subname }</option>
							</c:forEach>
						</select>
						<span id="searchContent">검색어</span>
						<select name="searchKey" id="searchKey">
							<option value="pname">상품명</option>
							<option value="stock">재고량</option>
							<option value="pprice">판매가격</option>
						</select>
						<input type="text" name="searchWord" id="searchWord" />
						<br/><br/>
						<ul id="pDateCate">
							<li><span class="pContent">등록일자</span></li>
							<li><a href="javascript:pDateClick(1)">당일</a></li>
							<li><a href="javascript:pDateClick(2)">일주일</a></li>
							<li><a href="javascript:pDateClick(3)">1개월</a></li>
							<li><a href="javascript:pDateClick(4)">3개월</a></li>
							<li><a href="javascript:pDateClick(5)">1년</a></li>
						</ul>
						<span class="pContent"></span>
						<input type="text" name="startdate" id="startdate" placeholder="시작일 직접 선택" />
						<span class="centertxt">~</span>
						<input type="text" name="enddate" id="enddate" placeholder="종료일 직접 선택" />
						<input type="submit" value="Search" class="adminMainBtn"/>
						<br/>
					</form>
				</div>
			</div>
			<br/><br/>
			<div id="ProductListPrint">
				<p><span class=pTitle>상품목록</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<form method="post" action="ProductDeleteCheck">
					<ul id="productList">
						<li class="tableHeader"><input type="checkbox" value="전체선택" id="listCheckAll"/></li>
						<li class="tableHeader">상품코드</li>
						<li class="tableHeader">카테고리</li>
						<li class="tableHeader">상품명</li>
						<li class="tableHeader">판매가</li>
						<li class="tableHeader">재고</li>
						<li class="tableHeader">둥록일</li>
						<li class="tableHeader"><input type="submit" value="선택삭제" class="adminSubBtn"/></li>
						<c:forEach var="vo" items="${productList }">
							<li><input type="checkbox" value=${vo.pno }/></li>
							<li>${vo.pno }</li>
							<li class="wordcut">${vo.mainname } > ${vo.subname }</li>
							<li class="wordcut">${vo.pname }</li>
							<li>${vo.saleprice }</li>
							<li>${vo.stock }</li>
							<li>${vo.pdate }</li>
							<li><a href="productEdit?pno=${vo.pno }">수정</a> | <a href="javascript:productdel(${vo.pno })">삭제</a></li>
						</c:forEach>
					</ul>
				</form>
			</div>
			<div id="pagingDiv">
				 <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="productSearch?pageNum=${pageVO.pageNum-1}">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="productSearch?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="productSearch?pageNum=${p}">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="productSearch?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">＞</a></li>
	                </c:if>
	            </ul>
            </div>
		</div>
	</div>
	
<script>
	$(function(){
		// Datepicker
		$("#startdate").datepicker({
			changeMonth: true, 
		    changeYear: true,
		    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dateFormat: "yy-mm-dd",
		    maxDate: 0, // 오늘일자 이후 선택불가 설정
		    onClose : function(selectedDate){
		    	// 시작일 datepicker가 닫히면 종료일 datepick는 시작일 이전 선택불가하게 설정
		    	$("#enddate").datepicker("option", "minDate", selectedDate);
		    }
		});
		$("#enddate").datepicker({ 
			changeMonth: true, 
		    changeYear: true,
		    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dateFormat: "yy-mm-dd",
		    maxDate: 0, // 오늘일자 이후 선택불가 설정
		    onClose : function(selectedDate){
		    	// 종료일 datepicker가 닫히면 시작일 datepick는 종료일 이후 선택불가하게 설정
		    	$("#startdate").datepicker("option", "maxDate", selectedDate);
		    }
		});
	});
	
	function pDateClick(no) {
		var today = new Date();
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜
		var now = formatDate(year+"-"+month+"-"+date);
		if(no==1) {
			$("#startdate").val(formatDate(new Date()));
			$("#enddate").val(formatDate(new Date(today.setDate(today.getDate()+1))));
		} else if(no==2) {
			$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-7))));
			$("#enddate").val(formatDate(new Date()));
		} else if(no==3) {
			$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-30))));
			$("#enddate").val(formatDate(new Date()));
		} else if(no==4) {
			$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-90))));
			$("#enddate").val(formatDate(new Date()));
		} else if(no==5) {
			$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-365))));
			$("#enddate").val(formatDate(new Date()));
		}
	}
	
	function formatDate(date) {
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		return [year, month, day].join('-');
	}
</script>
</body>
</html>