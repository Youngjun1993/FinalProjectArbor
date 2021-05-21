<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/noticeEdit.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script>
	$(function(){
		
		$('#d_insertBtn').click(function(){
			console.log('sdfsadfasdf');
			location.href="noticeInsert";
		});
	});
</script>
</head>
<body>
<div class="w1400_container font_ng clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="d_noticeEdit">
		<h3 class="d_h1">공지사항</h3>
		<div class="clearfix d_search">
			<form method="post" class="d_searchFrm" action="noticeAdminList">
				<select name="searchKey" id="d_searchKey">
					<option value="noticesubject">제목</option>
					<option value="noticecontent">내용</option>
				</select>
				<input type="text" name="searchWord" placeholder="검색어 입력"/>
				<input type="submit" class="adminMainBtn" value="검색"/>
			</form>
		</div>
		<ul id="d_list" class="d_noticeList">
			<li class="d_ff"><p>번호</p></li>
			<li>제목</li>
			<li>등록일</li>
		</ul>
	    <div id="d_listContent" class="d_noticeList">
		<ul>
			<c:forEach var="noticeList" items="${noticeAdminList}">
			<li><p>${noticeList.noticeno }</p></li>
			<li class="wordcut"><a href="noticeEditView?no=${noticeList.noticeno }">${noticeList.noticesubject }</a></li>
			<li>${noticeList.noticedate }</li>
			</c:forEach>
		</ul>
		</div>
		<p class="d_noticeSetBtn"><input type="button" class="adminMainBtn" id="d_insertBtn" value="공지사항 등록"></p>
		<!-- 페이징 -->
		<ul id="d_paging" class="adPaging clearfix">
			<c:if test="${pageVO.pageNum>1 }">
				<li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeAdminList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
			</c:if>
			<c:if test="${pageVO.pageNum==1 }">
				<li style="border-bottom:none;">&nbsp</li>
			</c:if>
			<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
				<c:if test="${p<=pageVO.totalPage }">
					<c:if test="${p==pageVO.pageNum }">
						<li style="border-bottom:3px solid rgb(191,43,53);"><a href="noticeAdminList?pageNum=${p }">${p }</a></li>
					</c:if>
					<c:if test="${p!=pageVO.pageNum }">
						<li><a href="noticeAdminList?pageNum=${p }">${p }</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pageVO.pageNum<pageVO.totalPage }">
				<li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeAdminList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>