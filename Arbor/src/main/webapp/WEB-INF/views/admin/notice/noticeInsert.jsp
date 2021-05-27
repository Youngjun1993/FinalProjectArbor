<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeInsert</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/event.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/noticeEdit.css" type="text/css" />
<%-- <script src="<%=request.getContextPath() %>/javaScript/admin/eventInsertEdit.js"></script> --%>
<!-- datepicker -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/javaScript/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/lang/summernote-ko-KR.js"></script>
<script>
$(function(){
	$('#d_noticeInsertBtn').click(function(){
		if($("#d_noticeSubject").val()=="" ){
			alert("공지사항 제목을 입력하세요.");
			return false;
		}else if($("#d_noticeInsert").val()==""){
			alert("공지사항 내용을 입력하세요.");
			return false;
		}
		$('#noticeFrm').submit();
	});
	
	$('#d_insertCnlBtn').click(function(){
		location.href="noticeAdminList";
	});

	
	//summernote
	$("#d_noticeInsert").summernote({
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
});

</script>
</head>
<body>
<div class="w1400_container font_ng clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="d_noticeEdit">
		<h1 class="d_h1">공지사항 등록</h1>
		<form method="post" id="noticeFrm" action="noticeInsertOk" enctype="multipart/form-data">
			<div>
				<span class="d_editFont">제목: </span><input type="text" name="noticesubject" id="d_noticeSubject"/><br/>
				<br/><br/>
				<textarea name="noticecontent" id="d_noticeInsert"></textarea><br/>
				<p class="d_noticeInsertBtn">
					<input type="button" class="adminMainBtn" id="d_noticeInsertBtn" value="등록">
					<input type="button" class="adminSubBtn" id="d_insertCnlBtn" value="취소">
				</p>
			</div>
		</form>
	</div>
</div>
</body>
</html>