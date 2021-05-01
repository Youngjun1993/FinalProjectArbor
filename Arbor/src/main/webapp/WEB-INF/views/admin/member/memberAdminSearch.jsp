<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />


<script>

$(function() {

    $(".h_menu_list").find(".accordion-toggle").click(function() {
        $(this).next().toggleClass("open").slideToggle("fast");
        $(this).toggleClass("active-tab").find(".h_menu_link").toggleClass("active");

        $(".h_menu_list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open");
        $(".h_menu_list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".h_menu_link").removeClass("active");
	
    });
    
});
</script>
</head>
<body>
<div class="w1400_container">
	<div class="h_sidemenuContainer">
	<img src="<%=request.getContextPath() %>/img/sublogo.jpg" class="h_sub">
	
	<!-- 관리자 공통메뉴 -->	
	<div id="h_menucontainer">
            <ul class="h_menu_list accordion">
                <!-- 관리자 1번 메뉴 -->
                <li id="h_largemenu" class="toggle accordion-toggle"> 
                    <a class="h_menu_link" href="#">회원관리</a>
                </li>
                <ul class="h_menu_submenu accordion-content">
                    <li><a class="head" href="#">Submenu1</a></li>
                    <li><a class="head" href="#">Submenu2</a></li>
                    <li><a class="head" href="#">Submenu3</a></li>
                </ul>
                <!-- 관리자 2번 메뉴 -->
                <li id="nav1" class="toggle accordion-toggle"> 
                    <a class="h_menu_link" href="#">상품관리</a>
                </li>
                <ul class="h_menu_submenu accordion-content">
                    <li><a class="head" href="#">Submenu1</a></li>
                    <li><a class="head" href="#">Submenu2</a></li>
                    <li><a class="head" href="#">Submenu3</a></li>
                </ul>
                <!-- 관리자 3번 메뉴 -->
                <li id="nav1" class="toggle accordion-toggle"> 
                    <a class="h_menu_link" href="#">결제관리</a>
                </li>
                <ul class="h_menu_submenu accordion-content">
                    <li><a class="head" href="#">Submenu1</a></li>
                    <li><a class="head" href="#">Submenu2</a></li>
                    <li><a class="head" href="#">Submenu3</a></li>
                </ul>
                <!-- 관리자 4번 메뉴 -->
                <li id="nav1" class="toggle accordion-toggle"> 
                    <a class="h_menu_link" href="#">문의관리</a>
                </li>
                <ul class="h_menu_submenu accordion-content">
                    <li><a class="head" href="#">Submenu1</a></li>
                    <li><a class="head" href="#">Submenu2</a></li>
                    <li><a class="head" href="#">Submenu3</a></li>
                </ul>
                
            </ul>
            <!-- menu-list accordion-->
	</div>
        </div>
	<div class="h_mainContainer">
	dd
	</div>
</div>

</body>
</html>




	



