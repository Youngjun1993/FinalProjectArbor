<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li").length;
		$(".paging").css({
			"width" : liCnt*35+"px",
			"margin" : "30px auto"
		});	
	});
</script>
<div id="y_reviewList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_reviewList_rightCon">
        <h2>리뷰관리</h2>
        <div>
            <button>최신순</button>
            <button>평점순</button>
        </div>
        <div>
            <ul class="clearfix">
                <li>상품번호</li>
                <li>리뷰내용</li>
                <li>별점</li>
                <li>등록일</li>
                <li>　</li>
            </ul>
            <ul class="clearfix">
                <li>-</li>
                <li class="wordcut">-</li>
                <li>-</li>
                <li>-</li>
                <li>
                	<a href="#" class="clientSubBtn">수정</a>
                	<a href="#" class="clientSubBtn">삭제</a>
                </li>
            </ul>
        </div>
        <ul class="paging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li style="border-bottom:none;"><a class="pagingLR_a"  href="reviewList?pageNum=${pageVO.pageNum-1}">＜</a></li>
            </c:if>
            <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
	               	<c:if test="${p==pageVO.pageNum }">
	               		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="reviewList?pageNum=${p}">${p }</a></li>
	               	</c:if>
	               	<c:if test="${p!=pageVO.pageNum }">
	               		<li><a href="reviewList?pageNum=${p}">${p }</a></li>
	               	</c:if>
              	</c:if>
            </c:forEach>
            <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            	<li style="border-bottom:none;"><a class="pagingLR_a"  href="reviewList?pageNum=${pageVO.pageNum+1}">＞</a></li>
            </c:if>
         </ul>
    </div>
</div>