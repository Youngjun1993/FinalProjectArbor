<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w1400_container font_ng">
	<div id="p_center">
		<h1 id="p_listTitle">LIVING Best Item</h1>
		<img src="<%=request.getContextPath()%>/img/sofa1.png"/>
		<img src="<%=request.getContextPath()%>/img/sofa2.jpg"/>
		<img src="<%=request.getContextPath()%>/img/sofa3.jpg"/>
	</div>
	<div id="p_header" class="clearfix">
		<ul id="p_leftTitle" class="clearfix">
			<c:forEach var="subCate" items="${subCate }">
				<li><a href="productList?subno=${subCate.subno }">${subCate.subname }</a></li>
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
		<ul>
			<li>
				<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa1.png"/></a><br/>
				<div class="p_color" class="clearfix">
					<div></div>
					<div></div>
					<div></div>
				</div><br/>
				<p class="p_listdetail1">소파가 1+1인가봐용</p>
				<p class="p_listdetail2">600,000원</p>
				<p class="p_listdetail3">480,000원</p>
			</li>
			
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa2.jpg"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">2인용은 너무 작으니까 3인용</p>
			<p class="p_listdetail2">500,000원</p>
			<p class="p_listdetail3">420,000원</p>
			</li>
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa3.jpg"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">푹신하게 생겼네 스툴도있어</p>
			<p class="p_listdetail2">900,000원</p>
			<p class="p_listdetail3">720,000원</p>
			</li>
			<li>
			<a href="p_productView"><img src="<%=request.getContextPath()%>/img/sofa4.png"/></a><br/>
			<div class="p_color" class="p_clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">자취생은 집이 좁으니까 2인용소파</p>
			<p class="p_listdetail2">350,000원</p>
			<p class="p_listdetail3">230,000원</p>
			</li>
			<li>
			<a href="p_productView"><img src="<%=request.getContextPath()%>/img/sofa1.png"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">소파가 1+1인가봐용</p>
			<p class="p_listdetail2">600,000원</p>
			<p class="p_listdetail3">480,000원</p>
			</li>
			<li>
			<a href="p_productView"><img src="<%=request.getContextPath()%>/img/sofa2.jpg"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">2인용은 너무 작으니까 3인용</p>
			<p class="p_listdetail2">500,000원</p>
			<p class="p_listdetail3">420,000원</p>
			</li>
			<li>
			<a href="p_productView"><img src="<%=request.getContextPath()%>/img/sofa3.jpg"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">푹신하게 생겼네 스툴도있어</p>
			<p class="p_listdetail2">900,000원</p>
			<p class="p_listdetail3">720,000원</p>
			</li>
			<li>
			<a href="p_productView"><img src="<%=request.getContextPath()%>/img/sofa4.png"/></a><br/>
			<div class="p_color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="p_listdetail1">자취생은 집이 좁으니까 2인용소파</p>
			<p class="p_listdetail2">350,000원</p>
			<p class="p_listdetail3">230,000원</p>
			</li>
		</ul>
	</div>
</div>