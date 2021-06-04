<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/qna.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
</head>
<script>
	$(function(){
		//페이징 li만큼 갯수 구하기
		var liCnt = $(".adPaging>li").length;
		$(".adPaging").css({
			"width" : liCnt*40+"px",
			"margin" : "30px auto"
		});	
		//문의유형 선택시 이벤트
		$("#y_qnaSearchFrm select").change(function(){
			if($("#y_qnaSearchFrm select option:selected").text() == "문의유형"){
				$("#y_qnaSearchFrm input[type='text']").val("ex) 교환/환불, 결제관련, 기타");
			}else{
				$("#y_qnaSearchFrm input[type='text']").val("");
			}
		});
	
		//검색어 포커스 인 값 초기화
		$("#y_qnaSearchFrm input[type='text']").focusin(function(){
			$(this).val("");
		});
		
		//검색폼 제약조건
		$("#y_qnaSearchFrm").submit(function(){
			if($("#y_qnaSearchFrm select").val()==""){
				alert("카테고리를 선택하세요.")
				return false;
			}
			if($("#y_qnaSearchFrm input[type='text']").val()=="" || $("#y_qnaSearchFrm input[type='text']").val()=="ex) 교환/반품, 결제관련, 기타"){
				alert("검색어를 입력하세요.")
				return false;
			}
			return true;
		});
	});
</script>
<body>
    <div id="y_adminQnaList_Wrap" class="w1400_container clearfix">
        <%@include file="/WEB-INF/inc/adminMenu.jspf"%>
        <div id="y_adminQnaList_rightcon" class="y_Adrightcon">
        	<p id="pageTitle"><span>1:1문의(Q&#38;A) 목록</span></p>
            <div>
                <form id="y_qnaSearchFrm" action="qnaAdList" method="get">
                    <select name="searchKey" id="searchKey">
                    	<option value="" selected disabled="disabled" hidden>카테고리</option>
                        <option value="qnacate">문의유형</option>
                        <option value="qnasubject">제목</option>
                    	<option value="userid">작성자</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord" />
                    <input type="submit" id="qnaSearchBtn" class="adminMainBtn" value="검색">
                </form>
                <a href="qnaNoAnswerList" class="adminMainBtn">미답변 질문(${countAns}건)</a>
            </div>
            <ul class="clearfix">
                <li>문의유형</li>
                <li>제목</li>
                <li>작성자</li>
                <li>등록일</li>
                <li>처리상태</li>
                <c:forEach var="data" items="${list }">
	                <li>${data.qnacate }</li>
	                <li><a href="qnaAdView?qnano=${data.qnano }&pageNum=${pageVO.pageNum}&ansBtnCheck=${ansBtnCheck }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>" class="wordcut">${data.qnasubject }</a></li>
	                <li>${data.userid }</li>
	                <li>${data.qnadate }</li>
	                <li>
	                	<c:if test="${data.answercontent == null }">
	                		<span class="y_anserRed">답변대기</span>
	                	</c:if>
	                	<c:if test="${data.answercontent != null }">
	                		<span class="y_anserDark">답변완료</span>
	                	</c:if>
	                </li>
	             </c:forEach>   
            </ul>
            <c:if test="${ansBtnCheck eq 'Y'}">
	            <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="qnaNoAnswerList?pageNum=${pageVO.pageNum-1}">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="qnaNoAnswerList?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="qnaNoAnswerList?pageNum=${p}">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="qnaNoAnswerList?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">＞</a></li>
	                </c:if>
	            </ul>
            </c:if> 
            <c:if test="${ansBtnCheck eq 'N'}">
	            <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="qnaAdList?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="qnaAdList?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="qnaAdList?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="qnaAdList?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">＞</a></li>
	                </c:if>
	            </ul>
            </c:if>
        </div>
    </div>
</body>
</html>
