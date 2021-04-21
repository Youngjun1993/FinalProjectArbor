$(function(){

	$(".p_qna_answer").parent().next().css('display', 'none');
	
	$(".p_qna_answer").click(function(){
		$(this).parent().next().css('display', 'block');
		$(this).parent().next().css('height', '100px');
	});
});