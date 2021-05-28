$(function(){
	/*--------------
		이벤트 목록
	---------------*/
	$("#j_insertBtn").click(function(){
		location.href="eventInsert";
	});

	//페이징 li만큼 갯수
	var liCnt = $(".adPaging>li").length;
	$(".adPaging").css({
		"width" : liCnt*40+"px",
		"margin" : "30px auto"
	});	
	
	//검색창 유효성 검사
	$('.j_searchFrm').submit(function(){
		if($('.j_searchFrm input[type="text"]').val()==""){
			alert("검색어를 입력하세요.");
			$('.j_searchFrm input[type="text"]').focus();
			return false;
		}
		return true;
	});
	
		
	/*--------------
		이벤트 등록
	---------------*/
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
});

	/*--------------
		 이벤트 뷰
	---------------*/	
$(function(){
	$("#j_eventListBtn").click(function(){
		location.href="eventList";
	});
});
function eventDel(eventNo){
	if(confirm("해당 이벤트를 삭제하시겠습니까?")){
		location.href="eventDel?eventNo="+eventNo;				
	}
}
	
	/*--------------
		이벤트 수정
	---------------*/
$(function(){
	//첨부파일 삭제
	$("#j_editFrm b").click(function(){
		$(this).parent().css("display", "none");
		$(this).parent().next().attr("name", "delFile");
		$(this).parent().next().removeAttr("id");
		$(this).parent().next().removeAttr("name");
		$(this).parent().next().next().attr("type", "file");
		$(this).parent().next().next().attr("name", "img1");
		$(this).parent().next().next().attr("id", "j_eventImg1");
	});
	
	//EVENT Edit 유효성 검사
	$("#j_editOkBtn").on('click', function(){
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
		}else if($('#j_eventContent').summernote('code')=='' || $('#j_eventContent').summernote('code')==null){
			alert("본문 내용은 필수 입력 항목입니다.");
			return false;
		}
		
		$("#j_eventImg1").attr("type", "file");
		$("#j_eventEditFrm").submit();
	});

	








	
});
