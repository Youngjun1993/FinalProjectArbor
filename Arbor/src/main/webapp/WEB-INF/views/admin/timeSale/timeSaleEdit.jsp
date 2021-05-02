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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/timeSale.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/summernote/summernote-lite.css" />
<!-- Air datepicker -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="<%=request.getContextPath()%>/javaScript/datepicker/datepicker.min.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/javaScript/datepicker/datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/javaScript/datepicker/datepicker.ko.js"></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/javaScript/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/lang/summernote-ko-KR.js"></script>
<script>
	$(function(){
		//datepicker 옵션 설정
		$(".j_datepicker").datepicker({
			language: 'ko',
			timepicker: true,
			timeFormat: "hh:ii",
			todayButton: new Date(),
			minDate: new Date()
		});
		
		//summernote
		$("#saleContent").summernote({
			height: 300,
			minHeight: 300,
			maxHeight: 300,
			focus: false,
			lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
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
		function uploadSummernoteImageFile(file, editor){
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data: data,
				type: 'POST',
				url: 'uploadSummernoteImageFile',
				contentType: false,
				processData: false,
				success: function(data){
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
	
		//상품번호에 따른 상품명, 상품가격 불러오기
		$("#j_pSearchBtn").click(function(){
			$.ajax(
				{
					data: {
						pNo: $("#j_pNo").val()
					},
					type: 'POST',
					url: 'pInfoSearch',
					dataType: 'json',
					success: function(result){
						$("#j_pName").val(result.pname);
						$("#j_pPrice").val(result.pprice);
					},error: function(error){
						alert("유효하지 않은 상품번호 입니다.");
						$("#j_pNo").val("");
						$("#j_pNo").focus();						
					}
				}
			)
		});
		
		//TimeSale Edit 유효성 검사
		$("#j_tsEditBtn").on('click', function(){
			if($('#j_pNo').val()=='' || $('#j_pNo').val()==null){
				alert("상품번호는 필수 입력 항목입니다.");
				$('#j_pNo').focus();
				return false;
			}else if($('#j_salePrice').val()=='' || $('#j_salePrice').val()==null){
				alert("할인가격은 필수 입력 항목입니다.");
				$('#j_salePrice').focus();
				return false;
			}else if($('#saleStart').val()=='' || $('#saleStart').val()==null){
				alert("이벤트 시작일은 필수 입력 항목입니다.");
				return false;
			}else if($('#saleEnd').val()=='' || $('#saleEnd').val()==null){
				alert("이벤트 종료일은 필수 입력 항목입니다.");
				return false;
			}else if($('#saleContent').val()=='' || $('#saleContent').val()==null){
				alert("본문 내용은 필수 입력 항목입니다.");
				return false;
			}
			$("#j_timeSaleEditFrm").submit();
		});
		
		$("#j_tsEditCnlBtn").click(function(){
			location.href="timeSaleView";
		});

	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm">
		<h1>타임세일 등록</h1>
		<form method="post" id="j_timeSaleEditFrm" action="timeSaleEditOk">
			<div>
				<input type="hidden" name="saleNo" value="${vo.saleNo }"/>
				<span class="j_category">TIMESALE No.</span> ${vo.saleNo }<br/>
				<span class="j_category">상품번호</span> <input type="text" name="pNo" id="j_pNo" value="${vo.pNo }"/>
				<input type="button" class="adminMainBtn" id="j_pSearchBtn" value="조회"/><br/>
				<span class="j_category">상품명</span> <input type="text" name="pName" id="j_pName" disabled value="${vo.pName }"/><br/>
				<span class="j_category">상품가격</span> <input type="text" name="pPrice" id="j_pPrice" disabled value="${vo.pPrice }"/><br/>
				<span class="j_category">할인가격</span> <input type="text" name="salePrice" id="j_salePrice" value="${vo.salePrice }"/><br/>
				<span class="j_category">이벤트 기간</span>
					<input type="text" name="saleStart" id="saleStart" class="j_datepicker" placeholder="시작일" value="${vo.saleStart }"/> ~ 
					<input type="text" name="saleEnd" id="saleEnd" class="j_datepicker" placeholder="종료일" value="${vo.saleEnd }"/>
				<br/><br/>
				<textarea name="saleContent" id="saleContent">${vo.saleContent }</textarea>
				<br/>
				<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="j_tsEditBtn" value="수정"> <input type="button" class="adminSubBtn" id="j_tsEditCnlBtn" value="취소"></p>
			</div>
		</form>
	</div>
</div>
</body>
</html>