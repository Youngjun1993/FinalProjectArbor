<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/arbor.css" type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/memberAdminMenu.css"
	type="text/css" />
<script
	src="<%=request.getContextPath()%>/javaScript/admin/adminMenu.js"></script>
</head>
<body>
	<div class="w1400_container clearfix font_ng">

		<!-- 관리자메뉴 -->
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<!-- 회원검색 컨테이너-->
		<div class="h_memberSearch_header">휴면회원 검색</div>
		<div class="h_mainContainer">
			<form method="get" action="memberAdminDormant" id="p_productSearchFrm">
				<table class="h_formtable">
					<!-- 검색어 -->
					<tr>
						<td><label for="userid">휴면회원 관리</label></td>
						<td>
							<div class="search_area">
								<!-- 검색옵션 태그 부분 -->
								<select name="searchKey" id="h_type" class="h_searchSelect">
									<c:choose>
										<c:when test="${pageVO.searchKey == 'userid' }">
											<option value="userid" selected>아이디</option>
											<option value="username">성명</option>
											<option value="email">이메일</option>
										</c:when>
										<c:when test="${pageVO.searchKey == 'username' }">
											<option value="userid">아이디</option>
											<option value="username" selected>성명</option>
											<option value="email">이메일</option>
										</c:when>
										<c:when test="${pageVO.searchKey == 'email' }">
											<option value="userid">아이디</option>
											<option value="username">성명</option>
											<option value="email" selected>이메일</option>
										</c:when>
										<c:otherwise>
											<option value="" selected hidden></option>
											<option value="userid">아이디</option>
											<option value="username">성명</option>
											<option value="email">이메일</option>
										</c:otherwise>
									</c:choose>
									<%--	<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>   </option>
			<option value="userid" <c:out value="${pageMaker.cri.type eq 'userid'?'selected':'' }"/>>아이디</option>
			<option value="username" <c:out value="${pageMaker.cri.type eq 'username'?'selected':'' }"/>>성명</option>
			<option value="email" <c:out value="${pageMaker.cri.type eq 'email'?'selected':'' }"/>>이메일</option> --%>
								</select> <input type="text" name="searchWord" id="memSearchWord"
									size="20px" class="h_ipt" value="" />
							</div>
						</td>

						<!-- 이메일수신여부 -->
					<tr>
						<td><label for="emailok">이메일 수신동의 여부</label></td>
						<td>
							<div class="search_area_email">
								<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y+N" <c:out value="${pageMaker.cri.emailok eq 'Y' && 'N' ?'checked':'' }"/>>전체 --%>
								<%-- <input type="radio" name="emailok" class="h_radiochk" value="Y" <c:if test="${pageMaker.cri.emailok eq 'Y'}"> checked </c:if> />예 --%>
								<c:choose>
									<c:when test="${pageVO.emailok=='Y' }">
										<input type="radio" name="emailok" class="h_radiochk" value="" />전체
										<input type="radio" name="emailok" class="h_radiochk" value="Y" checked/>예
										<input type="radio" name="emailok" class="h_radiochk" value="N" /> 아니오
									</c:when>
									<c:when test="${pageVO.emailok=='N' }">
										<input type="radio" name="emailok" class="h_radiochk" value=""/>전체
										<input type="radio" name="emailok" class="h_radiochk" value="Y" />예
										<input type="radio" name="emailok" class="h_radiochk" value="N" checked/> 아니오
									</c:when>
									<c:otherwise>
										<input type="radio" name="emailok" class="h_radiochk" value="" checked/>전체
										<input type="radio" name="emailok" class="h_radiochk" value="Y" />예
										<input type="radio" name="emailok" class="h_radiochk" value="N" /> 아니오
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>

					<!-- 문자수신여부 -->
					<tr>
						<td><label for="userid">문자 수신동의 여부</label></td>
						<td class="h_last_td">
						<select name="smsok" id="h_smsok" class="h_searchSelect">
							<c:choose>
								<c:when test="${pageVO.smsok=='Y' }">
									<option value="Y" selected>예</option>
									<option value="N">아니오</option>
								</c:when>
								<c:when test="${pageVO.smsok=='N' }">
									<option value="Y">예</option>
									<option value="N" selected>아니오</option>
								</c:when>
								<c:otherwise>
									<option value="" selected></option>
									<option value="Y">예</option>
									<option value="N">아니오</option>
								</c:otherwise>
							</c:choose>
						</select></td>
					</tr>

					<!-- 휴면메일수신여부 -->
					<tr>
						<td><label for="emailok">휴면메일 발송 여부</label></td>
						<td>
							<div class="search_area_dormail">
								<c:choose>
									<c:when test="${pageVO.dormailok=='Y' }">
										<input type="radio" name="dormailok" class="h_radiochk" value=""/>전체
										<input type="radio" name="dormailok" class="h_radiochk" value="Y" checked/>예
										<input type="radio" name="dormailok" class="h_radiochk" value="N" /> 아니오
									</c:when>
									<c:when test="${pageVO.dormailok=='N' }">
										<input type="radio" name="dormailok" class="h_radiochk" value=""/>전체
										<input type="radio" name="dormailok" class="h_radiochk" value="Y" />예
										<input type="radio" name="dormailok" class="h_radiochk" value="N" checked/> 아니오
									</c:when>
									<c:otherwise>
										<input type="radio" name="dormailok" class="h_radiochk" value=""  checked />전체
										<input type="radio" name="dormailok" class="h_radiochk" value="Y" />예
										<input type="radio" name="dormailok" class="h_radiochk" value="N" /> 아니오
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
				</table>
				<div class="h_searchBtnBox">
					<input type="submit" id="memSearchBtn" value="검색" class="adminMainBtn">
				</div>
			</form>

			<!-- 휴면 tbl 데이터 영역 -->
			<!-- 폼 가운데 버튼 -->
			<div class="h_searchMultiBtn">
				<form name="sms" id="h_sms_form" action="sendSms"></form>
				<input type="button" id="sendSms" value="SMS발송 "
					class="adminSubBtn semiBtn"> <input type="button"
					id="excelBtn" value="엑셀(전체)다운" class="adminSubBtn semiBtn">
				<input type="button" id="delMulti" value="선택삭제" class="adminSubBtn semiBtn">
			</div>
			<br />
			<!-- 회원목록 -->
			<div class="h_memTableLi dormant">
				<form method="get" id="delMultiForm" action="memMultiDel">
					<ul class="h_dormantList clearfix">
						<li class="h_listHeader">선택</li>
						<li class="h_listHeader">아이디</li>
						<li class="h_listHeader">성명</li>
						<li class="h_listHeader wordcut">이메일</li>
						<li class="h_listHeader">연락처</li>
						<li class="h_listHeader">가입일</li>
						<li class="h_listHeader">휴면전환일</li>
						<li class="h_listHeader">Email수신</li>
						<li class="h_listHeader">SMS수신</li>
						<li class="h_listHeader">관리</li>
						<c:forEach var="vo" items="${list}" varStatus="status">
							<li><input type="checkbox" name="memberChk"
								class="memberChk" value1="${vo.userid}" value2="${vo.tel}" /></li>
							<li>
								<%--	<input type="button" class="h_memdormant" value="휴면"/> --%>
								${vo.userid}
							</li>
							<li>${vo.username}</li>
							<li class="wordcut">${vo.email}</li>
							<li>${vo.tel}</li>
							<li>${vo.regdate}</li>
							<li>${vo.dordate}</li>
							<li>${vo.emailok}</li>
							<li>${vo.smsok}</li>
							<li><c:choose>
									<c:when test="${vo.emailok == 'N'}">
										<input type="button" name="memberDelBtn" value="메일수신거부"
											style="pointer-events: none;" class="adminMainBtn" />
									</c:when>
									<c:when test="${vo.dormailok == 'N'}">
										<input type="button" name="memberDelBtn" value="휴면메일발송"
											class="adminSubBtn"
											onclick="sendmail(clickid${status.index}, clickuserid${status.index})" />
									</c:when>
									<c:when test="${vo.dormailok == 'Y'}">
										<input type="button" name="memberDelBtn" value="발송완료"
											style="pointer-events: none;" class="adminMainBtn" />
									</c:when>
								</c:choose> <input type="hidden" id="h_userid"
								name="clickid${status.index}" value="${vo.email}" /> <input
								type="hidden" id="h_userid" name="clickuserid${status.index}"
								value="${vo.userid}" /> <%-- if 휴면메일발송여부 == N value값 미발송 아니면 발송완료 -->
						<!-- <input type="button" name="memberDelBtn" value="휴면메일발송" class="h_memberDel" onclick="memDel(clickid${status.index})"/>
						<c:if test = "${vo.memstat == 0}">
							<input type="button" name="memberSleepBtn" class="h_memDormant" value="휴면전환" onclick="memDormant(clickid${status.index})"/>
						</c:if>
							<input type="hidden" id="h_userid" name="clickid${status.index}" value="${vo.userid}"/>  --%>
							</li>
						</c:forEach>
					</ul>
				</form>
				<div id="pagingDiv">
					<ul class="adPaging" class="clearfix">
		            	<c:if test="${pageVO.pageNum>1 }">
		                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum-1})">＜</a></li>
		                </c:if>
		                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
		                	<c:if test="${p<=pageVO.totalPage }">
			                	<c:if test="${p==pageVO.pageNum }">
			                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="javascript:p_pageChange(${p})">${p }</a></li>
			                	</c:if>
			                	<c:if test="${p!=pageVO.pageNum }">
			                		<li><a href="javascript:p_pageChange(${p})">${p }</a></li>
			                	</c:if>
		                	</c:if>
		                </c:forEach>
		                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
		                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum+1})">＞</a></li>
		                </c:if>
		            </ul>
				</div>

				<%-- <!-- 페이징영역 -->
			<div class="h_paging_wrap clearfix">
				<!-- 페이징 이동 버튼 폼  moveForm  -->
			<form id = "pageBtn_form" action="memberAdminDormant" method="get">
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
			</div> --%>
			</div>
		</div>
	</div>
	<script>
	
		/////////////// 선택 SMS전송기능
		$('#sendSms').on("click", function(){
			////체크박스 전체 전송
			var checkArr = new Array();
			
			$(".memberChk:checked").each(function(idx, item){
			    checkArr.push($(this).attr("value2"));
			   });
			
			if(checkArr.length == 0) {
				alert("문자 보낼 회원을 선택해주세요")
				return false;
			}
			
			console.log(checkArr.length);
			
			$('#h_sms_form *').remove();
				
			// smsform에 배열길이만큼 append
			for(var i = 0; i < checkArr.length; i++){
				$('#h_sms_form').append("<input type = 'hidden' name = 'smstel' value='" + checkArr[i] + "'>");
			};
			
			window.open('','smsSender','width=560,height=500');
		    var frm =document.sms;
		    frm.action = 'sendSms';
		    frm.target ="smsSender";
		    frm.method ="post";
		    frm.submit();
			
			//////////////////////// 한개 클릭 코드
			/* var chktel = $(".memberChk:checked").attr("value2");
			
			var checkArr = new Array();
			
			$(".memberChk:checked").each(function(idx, item){
			    checkArr.push($(this).attr("value2"));
			   });
			
			if(checkArr.length > 1){
				alert("문자전송은 1회 1건만 가능합니다. \n체크는 한번만 해주세요");
				return false;
			}else if(checkArr.length == 0){
				alert("문자를 보낼 회원을 체크해주세요");
			}else {
				location.href="sendSms?tel=" + chktel;
			} */
			
			 /* $.ajax({
				    url : 'sendSms',
				    type : 'get',
				    dataType: 'json',
				    data : { memberChk : checkArr },
				    success : function(){
					   	console.log(memberChk);
					   	location.href="sendSms"
					}, error:function() {
						alert("문자전송할 회원을 먼저 선택해주세요");
					}
			}); */
			 
		});
	
		//전체 엑셀다운로드
		$('#excelBtn').on('click', function(){
			if(confirm("전체 회원 엑셀파일을 다운로드 하시겠습니까?")) {
				location.href = "excelDownload?member=N&dormant=Y";
			}
		});
		
	
	$(()=>{
		
		$('#delMulti').click(()=> {
			
			var checkArr = new Array();
		   
			$(".memberChk:checked").each(function(idx, item){
				checkArr.push($(this).attr("value1"));
			});
			
			    if(checkArr == 0) {
			    	alert("삭제할 회원을 선택해주세요");
			    	return false;
			    }else {
			    	if(confirm("선택한 회원을 휴면테이블에서 삭제 하시겠습니까?")) {
					  	 	console.log(checkArr);
					   $.ajax({
						    url : 'dormantMultiDel',
						    type : 'post',
						    dataType: 'json',
						    data : { memberChk : checkArr },
						    success : function(result){
							   if(result>0) {
								   alert("삭제가 완료되었습니다.")
								   $("#p_productSearchFrm").submit();
							   }
							}, error:function() {
								alert("회원탈퇴 실패");
								return false;
							}
					    
						});
					} 
			    }
		});
	});
	
	//////////////////// 휴면메일 보내기 기능
	function sendmail(clickid, clickuserid, pagenum, amount) {
		//var clickid = document.getElementById('h_userid').value;
		var emailcode = ""; 
		if(confirm("메일을 보내시겠습니까?")) {
		
			var email = clickid.value;//전달받은 이메일
			var userid = clickuserid.value;//자바로 보낼 아이디
			
			/*
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
			console.log(amount); */
			
			$.ajax({
		        	
		        type:"POST",
		        url:"sendDormantMail?email=" + email +"&userid=" + userid,
		        success:function(data){
		        	 //console.log("data : " + data);/* 반환데이터 확인 : data는 컨트롤러 이메일 인증 메소드에서 생성해 리턴한 난수(String타입) */
		        	alert("메일 발송을 완료하였습니다");
		        	/* location.href="memberAdminDormant?pageNum="+pagenum+"&amount="+amount+"&searchWord="+searchWord+"&type="+type+"&emailok="+emailok+"&smsok="+smsok+"&dormailok="+dormailok; */
		        	location.href="memberAdminDormant";
		        	
		        }
		    });
		}
	};
	
	//
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