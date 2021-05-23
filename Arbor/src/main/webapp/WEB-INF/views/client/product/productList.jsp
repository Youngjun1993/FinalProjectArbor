<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w1400_container font_ng">
	<div id="p_center">
		<h1 id="p_listTitle">${subname } Best Item</h1>
		<c:forEach var="top" items="${topList }" varStatus="status">
			<a href="productView?pno=${top.pno }">
			<img src="<%=request.getContextPath()%>/upload/${top.img1}" class="p_HoverImg1"/>
			<img src="<%=request.getContextPath()%>/upload/${top.img2}" class="p_HoverImg2"/></a>
		</c:forEach>
	</div>
	<div id="p_header" class="clearfix">
		<ul id="p_leftTitle" class="clearfix">
			<c:forEach var="subCate" items="${subCate }">
				<li><a href="productList?mainno=${subCate.mainno }&subno=${subCate.subno }">${subCate.subname }</a></li>
				<li>&nbsp</li>
			</c:forEach>
		</ul>
		<ul id="p_rightTitle" class="clearfix">
			<li><a href="productList?subno=${pageVO.subno }&msg=newArray">최신순</a></li>
			<li>|</li>
			<li><a href="productList?subno=${pageVO.subno }&msg=lowpriceArray">낮은가격순</a></li>
			<li>|</li>
			<li><a href="productList?subno=${pageVO.subno }&msg=highpriceArray">높은가격순</a></li>
			<li>|</li>
			<li><a href="productList?subno=${pageVO.subno }&msg=orderArray">판매순위순</a></li>
		</ul>
	</div>
	<hr/>
	<div id="p_list">
		<ul class="clearfix">
			<c:forEach var="vo" items="${list }">
				<li>
					<a href="productView?pno=${vo.pno }"><img src="<%=request.getContextPath()%>/upload/${vo.img1}" class="p_HoverImg1"/>
					<img src="<%=request.getContextPath()%>/upload/${vo.img2}" class="p_HoverImg2"/></a><br/>
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
					<span class="p_salepercent">${vo.salepercent }% 할인</span>
					
				</li>
			</c:forEach>
		</ul>
	</div>
	<div id="pagingDiv">
		 <ul class="paging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li style="border-bottom:none;"><a class="pagingLR_a"  href="productList?mainno=${pageVO.mainno }&subno=${pageVO.subno }&pageNum=${pageVO.pageNum-1}">＜</a></li>
            </c:if>
            <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
	               	<c:if test="${p==pageVO.pageNum }">
	               		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="productList?mainno=${pageVO.mainno }&subno=${pageVO.subno }&pageNum=${p}">${p }</a></li>
	               	</c:if>
	               	<c:if test="${p!=pageVO.pageNum }">
	               		<li><a href="productList?mainno=${pageVO.mainno }&subno=${pageVO.subno }&pageNum=${p}">${p }</a></li>
	               	</c:if>
              	</c:if>
            </c:forEach>
            <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            	<li style="border-bottom:none;"><a class="pagingLR_a"  href="productList?mainno=${pageVO.mainno }&subno=${pageVO.subno }&pageNum=${pageVO.pageNum+1}">＞</a></li>
            </c:if>
         </ul>
	</div>
</div>