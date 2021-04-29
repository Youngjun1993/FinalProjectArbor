<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/productInsert.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/product.js"></script>
<script>
$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
$( "#startDate" ).datepicker({
	changeMonth: true, 
    changeYear: true,
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dateFormat: 'yy-mm-dd',
    maxDate: 0, // 오늘일자 이후 선택불가 설정
    onClose : function(selectedDate){
    	// 시작일 datepicker가 닫히면 종료일 datepick는 시작일 이전 선택불가하게 설정
    	$("#endDate").datepicker("option", "minDate", selectedDate);
    }
});
$("#endDate").datepicker({ 
    changeYear: true,
    changeMonth: true,
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dateFormat: 'yy-mm-dd',
    maxDate: 0, // 오늘일자 이후 선택불가 설정
    onClose : function(selectedDate){
    	// 종료일 datepicker가 닫히면 시작일 datepick는 종료일 이후 선택불가하게 설정
    	$("#startDate").datepicker("option", "maxDate", selectedDate);
    }
});
</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<div id="sidefrm">사이드메뉴</div>
		<div id="centerfrm">
			<h1>상품 목록</h1>
			<div id="insertInfo">
				<p><span class=pTitle>상품 검색</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<form method="post" action="productListSearch">
						<span class="pContent">카테고리</span>
						<select name="mainno" id="maincate">
							<c:forEach var="mainCate" items="${mainCate }">
								<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
									<option value=${mainCate.mainno }>${mainCate.mainname }</option>
								</c:if>
							</c:forEach>
						</select>
						<select name="subno" id="subcate">
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
							<li><a href="#">당일</a></li>
							<li><a href="#">일주일</a></li>
							<li><a href="#">1개월</a></li>
							<li><a href="#">3개월</a></li>
							<li><a href="#">1년</a></li>
						</ul>
						<span class="pContent"></span>
						<input type="text" id="startDate" placeholder="시작일 직접 선택" />
						<span class="centertxt">~</span>
						<input type="text" id="endDate" placeholder="종료일 직접 선택" />
						<input type="submit" value="Search" />
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
					<p><input type="checkbox" id="listCheckAll"/>전체선택
					<input type="submit" value="선택삭제"/><p>
					<ul id="productList">
						<li>&nbsp</li>
						<li>상품코드</li>
						<li>카테고리</li>
						<li>상품명</li>
						<li>판매가</li>
						<li>재고</li>
						<li>둥록일</li>
						<li>&nbsp</li>
						<c:forEach var="vo" items="${productList }">
							<li><input type="checkbox" value=${vo.pno }/></li>
							<li>${vo.pno }</li>
							<li>${vo.mainname } > ${vo.subname }</li>
							<li>${vo.pname }</li>
							<li>${vo.saleprice }</li>
							<li>${vo.stock }</li>
							<li>${vo.pdate }</li>
							<li><a href="productEdit?pno=${vo.pno }">수정</a> | <a href="javascript:productdel(${vo.pno })">삭제</a></li>
						</c:forEach>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>