<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/reviewAd.css" type="text/css"/>
</head>
<script>
	$(function(){
		var hrefSplit = window.location.href.split("?");
		var sortSplit = window.location.href.split("&");
		if(hrefSplit[1]=="sort=pname" || sortSplit[1]=="sort=pname"){
			$("#y_reviewAdSort option:eq(2)").prop("selected",true);
		}else if(hrefSplit[1]=="sort=grade" || sortSplit[1]=="sort=grade"){
			$("#y_reviewAdSort option:eq(1)").prop("selected",true);
		}else{
			$("#y_reviewAdSort option:eq(0)").prop("selected",true);
		}
		//페이징 li만큼 갯수 구하기
		var liCnt = $(".adPaging>li").length;
		$(".adPaging").css({
			"width" : liCnt*40+"px",
			"margin" : "30px auto"
		});	
		//전체선택
		$("#y_reviewAllSelect").click(function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked", true);
			}else{
				$("input[type=checkbox]").prop("checked", false);
			}
		});
		//선택삭제
		$("#y_revSelectDel").click(function(){
			if(confirm("선택하신 후기를 삭제하시겠습니까?")){
				$("#y_adminReviewList_rightcon>div:nth-of-type(2) ul:nth-of-type(2) li:nth-child(6n+1) input[name=y_reviewCheck]:checked").each(function(i, e) {
					var reviewno = $(this).next('input').val();
					location.href="reviewAdDel?reviewno="+reviewno
				});	
			}
		});
		//검색폼 제약조건
		$("#y_reviewSearchFrm").submit(function() {
			if($("#searchKey").val()=="" || $("#searchKey").val()==null){
				alert("카테고리를 선택하세요.");
				return false;
			}else if($("#searchWord").val()=="" || $("#searchWord").val()==null){
				alert("검색어를 선택하세요.");
				return false;
			}
			return true;
		});
		//작성일 선택시 datepicker 설정
		$("#searchKey").change(function() {
			console.log($(this).val())
			if($(this).val()=="reviewdate"){
				$("#searchWord").mousedown(function(){
					$(this).datepicker("option",'disabled',false);
					$(this).datepicker({
						changeMonth: true, 
					    changeYear: true,
					    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
					    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
					    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					    dateFormat: "y/mm/dd"
					});
				});
			}else{
				$("#searchWord").mousedown(function(){
					$(this).datepicker("option",'disabled',true);
					$(this).removeAttr("disabled");
				});
			}
		});
		//대분류 선택시 중분류 데이터
		$("#mainno").change(function(){
			var selectTag = $(this);
			var mainno = $(this).val();
			$.ajax({
				url : "reviewSelectCate",
				type: "GET",
				data:{
					mainno : mainno
				}, success : function(result){
					var $result = $(result);
					var tag=""
					$result.each(function(idx, vo) {
						tag += "<option value="+vo.subno+">"+vo.subname+"</option>";
					});
					$(selectTag).next('select').html(tag);
				}, error: function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		// 정렬 셀렉트
		$("#y_reviewAdSort").change(function() {
			var sortVal = $(this).val();
			var searchKey = "${pageVO.searchKey}";
			var searchWord = "${pageVO.searchWord}";
			var mainno = "${pageVO.mainno}";
			var subno = "${pageVO.subno}";
			if(searchWord != null && searchWord != ""){
				if(subno != null && subno != ""){
					if(sortVal == "dateSort"){
						location.href="reviewAdList?mainno="+mainno+"&subno="+subno+"&searchKey="+searchKey+"&searchWord="+searchWord+"&sort=date";
					}else if(sortVal == "gradeSort") {
						location.href="reviewAdList?mainno="+mainno+"&subno="+subno+"&searchKey="+searchKey+"&searchWord="+searchWord+"&sort=grade";
					}else if(sortVal == "pnameSort"){
						location.href="reviewAdList?mainno="+mainno+"&subno="+subno+"&searchKey="+searchKey+"&searchWord="+searchWord+"&sort=pname";
					}
				}else{
					if(sortVal == "dateSort"){
						location.href="reviewAdList?searchKey="+searchKey+"&searchWord="+searchWord+"&sort=date";
					}else if(sortVal == "gradeSort") {
						location.href="reviewAdList?searchKey="+searchKey+"&searchWord="+searchWord+"&sort=grade";
					}else if(sortVal == "pnameSort"){
						location.href="reviewAdList?searchKey="+searchKey+"&searchWord="+searchWord+"&sort=pname";
					}	
				}	
			}else{
				if(sortVal == "dateSort"){
					location.href="reviewAdList?sort=date";
				}else if(sortVal == "gradeSort") {
					location.href="reviewAdList?sort=grade";
				}else if(sortVal == "pnameSort"){
					location.href="reviewAdList?sort=pname";
				}
			}
		});
	});
</script>
<body>
	<div id="y_adminReviewList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	    <div id="y_adminReviewList_rightcon" class="y_Adrightcon">
	        <p id="pageTitle"><span>상품후기 관리</span></p>
	        <div>
	            <form id="y_reviewSearchFrm" method="get" action="reviewAdList" autocomplete='off'>
	           		<ul class="clearfix">
	           			<li>후기검색</li>
	           			<li>
	           				<select name="mainno" id="mainno">
		                    	<option value="" selected disabled="disabled" hidden>대분류 목록</option>
		                    	<c:forEach var="maincate" items="${maincate }">
		                    		<option value="${maincate.mainno }">${maincate.mainname }</option>
		                    	</c:forEach>
			                </select>
			                <select name="subno" id="subno">
			                    <option value="" selected disabled="disabled" hidden>중분류 목록</option>
			                </select>
			                <select name="searchKey" id="searchKey">
			                    <option value="" selected disabled="disabled" hidden>카테고리</option>
			                    <option value="pname">상품명</option>
			                    <option value="userid">작성자</option>
			                    <option value="reviewdate">작성일</option>
			                </select>
			                <input type="text" name="searchWord" id="searchWord">
			                <input type="submit" class="adminMainBtn" value="검색">
	           			</li>
	           			<li><a class="adminSubBtn" href="reviewAdList">전체목록보기</a></li>
	           		</ul>
	            </form>
	            <p>※ 대분류/중분류를 선택하지않고 카테고리만 선택하시면 [전체분류>선택된 카테고리>검색어]에 따른 검색목록이 보여집니다.</p>
	        </div>
	        <div>
	            <div class="clearfix">
	                <button id="y_revSelectDel" class="adminSubBtn">선택삭제</button>
	                <p>
	                <select name="y_reviewAdSort" id="y_reviewAdSort">
	                	<option value="dateSort" selected>최신순</option>
	                	<option value="gradeSort">평점순</option>
	                	<option value="pnameSort">상품명순</option>
	                </select>
	                총 <span class="y_reviewAdRed">${totalRecord }</span>개</p>
	            </div>
	            <ul class="clearfix">
	                <li><input id="y_reviewAllSelect" type="checkbox"></li>
	                <li>상품명</li>
	                <li>리뷰내용</li>
	                <li>작성자</li>
	                <li>평점</li>
	                <li>등록일</li>
	            </ul>
	            <ul class="clearfix">
	            	<c:forEach var="data" items="${list }">
	      				<li><input name="y_reviewCheck" type="checkbox"><input type="hidden" name="reviewno" value="${data.reviewno }"></li>
		                <li class="wordcut">${data.pname }</li>
		                <li class="wordcut">${data.reviewcontent }</li>
		                <li class="wordcut">${data.userid }</li>
		                <li>
		                	<c:choose>
								<c:when test="${data.grade==1 }">
									<p><span class="gradestar">★</span><span class="elsestar">★★★★</span></p><br/>
								</c:when>
								<c:when test="${data.grade==2 }">
									<p><span class="gradestar">★★</span><span class="elsestar">★★★</span></p><br/>
								</c:when>
								<c:when test="${data.grade==3 }">
									<p><span class="gradestar">★★★</span><span class="elsestar">★★</span></p><br/>
								</c:when>
								<c:when test="${data.grade==4 }">
									<p><span class="gradestar">★★★★</span><span class="elsestar">★</span></p><br/>
								</c:when>
								<c:otherwise>
									<p><span class="gradestar">★★★★★</span></p><br/>
								</c:otherwise>
							</c:choose>
		                </li>
		                <li>${data.reviewdate }</li>
	                </c:forEach>
	            </ul>
	        </div>
	        <ul class="adPaging" class="clearfix">
            	<c:if test="${pageVO.pageNum>1 }">
                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="reviewAdList?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.subno != null && pageVO.subno !='' }">&mainno=${pageVO.mainno }&subno=${pageVO.subno }</c:if><c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if><c:if test="${pageVO.sort != null && pageVO.sort !='' }">&sort=${pageVO.sort }</c:if>">＜</a></li>
                </c:if>
                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
                	<c:if test="${p<=pageVO.totalPage }">
	                	<c:if test="${p==pageVO.pageNum }">
	                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="reviewAdList?pageNum=${p}<c:if test="${pageVO.subno != null && pageVO.subno !='' }">&mainno=${pageVO.mainno }&subno=${pageVO.subno }</c:if><c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if><c:if test="${pageVO.sort != null && pageVO.sort !='' }">&sort=${pageVO.sort }</c:if>">${p }</a></li>
	                	</c:if>
	                	<c:if test="${p!=pageVO.pageNum }">
	                		<li><a href="reviewAdList?pageNum=${p}<c:if test="${pageVO.subno != null && pageVO.subno !='' }">&mainno=${pageVO.mainno }&subno=${pageVO.subno }</c:if><c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if><c:if test="${pageVO.sort != null && pageVO.sort !='' }">&sort=${pageVO.sort }</c:if>">${p }</a></li>
	                	</c:if>
                	</c:if>
                </c:forEach>
                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="reviewAdList?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.subno != null && pageVO.subno !='' }">&mainno=${pageVO.mainno }&subno=${pageVO.subno }</c:if><c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if><c:if test="${pageVO.sort != null && pageVO.sort !='' }">&sort=${pageVO.sort }</c:if>">＞</a></li>
                </c:if>
            </ul>
	    </div>
	</div>
</body>
</html>