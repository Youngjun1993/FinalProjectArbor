<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li").length;
		$(".paging").css({
			"width" : liCnt*40+"px",
			"margin" : "30px auto"
		});
		$("#y_leftMenu>ul>li:nth-child(6) a").css({
			"font-weight":"bold",
			"background" :"rgb(94, 94, 94)",
			"color":"#fff"
		});
		if(window.location.pathname=="/home/couponList"){
			$("#y_cpnDateDescBtn").css({
				"border":"1px solid #333"
			})
		}else if(window.location.pathname=="/home/cpnSaleDesc"){
			$("#y_cpnSaleDescBtn").css({
				"border":"1px solid #333"
			})
		}
		
	});
</script>
<div id="y_couponList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_coupon_rightCon">
        <h2>쿠폰내역</h2>
        <div class="clearfix">
            <a id="y_cpnDateDescBtn" href="couponList">최신순</a>
            <a id="y_cpnSaleDescBtn" href="cpnSaleDesc">할인순</a>
        </div>
        <div>
            <ul class="clearfix">
                <li>쿠폰번호</li>
                <li>쿠폰명</li>
                <li>할인금액</li>
                <li>적용가능 품목</li>
                <li>유효기간</li>
                <li>　</li>
            </ul>
            <ul class="clearfix">
            	<c:forEach var="cpnData" items="${list }">
	                <li>${cpnData.cpnno }</li>
	                <li>${cpnData.cpnname }</li>
	                <li>${cpnData.salerate }%</li>
	                <li>${cpnData.subname }</li>
	                <li>${cpnData.cpnstart }~${cpnData.cpnend }</li>
	                <li><a href="productList?mainno=${cpnData.mainno }&subno=${cpnData.subno}" class="couponSearchBtn">적용품목 보기</a></li>
                </c:forEach>
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