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
	
	// Datepicker
	$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
	$("#startDate").datepicker({
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
	    	$("#endDate").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#endDate").datepicker({ 
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
	    	$("#startDate").datepicker("option", "maxDate", selectedDate);
	    }
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
