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
<script>

</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>>
		<div id="centerfrm">
			<p id="pageTitle"><span>카테고리 관리</span></p>
			<div id="insertInfo">
				<p><span class=pTitle>카테고리</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div id="insertCategoryDiv">
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
					<form method="post" action="">
						<span class="pContent">신규등록</span>
						<select name="insertTbl">
							<option value="maincate">대분류</option>
							<option value="subcate">중분류</option>
						</select>
						<input type="text" name="edit" id="searchWord" />
						<input type="submit" value="등록" class="adminMainBtn"/>
					</form>
					<hr/>
					<form>
						<ul id="categoryList">
							<li class="tableHeader"><input type="checkbox" value="전체선택" id="listCheckAll"/></li>
							<li class="tableHeader">대분류번호</li>
							<li class="tableHeader">중분류번호</li>
							<li class="tableHeader">대분류</li>
							<li class="tableHeader">중분류</li>
							<li class="tableHeader"><input type="submit" value="선택삭제" class="adminSubBtn"/></li>
							
							<c:forEach var="vo" items="${cateList }">
								<li><input type="checkbox" value="${vo.subno }"/></li>
								<li>${vo.mainno }</li>
								<li>${vo.subno }</li>
								<li>${vo.mainname }</li>
								<li>${vo.subname }</li>
								<li><a href="#">수정</a> | <a href="#">삭제</a></li>
							</c:forEach>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>