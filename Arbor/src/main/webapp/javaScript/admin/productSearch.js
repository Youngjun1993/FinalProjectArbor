$(function(){
	
	$(".pTitle").next().next().hide();
	
	$(".pTitle").next().click(function(){
		$(this).parent().next().next().css('display', 'none');
		$(this).next().show();
		$(this).hide();
	});
	
	$(".pTitle").next().next().click(function(){
		$(this).parent().next().next().css('display', 'block');
		$(this).hide();
		$(this).prev().show();
	});
	
	// mainCate, subCate 셀렉트 박스 변환
	$("#maincate").change(function() {
		var url="subCateList";
		var param = "mainno="+$(this).val();
		$.ajax({
			url : url,
			data : param,
			success : function(result) {
				var $result = $(result);
				var tag="";
				$result.each(function(idx, val){
					tag += "<option value='"+val.subno+"'>"+val.subname+"</option>";
				});
				$("#subcate").html(tag);
			}, error : function(e) {
				
			}
		});
	});
	
	$('#listCheckAll').click(function() {
		if($(this).prop("checked")) {
			// 전체선택이 체크된 상태인경우
			$('input[type=checkbox]').prop("checked", true);
		} else {
			// 전체선택 해제한 경우
			$('input[type=checkbox]').prop("checked", false);
		}
	});
	
	$("#pqnaListBack").click(function() {
		location.href="pqnaList";
	});
	
	$("#pqnaNoAnswerList").click(function() {
		location.href="pqnaNoAnswerList";
	}).
	
	// Datepicker
	$("#startdate").datepicker({
		changeMonth: true, 
	    changeYear: true,
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dateFormat: "yy-mm-dd",
	    maxDate: 0, // 오늘일자 이후 선택불가 설정
	    onClose : function(selectedDate){
	    	// 시작일 datepicker가 닫히면 종료일 datepick는 시작일 이전 선택불가하게 설정
	    	$("#enddate").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#enddate").datepicker({ 
		changeMonth: true, 
	    changeYear: true,
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dateFormat: "yy-mm-dd",
	    maxDate: 0, // 오늘일자 이후 선택불가 설정
	    onClose : function(selectedDate){
	    	// 종료일 datepicker가 닫히면 시작일 datepick는 종료일 이후 선택불가하게 설정
	    	$("#startdate").datepicker("option", "maxDate", selectedDate);
	    }
	});
	
});

function productdel(pno){
	if(confirm(pno+"번 상품을 삭제하시겠습니까?")) {
		location.href="productDelete?pno="+pno;
	}
}

function pqnaAnswerDelete(pqnano) {
	if(confirm(pqnano+"번 글을 블라인드 처리하시겠습니까? 내용만 사라지게 됩니다.")) {
		location.href="pqnaAnswerDelete?pqnano="+pqnano;
	}
}

function pDateClick(no) {
	var today = new Date();
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	var now = formatDate(year+"-"+month+"-"+date);
	if(no==1) {
		$("#startdate").val(formatDate(new Date()));
		$("#enddate").val(formatDate(new Date(today.setDate(today.getDate()+1))));
	} else if(no==2) {
		$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-7))));
		$("#enddate").val(formatDate(new Date()));
	} else if(no==3) {
		$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-30))));
		$("#enddate").val(formatDate(new Date()));
	} else if(no==4) {
		$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-90))));
		$("#enddate").val(formatDate(new Date()));
	} else if(no==5) {
		$("#startdate").val(formatDate(new Date(today.setDate(today.getDate()-365))));
		$("#enddate").val(formatDate(new Date()));
	}
}

function formatDate(date) {
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	return [year, month, day].join('-');
}
