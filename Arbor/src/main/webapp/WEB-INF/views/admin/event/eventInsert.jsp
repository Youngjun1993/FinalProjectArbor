<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arbor > EventInsert</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/event.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/eventInsertEdit.js"></script>
<!-- datepicker -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/javaScript/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>이벤트 등록</span></p>
		<form method="post" id="j_eventInsertFrm" action="eventInsertOk" enctype="multipart/form-data">
			<div>
				<span class="j_category">제목</span> <input type="text" name="eventSubject" id="j_eventSubject"/><br/>
				<span class="j_category">이벤트 기간</span> 
					<input type="text" name="eventStart" id="j_eventStart" placeholder="시작일"/> ~ 
					<input type="text" name="eventEnd" id="j_eventEnd" placeholder="종료일"/><br/>
				<span class="j_category">타이틀 이미지</span> <input type="file" name="img1" id="j_eventImg1"/>
				<br/><br/>
				<textarea name="eventContent" id="j_eventContent"></textarea><br/>
				<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="j_eventInsertBtn" value="등록"> <input type="button" class="adminSubBtn" id="j_insertCnlBtn" value="취소"></p>
			</div>
		</form>
	</div>
</div>
</body>
</html>