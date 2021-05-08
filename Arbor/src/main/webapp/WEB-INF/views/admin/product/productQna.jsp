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
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>상품문의관리</span></p>
			<div id="insertInfo">
				<p><span class=pTitle>문의글 검색</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<form method="post" action="">
						<span class="pContent">검색어</span>
						<select name="searchKey" id="searchKey">
							<option value="pno">상품번호</option>
							<option value="userid">사용자ID</option>
							<option value="pqnasubject">제목</option>
							<option value="pqnacontent">내용</option>
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
						<input type="submit" value="Search" class="adminMainBtn"/>
						<br/>
					</form>
				</div>
			</div>
			<br/><br/>
			<div id="productQnaList" class="clearfix">
				<p><span class=pTitle>상품문의목록</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<button type="button" class="adminSubBtn">미답변글(${cnt })</button>
				<ul id="productQnaList_ul" class="clearfix">
					<li class="tableHeader"><input type="checkbox" value="전체선택" id="listCheckAll"/></li>
					<li class="tableHeader wordcut">상품명</li>
					<li class="tableHeader wordcut">문의제목</li>
					<li class="tableHeader">작성자</li>
					<li class="tableHeader">작성일</li>
					<li class="tableHeader">답변상태</li><br/>
					<c:forEach var="vo" items="${vo }">
						<li><input type="checkbox" value="${vo.pqnano }"/></li>
						<li class="wordcut">${vo.pname }</li>
						<li class="wordcut"><a href="pqnaAnswer?pqnano=${vo.pqnano }">${vo.pqnasubject }</a></li>
						<li>${vo.userid }</li>
						<li>${vo.pqnadate }</li>
						<c:if test="${vo.panswercontent=='' || vo.panswercontent==null }">
							<li>답변대기중</li>
						</c:if>
						<c:if test="${vo.panswercontent!='' && vo.panswercontent!=null }">
							<li>답변완료</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>