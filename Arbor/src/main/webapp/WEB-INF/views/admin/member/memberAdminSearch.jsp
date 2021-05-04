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
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>

</head>
<body>
<div class="w1400_container clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<!-- 회원검색 컨테이너-->
	<div class="h_memberSearch_header">회원 검색</div>
	<div class="h_mainContainer">
	<form method="get" action="memberSearch">
	<table class="h_formtable">
	<!-- 검색어 -->
	<tr>
		<td>
		<label for="userid">검색어</label>
		</td>
		<td>
		<select name="searchCate" id="searchCate" class="h_searchSelect">
			<option value="userid">아이디</option>
			<option value="username">성명</option>
			<option value="email">이메일</option>
		</select>
		<input type="text" name="searchWord" id="memSearchWord" size="20px" class="h_ipt">
		</td>
	<!-- 이메일수신여부 -->
		<tr>
		<td>
		<label for="emailok">이메일 수신 여부</label>
		</td>
	 	<td>
	 	<input type="radio" name="emailok" class="h_radiochk" value="All" checked>전체
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
		<select name="smsok" id="smsok" class="h_searchSelect">
			<option value=""></option>
			<option value="Y">예</option>
			<option value="N">아니오</option>
		</select>
		</td>
	</tr>
	</table>
	<div class="h_searchBtnBox"><input type="submit" id="memSearchBtn" value="검색" class="adminMainBtn"></div>	
	</form>
	<hr/>
	<!-- 폼 가운데 버튼 -->
		<div class= "h_searchMultiBtn">
			<input type="button" id="" value="문자발송" class="adminSubBtn">
			<input type="button" id="" value="엑셀다운" class="adminSubBtn">
			<input type="button" id="" value="버튼2" class="adminSubBtn">
		</div>
	<!-- 회원목록 -->
	
	<form method="get" action="memberSearch">
		<ul class="clearfix">
			<li class="h_listHeader">선택</li>
			<li class="h_listHeader">아이디</li>
			<li class="h_listHeader">성명</li>
			<li class="h_listHeader">이메일</li>
			<li class="h_listHeader">연락처</li>
			<li class="h_listHeader">가입일</li>
			<li class="h_listHeader">최근접속일</li>
			<li class="h_listHeader">관리</li>
		<c:forEach var="vo" items="${list}" varStatus="status">
			<li><input type="checkbox" name="memberChk" value="vo번호"/></li>
			<li>
			<c:if test = "${vo.memstat == 1}">
				<input type="button" class="h_memdormant" value="휴면"/>
			</c:if>
			${vo.userid}
			</li>
			<li>${vo.username}</li>
			<li class="wordcut">${vo.email}</li>
			<li>${vo.tel}</li>
			<li>${vo.regdate}</li>
			<li>${vo.lastdate},${vo.smsok }+${vo.emailok }</li>
			<li><input type="button" name="memberDelBtn" value="삭제" class="h_memberDel"/>

			<c:if test = "${vo.memstat == 0}">
				<input type="button" name="memberSleepBtn" class="h_memDormant" value="휴면전환" onclick="memDormant(clickid${status.index})"/>
				<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.userid}"/>
			</c:if>
			</li>
		</c:forEach>
		</ul>
	</form>
	</div>
</div>
</body>
<script>
	function memDormant(clickid) {
		//var clickid = document.getElementById('h_userid').value;
		
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid.value;
		}
	};
	
	/* $('.h_memDormant0').on('click', function (){
		var clickid = $('#h_userid0').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant1').on('click', function (){
		var clickid = $('#h_userid1').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant2').on('click', function (){
		var clickid = $('#h_userid2').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant3').on('click', function (){
		var clickid = $('#h_userid3').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant4').on('click', function (){
		var clickid = $('#h_userid4').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant5').on('click', function (){
		var clickid = $('#h_userid5').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant6').on('click', function (){
		var clickid = $('#h_userid6').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant7').on('click', function (){
		var clickid = $('#h_userid7').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant8').on('click', function (){
		var clickid = $('#h_userid8').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant9').on('click', function (){
		var clickid = $('#h_userid9').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	});
	
	$('.h_memDormant10').on('click', function (){
		var clickid = $('#h_userid10').val();
		if(confirm("휴면 처리 하시겠습니까?")) {
			location.href="memDormant?userid="+clickid;
		}
		
	}); */
	function memDel() {
		if(confirm("삭제 처리 하시겠습니까?")) {
			location.href="memDel?userid=${vo.userid}";
		}
	}

</script>
</html>




	



