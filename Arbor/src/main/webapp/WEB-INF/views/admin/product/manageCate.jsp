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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>카테고리 관리</span></p>
			<div id="insertInfo">
				<p><span class=pTitle>카테고리</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div id="insertCategoryDiv">
					<form method="post" action="insertCate" class="clearfix">
						<div id="insertCateMainLeft">
						<span class="pContent">카테고리</span>
						<select name="mainno" id="maincate">
							<option value="" selected disabled hidden>대분류</option>
							<c:forEach var="mainCate" items="${mainCate }">
								<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
									<option value=${mainCate.mainno }>${mainCate.mainname }</option>
								</c:if>
							</c:forEach>
						</select>
						<select name="subno" id="subcate">
							<option value="" selected disabled hidden>중분류</option>
							<c:forEach var="subCate" items="${subCate }">
								<option value=${subCate.subno }>${subCate.subname }</option>
							</c:forEach>
						</select><br/>
						<span class="pContent">대분류등록</span>
						<input type="text" name="mainEdit" class="cateEditInput" /><br/>
						<input type="submit" value="대분류등록" class="adminMainBtn"/>
						</div>
						<div id="insertCateSubRight">
						<span class="pContent">중분류등록</span>
						<select name="mainno" id="maincate">
							<option value="" selected disabled hidden>==대분류선택==</option>
							<c:forEach var="mainCate" items="${mainCate }">
								<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
									<option value=${mainCate.mainno }>${mainCate.mainname }</option>
								</c:if>
							</c:forEach>
						</select><br/>
						<span class="pContent">&nbsp</span>
						<input type="text" name="subEdit" class="cateEditInput" autocomplete='off'/><br/>
						<input type="submit" value="중분류등록" class="adminMainBtn"/>
						</div>
					</form>
					<hr/>
					<form method="post" id="deleteCate" action="">
						<ul id="categoryList">
							<li class="tableHeader"><input type="checkbox" value="전체선택" id="listCheckAll"/></li>
							<li class="tableHeader">대분류번호</li>
							<li class="tableHeader">중분류번호</li>
							<li class="tableHeader">대분류</li>
							<li class="tableHeader">중분류</li>
							<li class="tableHeader"><input type="submit" value="선택삭제" class="adminMainBtn" formaction="javascript:deleteCate()"/></li>
							
							<c:forEach var="vo" items="${cateList }">
								<li><input type="checkbox" value="${vo.subno }"/></li>
								<li><input type="hidden" name="mainno" value="${vo.mainno }"/>${vo.mainno }</li>
								<li><input type="hidden" name="subno" value="${vo.subno }"/>${vo.subno }</li>
								<li><input type="hidden" name="mainname" value="${vo.mainname }"/>${vo.mainname }</li>
								<li><input type="hidden" name="subname" value="${vo.subname }"/>${vo.subname }</li>
								<li><input type="submit" class="adminSubBtn" value="수정" formaction="javascript:cateEditBtn(${vo.mainno }, '${vo.mainname }', ${vo.subno }, '${vo.subname }')"/>
								<input type="submit" class="adminSubBtn" value="삭제" formaction="javascript:cateDeleteBtn()"/></li>
							</c:forEach>
						</ul>
					</form>
					<form method="post" id="UpdateCateFrm" class="clearfix" action="cateEdit">
						<span class="pContent">대분류</span>
						<input type="hidden" name="mainno" value=""/>
						<input type="text" name="mainname" value=""/><br/>
						<span class="pContent">중분류</span>
						<input type="hidden" name="subno" value="" />
						<input type="text" name="subname" value="" /><br/>
						<input type="submit" class="adminMainBtn" id="UpdateCateFrmInput" value="수정" />	<button type="button" class="adminSubBtn" onclick="location.href='javascript:cancelCateFrm()'">닫기</button>
					</form>
				</div>
			</div>
			<div id="pagingDiv">
				 <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="manageCate?pageNum=${pageVO.pageNum-1}">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="manageCate?pageNum=${p}">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="manageCate?pageNum=${p}">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="manageCate?pageNum=${pageVO.pageNum+1}">＞</a></li>
	                </c:if>
	            </ul>
            </div>
		</div>
	</div>
</body>
</html>