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
	<div class="h_memberSearch_header">휴면회원 검색</div>
	<div class="h_mainContainer">
		<form method="get" action="memberAdminDormant">
	<table class="h_formtable">
	<!-- 검색어 -->
	<tr>
		<td>
		<label for="userid">휴면회원 관리</label>
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
			<input type="text" name="searchWord" id="memSearchWord" size="20px" class="h_ipt" value=""/>
		</div>
		</td>
		
	<!-- 이메일수신여부 -->
		<tr>
		<td>
		<label for="emailok">이메일 수신동의 여부</label>
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
		<label for="userid">문자 수신동의 여부</label>
		</td>
		<td class="h_last_td">
		<select name="smsok" id="h_smsok" class="h_searchSelect">
			<option value=""></option>
			<option value="Y">예</option>
			<option value="N">아니오</option>
		</select>
		</td>
		</tr>
		
	<!-- 휴면메일수신여부 -->
		<tr>
		<td>
		<label for="emailok">휴면메일 발송 여부</label>
		</td>
	 	<td>
	 	<div class = "search_area_dormail">
	 	<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y+N" <c:out value="${pageMaker.cri.emailok eq 'Y' && 'N' ?'checked':'' }"/>>전체 --%>
		<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y" <c:if test="${pageMaker.cri.emailok eq 'Y'}"> checked </c:if> />예 --%>
		<input type="radio" name="dormailok" class="h_radiochk" value="" checked/>전체
		<input type="radio" name="dormailok" class="h_radiochk" value="Y"/>예
		<input type="radio" name="dormailok" class="h_radiochk" value="N"/> 아니오
		</div>
		</td>
		</tr>
	</table>
	<div class="h_searchBtnBox"><input type="button" id="memSearchBtn" value="검색" class="adminMainBtn search"></div>	
	</form>
	
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
				<li class="h_listHeader">성명</li>
				<li class="h_listHeader">이메일</li>
				<li class="h_listHeader">연락처</li>
				<li class="h_listHeader">가입일</li>
				<li class="h_listHeader">휴면전환일</li>
				<li class="h_listHeader">관리</li>
				<c:forEach var="vo" items="${list}" varStatus="status">
				<c:if test = "${vo.dortype ne '탈퇴'}">
						<li><input type="checkbox" name="memberChk" class="memberChk" value="${vo.userid}"/></li>
						<li>
						<%--	<input type="button" class="h_memdormant" value="휴면"/> --%>
						${vo.userid}
						</li>
						<li>${vo.username}</li>
						<li class="wordcut">${vo.email}</li>
						<li>${vo.tel}</li>
						<li>${vo.regdate}</li>
						<li>${vo.dordate} ${vo.emailok}/${vo.smsok }/${vo.dormailok }</li>
						<li>
						<c:choose>
						<c:when test = "${vo.emailok == 'N'}">
						<input type="button" name="memberDelBtn" value="메일수신거부" style="pointer-events: none;" class="adminMainBtn"/>
						</c:when>
						<c:when test = "${vo.dormailok == 'N'}">
						<input type="button" name="memberDelBtn" value="휴면메일발송" class="adminSubBtn" onclick="sendmail(clickid${status.index}, clickuserid${status.index})"/>
						</c:when>
						<c:when test = "${vo.dormailok == 'Y'}">
						<input type="button" name="memberDelBtn" value="발송완료" style="pointer-events: none;" class="adminMainBtn"/>
						</c:when>
						</c:choose>
						
						<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.email}"/>
						<input type="hidden" id="h_userid" name="clickuserid${status.index}" value="${vo.userid}"/>
						<%-- if 휴면메일발송여부 == N value값 미발송 아니면 발송완료 -->
						<!-- <input type="button" name="memberDelBtn" value="휴면메일발송" class="h_memberDel" onclick="memDel(clickid${status.index})"/>
						<c:if test = "${vo.memstat == 0}">
							<input type="button" name="memberSleepBtn" class="h_memDormant" value="휴면전환" onclick="memDormant(clickid${status.index})"/>
						</c:if>
							<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.userid}"/>  --%>	
						</li>
				</c:if>
				</c:forEach>
			</ul>
		</form>
			<!-- 페이징영역 -->
			<div class="h_paging_wrap clearfix">
				<!-- 페이징 이동 버튼 폼  moveForm  -->
			<form id = "pageBtn_form" action=memberAdminDormant method="get">
				<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}"/>
				<input type="hidden" name="amount" value = "${pageMaker.cri.amount}"/>
				<input type="hidden" name="searchWord" value = "${pageMaker.cri.searchWord}"/>
				<input type="hidden" name="type" value = "${pageMaker.cri.type}"/>
				<input type="hidden" name="emailok" value = "${pageMaker.cri.emailok}"/>
				<input type="hidden" name="smsok" value = "${pageMaker.cri.smsok}"/>
				<input type="hidden" name="dormailok" value = "${pageMaker.cri.dormailok}"/>
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
	
	//////////////////// 선택 전체삭제기능
	$(()=>{
		$('#delMulti').click(()=> {
			var confirm_val = confirm("선택한 회원을 탈퇴처리 하시겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $(".memberChk:checked").each(function(){
			    checkArr.push($(this).val());
			   });
			    
			   console.log(checkArr);
			   
			   $.ajax({
				    url : 'dormantMultiDel',
				    type : 'get',
				    dataType: 'json',
				    data : { memberChk : checkArr },
				    success : function(result){
					   if(result == 1){
					     location.href = 'memberAdminDormant';
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
	
	//////////////////// 휴면메일 보내기 기능
	function sendmail(clickid, clickuserid, pagenum, amount) {
		//var clickid = document.getElementById('h_userid').value;
		var emailcode = ""; 
		if(confirm("메일보내시겠습니까 하시겠습니까?")) {
		
			var email = clickid.value;//전달받은 이메일
			var userid = clickuserid.value;//자바로 보낼 아이디
			
			var pageBtn = $('#pageBtn_form');
			var pagenum = pageBtn.find('input[name="pageNum"]').val();
			var amount = pageBtn.find('input[name="amount"]').val();
			var searchWord = pageBtn.find('input[name="searchWord"]').val();
			var type = pageBtn.find('input[name="type"]').val();
			var emailok = pageBtn.find('input[name="emailok"]').val();
			var smsok = pageBtn.find('input[name="smsok"]').val();
			var dormailok = pageBtn.find('input[name="dormailok"]').val();
			
			console.log(smsok);
			console.log(searchWord);
			console.log(pagenum);
			console.log(amount);
			
			$.ajax({
		        	
		        type:"POST",
		        url:"sendDormantMail?email=" + email +"&userid=" + userid,
		        success:function(data){
		        	 //console.log("data : " + data);/* 반환데이터 확인 : data는 컨트롤러 이메일 인증 메소드에서 생성해 리턴한 난수(String타입) */
		        	alert("메일 발송을 완료하였습니다");
		        	location.href="memberAdminDormant?pageNum="+pagenum+"&amount="+amount+"&searchWord="+searchWord+"&type="+type+"&emailok="+emailok+"&smsok="+smsok+"&dormailok="+dormailok;
		        	
		        }
		    });
		}
	};
	
	$('.paging a').on("click", function(e){
		e. preventDefault();
		var pageBtn = $('#pageBtn_form');
		pageBtn.find('input[name="pageNum"]').val($(this).attr('href'));
		pageBtn.submit();
	});
	
	////////////////////////////////////// 검색버튼 기능
	$('.adminMainBtn.search').on('click', function(e){
		
		e.preventDefault();
		var pageBtn = $('#pageBtn_form');
		
		let dormailok = $('.search_area_dormail input[name="dormailok"]:checked').val();
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
		pageBtn.find('input[name="dormailok"]').val(dormailok);
		pageBtn.find('input[name="pageNum"]').val(1);
		pageBtn.submit();
		
	});
</script>
</body>
</html>