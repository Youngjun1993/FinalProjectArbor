<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w1400_container font_ng">
	<div id="p_center">
		<h1 id="p_listTitle">${mainname }'s New Item</h1>
		<img src="<%=request.getContextPath()%>/img/sofa1.png"/>
		<img src="<%=request.getContextPath()%>/img/sofa2.jpg"/>
		<img src="<%=request.getContextPath()%>/img/sofa3.jpg"/>
	</div>
	<div id="p_header" class="clearfix">
		<ul id="p_leftTitle" class="clearfix">
			<c:forEach var="subCate" items="${subCate }">
				<li><a href="productList?mainno=${subCate.mainno }&subno=${subCate.subno }">${subCate.subname }</a></li>
				<li>&nbsp</li>
			</c:forEach>
		</ul>
		<ul id="p_rightTitle" class="clearfix">
			<li><a href="#">최신순</a></li>
			<li>|</li>
			<li><a href="#">낮은가격순</a></li>
			<li>|</li>
			<li><a href="#">높은가격순</a></li>
			<li>|</li>
			<li><a href="#">판매순위순</a></li>
		</ul>
	</div>
	<hr/>
	<div id="p_list">
		<ul class="clearfix">
			<c:forEach var="vo" items="${list }">
				<li>
					<a href="productView?pno=${vo.pno }"><img src="<%=request.getContextPath()%>/upload/${vo.img1}"/></a><br/>
					<div class="p_color" class="clearfix">
						<c:forEach var="opt" items="${opt }">
							<c:if test="${opt.rgbvalue!=null && vo.pno==opt.pno }">
								<div style="background-color:${opt.rgbvalue}"></div>
							</c:if>
						</c:forEach>
					</div><br/>
					<p class="p_listdetail1">${vo.pname }</p>
					<p class="p_listdetail2"><fmt:formatNumber value="${vo.pprice }" pattern="#,###"/></p>
					<p class="p_listdetail3"><fmt:formatNumber value="${vo.saleprice }" pattern="#,###"/></p>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>