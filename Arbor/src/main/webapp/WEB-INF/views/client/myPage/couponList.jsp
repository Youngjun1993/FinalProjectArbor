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
<div id="y_couponList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_coupon_rightCon">
        <h2>쿠폰내역</h2>
        <div>
            <button>최신순</button>
            <button>할인순</button>
        </div>
        <div>
            <ul class="clearfix">
                <li>쿠폰번호</li>
                <li>쿠폰명</li>
                <li>할인금액</li>
                <li>적용 범위</li>
                <li>유효기간</li>
                <li>　</li>
            </ul>
            <ul class="clearfix">
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li><a href="#" class="couponSearchBtn">적용상품 보기</a></li>
            </ul>
        </div>
        <ul class="paging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li style="border-bottom:none;"><a class="pagingLR_a"  href="couponList?pageNum=${pageVO.pageNum-1}">＜</a></li>
            </c:if>
            <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
	               	<c:if test="${p==pageVO.pageNum }">
	               		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="couponList?pageNum=${p}">${p }</a></li>
	               	</c:if>
	               	<c:if test="${p!=pageVO.pageNum }">
	               		<li><a href="couponList?pageNum=${p}">${p }</a></li>
	               	</c:if>
              	</c:if>
            </c:forEach>
            <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            	<li style="border-bottom:none;"><a class="pagingLR_a"  href="couponList?pageNum=${pageVO.pageNum+1}">＞</a></li>
            </c:if>
         </ul>
    </div>
</div>