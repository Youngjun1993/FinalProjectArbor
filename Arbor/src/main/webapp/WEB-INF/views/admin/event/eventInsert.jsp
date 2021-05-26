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
<script>
$(function(){
<%-- 		//datepicker 옵션 설정
		$.datepicker.setDefaults({
			dateFormat: "yy-mm-dd",
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
		$("#j_eventStart").datepicker();
		$("#j_eventEnd").datepicker();
		
		//summernote
		$("#j_eventContent").summernote({
			height: 400,
			minHeight: 400,
			maxHeight: 400,
			focus: false,
			lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
					console.log(files)
					uploadSummernoteImageFile(files[0], this);
				},
				onPaste: function(e){
					var clipboardData = e.originalEvent.clipboardData;
					if(clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if(item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			},
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
				['color', ['forecolor', 'color']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert', ['picture', 'link']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
		
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			console.log(file)
			console.log(data)
			$.ajax({
				data: data,
				type: 'POST',
				url: 'uploadSummernoteImageFile',
				contentType: false,
				processData: false,
				success: function(data) {
					console.log('success')
					console.log('data->'+data)
					$(editor).summernote('insertImage', data);
				},
				error: function() {
					console.log('error')
				}
			});
		}
		
		//EVENT Insert 유효성 검사
		$("#j_eventInsertBtn").on('click', function(){
			if($('#j_eventSubject').val()=='' || $('#j_eventSubject').val()==null){
				alert("제목은 필수 입력 항목입니다.");
				$('#j_eventSubject').focus();
				return false;
			}else if($('#j_eventStart').val()=='' || $('#j_eventStart').val()==null){
				alert("이벤트 시작일은 필수 입력 항목입니다.");
				return false;
			}else if($('#j_eventEnd').val()=='' || $('#j_eventEnd').val()==null){
				alert("이벤트 종료일은 필수 입력 항목입니다.");
				return false;
			}else if($('#j_eventImg1').val()=='' || $('#j_eventImg1').val()==null){
				alert("이벤트 타이틀 이미지는 필수 입력 항목입니다.");
				return false;
			}else if($('#j_eventContent').val()=='' || $('#j_eventContent').val()==null){
				alert("본문 내용은 필수 입력 항목입니다.");
				return false;
			}
			$("#j_eventInsertFrm").submit();
		});
		
		//등록 취소 버튼
		$('#j_insertCnlBtn').click(function(){
			location.href="eventList";
		});
		
	}); --%>
</script>
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