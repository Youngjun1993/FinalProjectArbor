$(function() {
	var pathName = $(location).attr('pathname');
	if(pathName == "/home/couponAdList"){
		$(".y_couponAdBtnLi a").css({
			"background":"rgb(191,43,53)",
			"color":"#fff"
		})
	}else if(pathName == "/home/reviewAdList"){
		$(".y_reviewAdBtnLi a").css({
			"background":"rgb(191,43,53)",
			"color":"#fff"
		})
	}
	
	$(".y_couponAdBtnLi").hover(function(){
		$(this).children('a').css({"color":"#fff", "background":"rgb(191,43,53)"})
	}, function(){
		if(pathName == "/home/couponAdList"){
			$(this).children('a').css({"color":"#fff", "background":"rgb(191,43,53)"})
		}else{
			$(this).children('a').css({"color":"#333", "background":"#fff"})
		}
	})
	$(".y_reviewAdBtnLi").hover(function(){
		$(this).children('a').css({"color":"#fff", "background":"rgb(191,43,53)"})
	}, function(){
		if(pathName == "/home/reviewAdList"){
			$(this).children('a').css({"color":"#fff", "background":"rgb(191,43,53)"})
		}else{
			$(this).children('a').css({"color":"#333", "background":"#fff"})
		}
	})
	
    $(".h_menu_list").find(".accordion-toggle").click(function() {
        $(this).next().toggleClass("open").slideToggle("fast");
        $(this).toggleClass("active-tab").find(".h_menu_link").toggleClass("active");

        $(".h_menu_list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open");
        $(".h_menu_list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".h_menu_link").removeClass("active");
	
    });
});

function p_pageChange(pageNum){
	$("#p_pageNum").val(pageNum);
	$("#p_productSearchFrm").submit();
}