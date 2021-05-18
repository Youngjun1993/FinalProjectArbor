<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w1400_container font_ng clearfix" id="p_totalList">
	<div id="p_cateList">
		<c:forEach var="subcate" items="${subcate }">
			<a href="productList?mainno=${subcate.mainno }&subno=${subcate.subno }" class="clearfix">
				<c:forEach var="img" items="${cate }">
					<c:if test="${subcate.subno==img.subno }">
						<img src="<%=request.getContextPath()%>/upload/${img.img1}"/><br/>
						<span>${subcate.subname }</span>
					</c:if>
				</c:forEach>
			</a>
		</c:forEach>
	</div>
	<hr/>
	<p class="pageTitle"><span>${mainname }'s Best Item</span></p>
	<div id="p_Totallist">
		<ul class="clearfix">
			<c:forEach var="vo" items="${list }" varStatus="status">
				<li>
					<c:choose>
						<c:when test="${status.count<=4}">
							<span class="p_topLank">Top ${status.count}</span>
						</c:when>
						<c:otherwise>
							<span class="p_Lank">${status.count}</span>
						</c:otherwise>
					</c:choose>
					<a href="productView?pno=${vo.pno }">
					<img src="<%=request.getContextPath()%>/upload/${vo.img1 }" class="p_HoverImg1"/>
					<img src="<%=request.getContextPath()%>/upload/${vo.img2 }" class="p_HoverImg2"/></a><br/>
					<p class="p_listdetail1">${vo.pname }</p>
					<p class="p_listdetail2"><fmt:formatNumber value="${vo.pprice }" pattern="#,###"/></p>
					<p class="p_listdetail3"><fmt:formatNumber value="${vo.saleprice }" pattern="#,###"/></p>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>