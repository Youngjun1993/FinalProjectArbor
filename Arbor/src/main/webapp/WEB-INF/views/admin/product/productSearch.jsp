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
					<form method="post" action="productSearch" id="p_productSearchFrm">
						<span class="pContent">카테고리</span>
						<select name="mainno" id="maincate">
						<c:if test="${pageVO.mainno==null || pageVO.mainno=='' }">
						<option value="" selected disabled hidden>==선택하세요==</option>
						</c:if>
							<c:forEach var="mainCate" items="${mainCate }">
								<c:choose>
								<c:when test="${mainCate.mainno==pageVO.mainno }">
									<option value=${mainCate.mainno } selected>${mainCate.mainname }</option>
								</c:when>
								<c:otherwise>
									<option value=${mainCate.mainno }>${mainCate.mainname }</option>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<select name="subno" id="subcate">
						<c:if test="${pageVO.subno==null || pageVO.subno==''}">
						<option value="" selected disabled hidden>==선택하세요==</option>
						</c:if>
							<c:forEach var="subCate" items="${subCate }">
								<c:choose>
								<c:when test="${subCate.subno==pageVO.subno }">
									<option value=${subCate.subno } selected>${subCate.subname }</option>
								</c:when>
								<c:otherwise>
									<option value=${subCate.subno }>${subCate.subname }</option>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<span id="searchContent">검색어</span>
						<select name="searchKey" id="searchKey">
							<c:choose>
								<c:when test="${pageVO.searchKey == 'pname'}">
									<option value="pname" selected>상품명</option>
									<option value="stock">재고량</option>
									<option value="saleprice">판매가격</option>
								</c:when>
								<c:when test="${pageVO.searchKey == 'stock'}">
									<option value="pname">상품명</option>
									<option value="stock" selected>재고량</option>
									<option value="saleprice">판매가격</option>
								</c:when>
								<c:when test="${pageVO.searchKey == 'saleprice'}">
									<option value="pname">상품명</option>
									<option value="stock">재고량</option>
									<option value="saleprice" selected>판매가격</option>
								</c:when>
								<c:otherwise>
									<option value="pname">상품명</option>
									<option value="stock">재고량</option>
									<option value="saleprice">판매가격</option>
								</c:otherwise>
							</c:choose>
						</select>
						<input type="text" name="searchWord" id="searchWord" value="${pageVO.searchWord }"/>
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
						<input type="text" name="startdate" id="startdate" placeholder="시작일 직접 선택" value="${pageVO.startdate }" autocomplete="off"/>
						<span class="centertxt">~</span>
						<input type="text" name="enddate" id="enddate" placeholder="종료일 직접 선택" value="${pageVO.enddate }" autocomplete="off"/>
						<input type="submit" value="Search" class="adminMainBtn"/>
						<br/>
						<input type="hidden" name="pageNum" id="p_pageNum" value="${pageVO.pageNum }"/>
					</form>
				</div>
			</div>
			<br/><br/>
			<div id="ProductListPrint">
				<p><span class=pTitle>상품목록</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<form method="post" action="">
					<ul id="productList">
						<li class="tableHeader"><input type="checkbox" value="전체선택" id="listCheckAll"/></li>
						<li class="tableHeader">상품코드</li>
						<li class="tableHeader">카테고리</li>
						<li class="tableHeader">상품명</li>
						<li class="tableHeader">판매가</li>
						<li class="tableHeader">재고</li>
						<li class="tableHeader">등록일</li>
						<li class="tableHeader"><input type="submit" value="선택삭제" formaction="javascript:productDeleteCheck()" class="adminMainBtn"/></li>
						<c:forEach var="vo" items="${productList }">
							<li><input type="checkbox" value=${vo.pno }/></li>
							<li>${vo.pno }</li>
							<li class="wordcut">${vo.mainname } > ${vo.subname }</li>
							<li class="wordcut">${vo.pname }</li>
							<li>${vo.saleprice }</li>
							<li>${vo.stock }</li>
							<li>${vo.pdate }</li>
							<li><input type="submit" class="adminSubBtn" value="수정" formaction="productEdit?pno=${vo.pno }"/>
							<input type="submit" class="adminSubBtn" value="삭제" formaction="javascript:productdel(${vo.pno })"/>
							</li>
						</c:forEach>
					</ul>
				</form>
			</div>
			<div id="pagingDiv">
				 <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum-1})">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="javascript:p_pageChange(${p})">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="javascript:p_pageChange(${p})">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum+1})">＞</a></li>
	                </c:if>
	            </ul>
            </div>
		</div>
	</div>
</body>
</html>