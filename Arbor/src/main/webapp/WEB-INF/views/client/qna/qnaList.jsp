<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $("#qnaPaging>li").length;
		$("#qnaPaging").css({
			"width" : liCnt*30+"px",
			"margin" : "0 auto"
		});
	});
</script>
    <div id="y_qnaWrap" class="w1400_container clearfix">
        <div id="y_leftMenu">
            <ul>
                <li class="y_title_fs25">My Page</li>
                <li><a href="#">구매내역</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">리뷰관리</a></li>
                <li><a href="qnaList">1:1문의</a></li>
                <li><a href="#">쿠폰내역</a></li>
                <li><a href="#">적립금내역</a></li>
                <li><a href="#">회원탈퇴</a></li>
            </ul>
        </div>
        <div id="y_list_rightcon" class="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A) 목록</p>
            <ul class="clearfix">
                <li>문의유형</li>
                <li>제목</li>
                <li>주문번호</li>
                <li>처리상태</li>
                <li>등록일</li>
                <c:forEach var="data" items="${list }">
	                <li>${data.qnacate }</li>
	                <li><a href="qnaView?qnano=${data.qnano }" class="wordcut">${data.qnasubject }</a></li>
	                <li>${data.orderno }</li>
	                <li>
	                	<c:if test="${data.answercontent == null }">
	                		<span class="y_anserWait">답변대기</span>
	                	</c:if>
	                	<c:if test="${data.answercontent != null }">
	                		<span class="y_anserComp">답변완료</span>
	                	</c:if>
	                </li>
	                <li>${data.qnadate }</li>
                </c:forEach>
            </ul>
            <a href="qnaWrite" id="y_qnaGo">문의하기</a>
            <ul id="qnaPaging" class="clearfix">
            	<c:if test="${pageVO.pageNum>1 }">
                	<li><a href="qnaList?pageNum=${pageVO.pageNum-1}">이전</a></li>
                </c:if>
                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
                	<c:if test="${p<=pageVO.totalPage }">
	                	<c:if test="${p==pageVO.pageNum }">
	                		<li><a href="qnaList?pageNum=${p}">${p }</a></li>
	                	</c:if>
	                	<c:if test="${p!=pageVO.pageNum }">
	                		<li><a href="qnaList?pageNum=${p}">${p }</a></li>
	                	</c:if>
                	</c:if>
                </c:forEach>
                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
                	<li><a href="qnaList?pageNum=${pageVO.pageNum+1}">다음</a></li>
                </c:if>
            </ul>
        </div>
    </div>