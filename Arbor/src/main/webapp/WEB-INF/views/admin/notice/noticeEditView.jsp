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
		$('#d_noticeListBtn').click(function(){
			location.href="noticeAdminList";
		});
		
		$("#d_bordDel").click(()=>{
			if(confirm("삭제하시겠습니까?")){
				location.href = "boardDelete?no=${noticeEditView.noticeno}";
			}
		});
	});
</script>
</head>
<body>
<div class="w1400_container clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div id="d_viewBox">
		<h1 class="d_h1">공지사항</h1>
		<div id="d_viewSubject">
			<h5>${noticeEditView.noticesubject }</h5>
		</div>
		<div>
			<span>Arbor |  ${noticeEditView.noticedate }</span>
		</div>
		<div>
			<span>${noticeEditView.noticecontent }</span>
		</div>
		<p class="d_noticeSetBtn">
			<input type="button" class="adminMainBtn" onclick="location.href='noticeEdit?no=${noticeEditView.noticeno}'" value="수정"/> 
			<input type="button" class="adminSubBtn" id="d_bordDel" value="삭제"/> 
			<input type="button" class="adminSubBtn" id="d_noticeListBtn" value="목록"/>
		</p>
	</div>
</div>
</body>
</html>