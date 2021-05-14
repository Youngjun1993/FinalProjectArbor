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
	<div class="h_memberSearch_header">탈퇴회원 관리</div>
	<div class="h_mainContainer">
	<!--////////////// 탈퇴 tbl 데이터 영역 끝 //////////////-->
		<form method="get" action="memberAdminQuit">
	<table class="h_formtable">
	<!-- 검색어 -->
	<tr>
		<td>
		<label for="userid">아이디 검색</label>
		</td>
		<td>
		<div class = "search_area">
		<!-- select 박스 name값 type 삭제 -->
			<input type="text" name="searchWord" id="userid" size="20px" class="h_ipt" required/>
		</div>
		</td>
		
	<!-- 탈퇴처리유형 -->
		<tr>
		<td>
		<label for="byetype">탈퇴처리유형</label>
		</td>
	 	<td>
	 	<div class = "search_area_quittype">
	 	<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y+N" <c:out value="${pageMaker.cri.emailok eq 'Y' && 'N' ?'checked':'' }"/>>전체 --%>
		<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y" <c:if test="${pageMaker.cri.emailok eq 'Y'}"> checked </c:if> />예 --%>
		<input type="radio" name="byetype" class="h_radiochk" value="" checked/>전체
		<input type="radio" name="byetype" class="h_radiochk" value="사용자"/>사용자
		<input type="radio" name="byetype" class="h_radiochk" value="관리자"/>관리자
		</div>
		</td>
		</tr>
	
	<!-- 탈퇴일 -->
		<tr>
		<td>
		<label for="byedate">탈퇴일 검색</label>
		</td>
	 	<td>
	 	<div class = "search_area_quitday">
	 	<input type="text" name="byedate1" id="" size="20px" class="h_ipt" value=""/>&nbsp;~&nbsp;
	 	<input type="text" name="byedate2" id="" size="20px" class="h_ipt" value=""/>
		</div>
		</td>
		</tr>
		
	<!-- 탈퇴기간 -->
		<tr>
		<td>
		<label for="quitperiod">탈퇴 기간</label>
		</td>
		<td class="h_last_td">
		<div class = "search_area_period">
		<input type="number" name="quitperiod" id="" size="20px" class="h_ipt" required/>&nbsp;일 이상
		</div>
		</td>
		</tr>
	
	</table>
	<div class="h_searchBtnBox"><input type="button" id="" value="검색" class="adminMainBtn search"></div>	
	</form>
	
	<!--////////////// 탈퇴검색 영역 끝 //////////////-->
		<!-- 휴면 tbl 데이터 영역 -->
	<hr/>
	<!-- 폼 가운데 버튼 -->
		<div class= "h_searchMultiBtn">
			<input type="button" id="" value="test1" class="adminSubBtn">
			<input type="button" id="testBtn" value="test버튼" class="adminSubBtn">
			<input type="button" id="delMulti" value="선택삭제" class="adminSubBtn">
		</div>
	<!-- 회원목록 -->
		<div class="h_memTableLi">
		<form method="get" id="delMultiForm" action="memMultiDel">
			<ul class="h_memList clearfix">
				<li class="h_listHeader">선택</li>
				<li class="h_listHeader">아이디</li>
				<li class="h_listHeader">탈퇴유형</li>
				<li class="h_listHeader">탈퇴사유</li>
				<li class="h_listHeader">탈퇴일</li>
				<li class="h_listHeader">탈퇴기간</li>
				<li class="h_listHeader">가입일</li>
				<li class="h_listHeader">관리</li>
				<c:forEach var="vo" items="${list}" varStatus="status">
						<li><input type="checkbox" name="memberChk" class="memberChk" value="${vo.userid}"/></li>
						<li>
						${vo.userid}
						</li>
						<li>${vo.byetype}</li>
						<li class="wordcut">${vo.byereason}</li>
						<li>${vo.byedate}</li>
						<li>${vo.quitperiod}&nbsp;일 째</li>
						<li>${vo.regdate}</li>
						<li>
							<input type="button" name="memberDelBtn" value="삭제" class="adminSubBtn" onclick="delforever(clickid${status.index})"/>
							<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.userid}"/>
						</li>
				</c:forEach>
			</ul>
		</form>
			<!-- 페이징영역 -->
			<div class="h_paging_wrap clearfix">
				<!-- 페이징 이동 버튼 폼  moveForm  -->
			<form id = "pageBtn_form" action=memberAdminQuit method="get">
				<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}"/>
				<input type="hidden" name="amount" value = "${pageMaker.cri.amount}"/>
				<input type="hidden" name="searchWord" value = "${pageMaker.cri.searchWord}"/>
				<input type="hidden" name="byetype" value = "${pageMaker.cri.byetype}"/>
				<input type="hidden" name="byedate" value = "${pageMaker.cri.byedate}"/>
				<input type="hidden" name="quitperiod" value = "${pageMaker.cri.quitperiod}"/>
				<!-- 이메일 sms 추가 -->
			</form>
				<ul class="paging">
				<c:if test = "${pageMaker.prev }">
					<li><a class="pagingLR_a" href="${pageMaker.startPage - 1 }">＜</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class="pageBtn ${pageMaker.cri.pageNum == num ? "active" : ""}" ><a href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test = "${pageMaker.next }">
					<li><a class="pagingLR_a " href="${pageMaker.endPage + 1 }">＞</a></li>
				</c:if>
				</ul>
			</div>
		</div>
	
	</div>
</div>

<script>

///페이징 영역
	$('.paging a').on("click", function(e){
		e. preventDefault();
		var pageBtn = $('#pageBtn_form');
		pageBtn.find('input[name="pageNum"]').val($(this).attr('href'));
		pageBtn.submit();
	});

	//페이징 값 넘기기
	$('.adminMainBtn.search').on('click', function(e){
		
		e.preventDefault();
		var pageBtn = $('#pageBtn_form');
		/* let type = $('.search_area select').val(); */
		
		let byedate = $('.search_area_quitday input[name="byedate"]').val();
		let byetype = $('.search_area_quittype input[name="byetype"]:checked').val();
		let quitperiod = $('.search_area_period input[name="quitperiod"]').val();
		let searchWord = $('.search_area input[name="searchWord"]').val();
		
        if(!searchWord){
            alert("아이디를 입력하세요.");
            return false;
        }
        
        if(!quitperiod){
            alert("탈퇴기간에 숫자를 입력하세요.");
            return false;
        }
        
        /* 페이징이동시 검색어 옵션추가 부분 */
		pageBtn.find('input[name="searchWord"]').val(searchWord);
		pageBtn.find('input[name="quitperiod"]').val(quitperiod);
		/* pageBtn.find('input[name="byedate"]').val(byedate); */
		pageBtn.find('input[name="byetype"]').val(byetype);
		pageBtn.find('input[name="pageNum"]').val(1);
		pageBtn.submit();
		
	});

</script>
</body>
</html>