<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arbor > EventList</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/event.js"></script>

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
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>공지사항</span></p>
		<div class="clearfix j_search">
			<form method="post" class="d_searchFrm" action="noticeAdminList">
				<select name="searchKey" id="d_searchKey">
					<option value="noticesubject">제목</option>
					<option value="noticecontent">내용</option>
				</select>
				<input type="text" name="searchWord" placeholder="검색어 입력"/>
				<input type="submit" class="adminMainBtn" value="검색"/>
			</form>
		</div>
		<ul class="clearfix" id="eventList">
			<li>NO</li>
			<li></li>
			<li>제목</li>
			<li></li>
			<li>등록일</li>
			<c:forEach var="noticeList" items="${noticeAdminList}">
				<li><p>${noticeList.noticeno }</p></li>
				<li></li>
				<li class="wordcut"><a href="noticeEditView?no=${noticeList.noticeno }">${noticeList.noticesubject }</a></li>
				<li></li>
				<li>${noticeList.noticedate }</li>
			</c:forEach>
		</ul>
		<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="j_insertBtn" value="공지등록"></p>
		<!-- 페이징 -->
		<ul id="d_paging" class="adPaging clearfix">
         <c:if test="${pageVO.pageNum>1 }">
            <li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeAdminList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
         </c:if>
         <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
            <c:if test="${p<=pageVO.totalPage }">
               <c:if test="${p==pageVO.pageNum }">
                  <li style="border-bottom:3px solid rgb(191,43,53);"><a href="noticeAdminList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
               <c:if test="${p!=pageVO.pageNum }">
                  <li><a href="noticeAdminList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
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