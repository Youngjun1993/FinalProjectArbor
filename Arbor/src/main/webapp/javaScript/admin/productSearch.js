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
