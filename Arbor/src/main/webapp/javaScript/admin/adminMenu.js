$(function() {

    $(".h_menu_list").find(".accordion-toggle").click(function() {
        $(this).next().toggleClass("open").slideToggle("fast");
        $(this).toggleClass("active-tab").find(".h_menu_link").toggleClass("active");

        $(".h_menu_list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open");
        $(".h_menu_list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".h_menu_link").removeClass("active");
	
    });
    
});