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
		<div class = "search_area">
		<!-- 검색옵션 태그 부분 -->
		<select name="type" id="h_type" class="h_searchSelect">
			<option value="" selected>   </option>
			<option value="userid">아이디</option>
			<option value="username">성명</option>
			<option value="email">이메일</option>
	<%--	<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>   </option>
			<option value="userid" <c:out value="${pageMaker.cri.type eq 'userid'?'selected':'' }"/>>아이디</option>
			<option value="username" <c:out value="${pageMaker.cri.type eq 'username'?'selected':'' }"/>>성명</option>
			<option value="email" <c:out value="${pageMaker.cri.type eq 'email'?'selected':'' }"/>>이메일</option> --%>
		</select>
			<input type="text" name="searchWord" id="memSearchWord" size="20px" class="h_ipt" value="${pageMaker.cri.searchWord}"/>
		</div>
		</td>
		
	<!-- 이메일수신여부 -->
		<tr>
		<td>
		<label for="emailok">이메일 수신 여부</label>
		</td>
	 	<td>
	 	<div class = "search_area_email">
	 	<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y+N" <c:out value="${pageMaker.cri.emailok eq 'Y' && 'N' ?'checked':'' }"/>>전체 --%>
		<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y" <c:if test="${pageMaker.cri.emailok eq 'Y'}"> checked </c:if> />예 --%>
		<input type="radio" name="emailok" class="h_radiochk" value="" checked/>전체
		<input type="radio" name="emailok" class="h_radiochk" value="Y"/>예
		<input type="radio" name="emailok" class="h_radiochk" value="N"/> 아니오
		</div>
		</td>
		</tr>
		
	<!-- 문자수신여부 -->
		<tr>
		<td>
		<label for="userid">문자수신여부</label>
		</td>
		<td class="h_last_td">
		<select name="smsok" id="h_smsok" class="h_searchSelect">
			<option value=""></option>
			<option value="Y">예</option>
			<option value="N">아니오</option>
		</select>
		</td>
	</tr>
	</table>
	<div class="h_searchBtnBox"><input type="button" id="memSearchBtn" value="검색" class="adminMainBtn search"></div>	
	</form>
	
	<!-- member tbl 데이터 영역 -->
	<hr/>
	<!-- 폼 가운데 버튼 -->
		<div class= "h_searchMultiBtn">
			<input type="button" id="" value="문자발송" class="adminSubBtn">
			<input type="button" id="testBtn" value="test버튼" class="adminSubBtn">
			<input type="button" id="delMulti" value="선택삭제" class="adminSubBtn">
		</div>
	<!-- 회원목록 -->
	<div class="h_memTableLi"><!--  -->
	<form method="get" id="delMultiForm" action="memMultiDel">
		<ul class="h_memList clearfix">
			<li class="h_listHeader">선택</li>
			<li class="h_listHeader">아이디</li>
			<li class="h_listHeader">성명</li>
			<li class="h_listHeader">이메일</li>
			<li class="h_listHeader">연락처</li>
			<li class="h_listHeader">가입일</li>
			<li class="h_listHeader">마지막접속일</li>
			<li class="h_listHeader">관리</li>
		<c:forEach var="vo" items="${list}" varStatus="status">
			<c:if test = "${vo.memstat != 2}">
				<li><input type="checkbox" name="memberChk" class="memberChk" value="${vo.userid}"/></li>
				<li>
				<c:if test = "${vo.memstat == 1}">
					<input type="button" class="h_memdormant" value="휴면"/>
				</c:if>
				${vo.userid}
				</li>
				<li>${vo.username}</li>
				<li class="wordcut">${vo.email}</li>
				<li>${vo.tel}</li>
				<li>${vo.regdate} / ${vo.emailok} / ${vo.smsok}</li>
				<li>${vo.lastdate}</li>
				<li>
					<input type="button" name="memberDelBtn" value="탈퇴" class="h_memberDel" onclick="memDel(clickid${status.index})"/>
				<c:if test = "${vo.memstat == 0}">
					<input type="button" name="memberSleepBtn" class="h_memDormant" value="휴면전환" onclick="memDormant(clickid${status.index})"/>
				</c:if>
					<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.userid}"/>
				</li>
			</c:if>
		</c:forEach>
		</ul>
	</form>
	
		<div class="h_paging_wrap clearfix">
			<!-- 페이징 이동 버튼 폼  moveForm  -->
		<form id = "pageBtn_form" action="memberSearch" method="get">
			<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}"/>
			<input type="hidden" name="amount" value = "${pageMaker.cri.amount}"/>
			<input type="hidden" name="searchWord" value = "${pageMaker.cri.searchWord}"/>
			<input type="hidden" name="type" value = "${pageMaker.cri.type}"/>
			<input type="hidden" name="emailok" value = "${pageMaker.cri.emailok}"/>
			<input type="hidden" name="smsok" value = "${pageMaker.cri.smsok}"/>
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

