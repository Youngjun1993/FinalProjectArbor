$(function(){

	$(".p_HoverImg2").hide();
	$("#p_optionOpen").hide();
	$('#p_fixedTop').fadeOut('fast');
   	$('#p_fixedDiv').fadeOut('fast');
	
	$(".p_HoverImg1").mouseover(function(){
		$(this).hide();
		$(this).next().show();
	});
	
	$(".p_HoverImg2").mouseout(function(){
		$(this).hide();
		$(this).prev().show();
	});
	
	
	$(window).scroll(function(){
      if($(window).scrollTop()>1300) {
      	$('#p_fixedTop').fadeIn('fast');
      } else {
      	$('#p_fixedTop').fadeOut('fast');
      }
    });

    $('p_fixedTop').click(function () {
      $('html, body').animate({ scrollTop:0 }, 'slow');
      return false;
    });

});

<!-- 상품문의 글작성 폼 띄우기 -->
function hiddenOpen() {
	$("#p_pqna").css('overflow', 'visible');
	$("#p_qna_hidden").show();
}

<!-- 상품문의 취소시 폼 닫기 -->
function hiddenClose() {
	$("#p_pqna").css('overflow', 'auto');
	$("#p_qna_hidden").hide();
}


