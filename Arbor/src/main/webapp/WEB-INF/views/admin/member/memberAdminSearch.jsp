<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>회원 검색</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />

<div class="w1400_container">
	<div class="h_sidemenuContainer">
	<img src="<%=request.getContextPath() %>/img/subLogo.jpg" class="h_sub">
		<!-- 사이드메뉴 시작  -->
		<div class="h_select">
			<span class="h_placeholder">회원관리</span>
			<ul>
				<li><a href="#123" class="h_alink">회원검색</a></li>
				<li>휴면계정</li>
				<li>회원탈퇴 및 삭제</li>
			</ul>
			</div>
		<div class="h_select h_select_white">
			<span class="h_placeholder">관리자메뉴 2</span>
			<ul>
				<li><a href="#123" class="h_alink">서브메뉴1</a></li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
				<li>서브메뉴4</li>
			</ul>
		</div>
		<div class="h_select ">
			<span class="h_placeholder">관리자메뉴 3</span>
			<ul>
				<li><a href="#123" class="h_alink">서브메뉴1</a></li>
				<li>서브메뉴1</li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
			</ul>
		</div>
		<div class="h_select h_select_white">
			<span class="h_placeholder">관리자메뉴 4</span>
			<ul>
				<li><a href="#123" class="h_alink">서브메뉴1</a></li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
				<li>서브메뉴4</li>
			</ul>
		</div>
		<div class="h_select ">
			<span class="h_placeholder">관리자메뉴 5</span>
			<ul>
				<li><a href="#123" class="h_alink">서브메뉴1</a></li>
				<li>서브메뉴1</li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
			</ul>
		</div>
	</div>
	<!-- 사이드메뉴 끝 -->
	<div class="h_mainContainer">
	dd
	</div>
</div>

<script type="text/javascript">
	$('.h_select').on('click','.h_placeholder',function(){
	  var parent = $(this).closest('.h_select');
	  if (!parent.hasClass('selected')){
	    parent.addClass('selected');
	    $('.h_select.selected').not(parent).removeClass('selected');
	  }else{
	    parent.removeClass('selected');
	  }
	});
</script>