</body>
<script>
	
	$(()=>{
		$('#delMulti').click(()=> {
			var confirm_val = confirm("선택한 회원을 삭제하시겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $(".memberChk:checked").each(function(){
			    checkArr.push($(this).val());
			   });
			    
			   console.log(checkArr);
			   
			   $.ajax({
				    url : 'memMultiDel',
				    type : 'get',
				    dataType: 'json',
				    data : { memberChk : checkArr },
				    success : function(result){
					   if(result == 1){
					     location.href = 'memberSearch';
					   } else {
					   	alert("회원삭제가 실패하였습니다");
					   }
					}, error:function() {
						alert("삭제할 회원을 먼저 선택해주세요");
					}
			    
				});
			} 
		});
	});
	
		function memDormant(clickid) {
			//var clickid = document.getElementById('h_userid').value;
			if(confirm("휴면 처리 하시겠습니까?")) {
				location.href="memDormant?userid="+clickid.value;
			}
		};
		
		function memDel(clickid) {
			console.log(clickid.value)
			if(confirm("탈퇴 처리 하시겠습니까?")) {
				location.href="memDel?userid="+clickid.value;
			}
		};
		
		
		/* 페이지 버튼*/
		
		$('.paging a').on("click", function(e){
			e. preventDefault();
			var pageBtn = $('#pageBtn_form');
			pageBtn.find('input[name="pageNum"]').val($(this).attr('href'));
			pageBtn.submit();
		});
		
		$('#testBtn').on('click', function(e){
			/* 인풋이 왜 Y만찍히냐 */
			let emailok = $('.search_area_email input[name="emailok"]:checked').val();
	        console.log(emailok);
		});
		
		
		/* 검색버튼 */
		$('.adminMainBtn.search').on('click', function(e){
			
			e.preventDefault();
			
			var pageBtn = $('#pageBtn_form');
			
			let emailok = $('.search_area_email input[name="emailok"]:checked').val();
			let smsok = $('#h_smsok option:selected').val();
			let type = $('#h_type option:selected').val();
			/* let type = $('.search_area select').val(); */
			let searchWord = $('.search_area input[name="searchWord"]').val();
			
			if(!type){
	            alert("검색 종류를 선택하세요.");
	            return false;
	        }
	        
	        if(!searchWord){
	            alert("검색어를 입력하세요.");
	            return false;
	        }   
	        
	        /* 페이징이동시 검색어 옵션추가 부분 */
			pageBtn.find('input[name="type"]').val(type);
			pageBtn.find('input[name="searchWord"]').val(searchWord);
			pageBtn.find('input[name="emailok"]').val(emailok);
			pageBtn.find('input[name="smsok"]').val(smsok);
			pageBtn.find('input[name="pageNum"]').val(1);
			pageBtn.submit();
			
		});
		
</script>
</html>