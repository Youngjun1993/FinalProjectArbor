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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script>

</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<div id="sidefrm">사이드메뉴</div>
		<div id="centerfrm">
			<h1>카테고리 관리</h1>
			<div id="insertInfo">
				<p><span class=pTitle>카테고리 관리</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div id="insertCategoryDiv">
					<span class="pContent"></span>
					<span class="pContent">대분류</span>
					<span class="pContent"></span>
					<span class="pContent">중분류</span>
					<br/>
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
						<input type="submit" value="등록" />
					</form>
					<hr/>
					<form>
						<p><input type="checkbox" id="listCheckAll"/>전체선택
						<input type="submit" value="선택삭제"/><p>
						<ul id="categoryList">
							<li>&nbsp</li>
							<li>대분류번호</li>
							<li>중분류번호</li>
							<li>대분류</li>
							<li>중분류</li>
							<li>&nbsp</li>
							
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