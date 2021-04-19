<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>회원 검색</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css" type="text/css" />

<div class="w1400_container">
	<!-- 좌측 메뉴박스 -->
	<div class="tree_box">
	<img src="<%=request.getContextPath() %>/img/subLogo.jpg">
		<div id="tree_menu">
			<ul class="tree_menu depth_1">
				<li class="depth_1box">
					<a href="#none"><em></em>회원관리</a>
					<ul class="depth_2">
						<li><a href="#none">회원검색</a></li>
						<li><a href="#none">휴면회원</a></li>
						<li><a href="#none">회원탈퇴 및 회원삭제</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#none"><em></em>상품관리</a>
					<ul class="depth_2">
						<li><a href="#none">상품등록</a></li>
						<li><a href="#none">상품수정 및 삭제</a></li>
					</ul>
				</li>
				<li>
					<a href="#none"><em></em>주문관리</a>
					<ul class="depth_2">
						<li><a href="#none">주문1</a></li>
						<li><a href="#none">주문2</a></li>
					</ul>
				</li>
				<li>
					<a href="#none"><em></em>게시판관리</a>
					<ul class="depth_2">
						<li><a href="#none">1</a></li>
						<li><a href="#none">2</a></li>
					</ul>
				</li>
				<li class="last">
					<a href="#none"><em></em>설정</a>
					<ul class="depth_2">
						<li><a href="#none">기타 설정</a></li>
						<li><a href="#none">반품 설정</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

<script>
function tree_menu() {
	  // $('.depth_1');
	  $('ul.depth_1 >li > a').click(function(e) {

	    var temp_el = $(this).next('ul');
	    var depth_2 = $('.depth_2');

	    // 처음에 모두 슬라이드 업 시켜준다.
	    depth_2.slideUp(500);
	    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
	    depth_2.parent().find('em').removeClass('on');

	    if (temp_el.is(':hidden')) {
	      temp_el.slideDown(500);
	      $(this).find('em').addClass('on');
	    } else {
	      temp_el.slideUp(500);
	      $(this).find('em').removeClass('on');
	    }
	    return false;
	  });
	}
	if ($('#tree_menu').is(':visible')) {
	  tree_menu();
	}
</script>
