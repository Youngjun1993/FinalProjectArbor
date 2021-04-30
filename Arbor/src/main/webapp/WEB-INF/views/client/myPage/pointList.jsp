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
<div id="y_pointList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
	<div id="y_pointList_rightCon">
	    <div>
	    	<h2>적립금내역</h2>
	        <ul class="clearfix">
	            <li>일자</li>
	            <li>내용</li>
	            <li>지급 적립금</li>
	            <li>사용 적립금</li>
	            <li>잔여 적립금</li>
	            
	            <li>-</li>
	            <li class="wordcut">-</li>
	            <li>-</li>
	            <li>-</li>
	            <li>-</li>
	        </ul>
	    </div>
	    <ul class="paging" class="clearfix">
	      	<c:if test="${pageVO.pageNum>1 }">
	          	<li><a class="pagingLR_a"  href="pointList?pageNum=${pageVO.pageNum-1}">＜</a></li>
	          </c:if>
	          <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	          	<c:if test="${p<=pageVO.totalPage }">
	           	<c:if test="${p==pageVO.pageNum }">
	           		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="pointList?pageNum=${p}">${p }</a></li>
	           	</c:if>
	           	<c:if test="${p!=pageVO.pageNum }">
	           		<li><a href="pointList?pageNum=${p}">${p }</a></li>
	           	</c:if>
	          	</c:if>
	          </c:forEach>
	          <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	          	<li><a class="pagingLR_a"  href="pointList?pageNum=${pageVO.pageNum+1}">＞</a></li>
	          </c:if>
	      </ul>
	</div>
</div>