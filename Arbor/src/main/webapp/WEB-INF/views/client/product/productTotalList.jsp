<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w1400_container font_ng" id="p_totalList">
	<c:forEach var="maincate" items="${maincate }">
		<div class="p_centerTotal">
			<h1 class="p_listTitleTotal">${maincate.mainname }'s Best Item</h1>
			<c:forEach var="vo" items="${list }">
				<c:if test="${maincate.mainno==vo.mainno }">
					<a href="productView?pno=${vo.pno }">
					<img src="<%=request.getContextPath()%>/upload/${vo.img1}" class="p_HoverImg1"/>
					<img src="<%=request.getContextPath()%>/upload/${vo.img2}" class="p_HoverImg2"/></a>
				</c:if>
			</c:forEach>
		</div><hr/>
	</c:forEach>
</div>