<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="y_dibs_wrap" class="w1400_container">
    <div>
        <h1 style="text-align: center;">찜목록</h1>
        <div class="clearfix">
        	<c:forEach var="data" items="${list }">
	            <ul>
	                <li><button>✕</button></li>
	                <li><h2 class="wordcut">${data.pname }</h2></li>
	                <li><img src="<%=request.getContextPath()%>/upload/${data.img1}" alt=""></li>
	                <li>
	                    남은 재고 : <span>${data.stock }개</span><br/>
	                    가격 : <span>${data.saleprice }원</span><br/>
	                    찜한 날짜 : <span>${data.dibsdate }</span>
	                </li>	                
	                <li class="clearfix wordcut">
	                	<c:forEach var="opt" items="${optList }">
	                		<c:if test="${data.pno==opt.pno }">
	                    		<span>${opt.optionvalue }</span>
	                    	</c:if>
	                    </c:forEach>
	                </li>
	                <li class="clearfix"><a href="#" class="clientMainBtn">장바구니에 추가</a></li>
	            </ul>
            </c:forEach>
        </div>
        <ul class="paging" class="clearfix">
         	<c:if test="${pageVO.pageNum>1 }">
             	<li style="border-bottom:none;"><a class="pagingLR_a" href="dibsList?pageNum=${pageVO.pageNum-1}">＜</a></li>
             </c:if>
             <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
             	<c:if test="${p<=pageVO.totalPage }">
              	<c:if test="${p==pageVO.pageNum }">
              		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="dibsList?pageNum=${p}">${p }</a></li>
              	</c:if>
              	<c:if test="${p!=pageVO.pageNum }">
              		<li><a href="dibsList?pageNum=${p}">${p }</a></li>
              	</c:if>
             	</c:if>
             </c:forEach>
             <c:if test="${pageVO.pageNum<pageVO.totalPage }">
             	<li style="border-bottom:none;"><a class="pagingLR_a" href="dibsList?pageNum=${pageVO.pageNum+1}">＞</a></li>
             </c:if>
         </ul>
    </div>
</div>