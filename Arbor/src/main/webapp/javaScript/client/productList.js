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
      	$('#p_fixedDiv').fadeIn('fast');
      } else {
      	$('#p_fixedTop').fadeOut('fast');
      	$('#p_fixedDiv').fadeOut('fast');
      }
    });

    $('p_fixedTop').click(function () {
      $('html, body').animate({ scrollTop:0 }, 'slow');
      return false;
    });
	
	$("#p_optionClose").click(function(){
		$("#p_optionClose").hide();
		$("#p_fixedDetailDiv").hide();
		$("#p_totalprice3").hide();
		$("#p_optionOpen").show();
	});
	
	$("#p_optionOpen").click(function(){
		$("#p_optionClose").show();
		$("#p_fixedDetailDiv").show();
		$("#p_totalprice3").show();
		$("#p_optionOpen").hide();
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

