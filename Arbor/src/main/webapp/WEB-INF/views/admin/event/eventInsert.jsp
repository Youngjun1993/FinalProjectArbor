<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("eventContent");
		
		//datepicker 옵션 설정
		$.datepicker.setDefaults({
			dateFormat: "yy/mm/dd",
			dayNamesMin: ['일','월','화','수','목','금','토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearSuffix: "년",
			showOtherMonths: true,		//빈 공간에 앞뒤월의 날짜 표시
			showMonthAfterYear:true,	//년+월
			changeYear: true,			//콤보박스 연도 선택 가능
			changeMonth: true,			//콤보박스 월 선택 가능
			showOn: "both",				//both:버튼을 누르거나 input을 클릭하면 달력 표시	
	        buttonImage: "<%=request.getContextPath()%>/img/calendar2.png",
	        buttonImageOnly: true
		});
		$("#eventStart").datepicker();
		$("#eventEnd").datepicker();
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm" id="j_insertFrm">
		<h1>이벤트 등록</h1>
		<form method="post" action="eventInsertOk" enctype="multipart/form-data">
			<div>
				<span class="j_category">제목</span>
					<input type="text" name="eventSubject" id="eventSubject"/><br/>
				<span class="j_category">이벤트 기간</span> 
					<input type="text" name="eventStart" id="eventStart" placeholder="시작일"/> ~ 
					<input type="text" name="eventEnd" id="eventEnd" placeholder="종료일"/><br/>
				<span class="j_category">타이틀 이미지</span>
					<input type="file" name="img1"/><br/>
				<span class="j_category">이벤트 이미지</span>
					<input type="file" name="img2"/><br/><br/>
				<textarea name="eventContent" id="eventContent"></textarea>
				<p id="j_eventInsertBtn"><input type="submit" value="등록"> <input type="button" value="취소"></p>
			</div>
		</form>
	</div>
</div>
</body>
</html>