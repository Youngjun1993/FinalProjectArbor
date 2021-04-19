<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  
<title>회원 검색</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/slide2.css" type="text/css" />

<div class="w1400_container">
	<img src="<%=request.getContextPath() %>/img/subLogo.jpg">
		<div class="yh_select">
			<span class="yh_placeholder">관리자메뉴 1</span>
			<ul>
				<li>서브메뉴1</li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
				<li>서브메뉴4</li>
			</ul>
			</div>
			<br>
			<div class="yh_select yh_select--white">
			<span class="yh_placeholder">관리자메뉴 2</span>
			<ul>
				<li>서브메뉴1</li>
				<li>서브메뉴2</li>
				<li>서브메뉴3</li>
				<li>서브메뉴4</li>
			</ul>
		</div>
</div>

<script type="text/javascript">
	$('.yh_select').on('click','.yh_placeholder',function(){
	  var parent = $(this).closest('.yh_select');
	  if ( ! parent.hasClass('is-open')){
	    parent.addClass('is-open');
	    $('.yh_select.is-open').not(parent).removeClass('is-open');
	  }else{
	    parent.removeClass('is-open');
	  }
	}).on('click','ul>li',function(){
	  var parent = $(this).closest('.yh_select');
	  parent.removeClass('is-open').find('.yh_placeholder').text( $(this).text() );
	});
</script>
-->