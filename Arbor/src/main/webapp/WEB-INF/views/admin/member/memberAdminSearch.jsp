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
	
	
	<!-- 회원검색 컨테이너-->
	<div class="h_memberSearch_header">회원 검색</div>
	<div class="h_mainContainer">
	<form>
	<table class="h_formtable">
	<!-- 검색어 -->
	<tr>
		<td>
		<label for="userid">검색어</label>
		</td>
		<td>
		<select name="memSearchCate" id="searchCate" class="h_searchSelect">
			<option value="번호">번호</option>
			<option value="">아이디</option>
			<option value="">성명</option>
		</select>
		<input type="text" name="memSearchWord" id="memSearchWord" size="20px" class="h_ipt">
		</td>
		<!-- 이메일수신여부 -->
		<tr>
		<td>
		<label for="smsok">이메일 수신 여부</label>
		</td>
	 	<td>
		<input type="radio" name="emailok" class="h_radiochk" value="ALL" checked>전체
		<input type="radio" name="emailok" class="h_radiochk" value="Y">예
		<input type="radio" name="emailok" class="h_radiochk" value="N">아니오
		</td>
		</tr>
		<!-- 문자수신여부 -->
		<tr>
		<td>
		<label for="userid">문자수신여부</label>
		</td>
		<td class="h_last_td">
		<select name="memSmsCate" id="memSmsCate" class="h_searchSelect">
			<option value=""></option>
			<option value="ok">예</option>
			<option value="no">아니오</option>
		</select>
		</td>
	</tr>
	</table>
	<div><input type="button" id="memSearchBtn" value="검색" class="h_memSearchBtn"></div>	
	</form>
	<hr/>
	<!-- 폼 가운데 버튼 -->
		<div>
			<input type="button" id="" value="문자발송" class="h_memSearchBtn">
			<input type="button" id="" value="버튼1" class="h_memSearchBtn">
			<input type="button" id="" value="버튼2" class="h_memSearchBtn">
		</div>
	<!-- 회원목록 -->
	
	<ul class="h_memSearchList clearfix">
		
		<li class="h_listHeader">체크박스위치</li>
		<li class="h_listHeader">아이디</li>
		<li class="h_listHeader">성명</li>
		<li class="h_listHeader">이메일</li>
		<li class="h_listHeader">연락처</li>
		<li class="h_listHeader">가입일</li>
		<li class="h_listHeader">최근접속일</li>
		<li class="h_listHeader">관리</li>
		
	<c:forEach var="vo" items="${list}">
		<li><input type="checkbox" name="memberChk" value="vo번호"/></li>
		<li>${vo.userid}</li>
		<li>${vo.username}</li>
		<li class="wordcut">${vo.email}</li>
		<li>${vo.tel}</li>
		<li>${vo.regdate}</li>
		<li>${vo.lastdate}</li>
		<li><input type="button" name="memberDelBtn" value="삭제"/></li>
	</c:forEach>
	</ul>
	</div>
</div>

</body>
</html>




	



