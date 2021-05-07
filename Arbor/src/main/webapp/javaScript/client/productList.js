$(function(){
	
	$(".p_qna_answer").parent().next().css('display', 'none');
	
	$(".p_qna_answer").click(function(){
		$(this).parent().next().css('display', 'block');
		$(this).parent().next().css('height', '100px');
	});
	
});

<!-- 상품문의 글작성 폼 띄우기 -->
function hiddenOpen() {
	$("#p_qna_hidden").show();
}

<!-- 상품문의 취소시 폼 닫기 -->
function hiddenClose() {
	$("#p_qna_hidden").hide();
}

<!-- 상품문의 글 등록하기 -->
function pqnaInsert() {
	var data = $("#p_qna_hiddenFrm").serialize();
	console.log(data);
	$.ajax({
		url : 'pqnaInsert',
		data : data,
		type : 'POST',
		success : (result)=>{
			if(result>0) {
				alert("정상적으로 처리되었습니다.");
				$("#p_qna_hidden").hide();
			}
		}, error : (e)=>{
		
		}
	});
}