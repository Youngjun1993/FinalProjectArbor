<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
var pageNum = '<c:out value="${pageVO.pageNum}"/>';
function msg(){
	if(pageNum>1){
		window.scrollTo(0,400);
	}
}
window.onload=msg;

$(document).ready(function(){
	  $("p").hide();
	  // $("ul > li:first-child a").next().show();
	  $("ul li a").click(function(){
	    $(this).next().slideToggle(300);
	    // $(this).next().slideDown(300);
	    $("ul li a").not(this).next().slideUp(300);
	    return false;
	  });
	  $("ul li a").eq(0).trigger("click");
	});

</script>
<div class="w1400_container clearfix">
	<div id="d_board_top">
		<img src="<%=request.getContextPath()%>/img/faqimg1.png"/>
		<div>
			<p>CUMMUNITY</p>
			<p>커뮤니티</p>
		</div>
	</div>
	<h1>자주하는 질문</h1>
	<div class="clearfix d_search">
		<form method="post" class="d_searchFrm" action="faqList">
			<select name="searchKey" id="d_searchKey">
				<option value="faqsubject">제목</option>
				<option value="faqcontent">내용</option>
			</select>
			<input type="text" name="searchWord" placeholder="검색어 입력"/>
			<input type="submit" class="adminMainBtn" value="검색"/>
		</form>
	</div>
	<ul id="d_faqtitle">
		<li>자주하는 질문</li>
	</ul>
	<div id="d_faqsubject">
		<ul>
		<c:forEach var="faqList" items="${faqlist}">
				<li>
					<a href="#">Q ${faqList.faqcate} ${faqList.faqsubject }</a>
					<p>${faqList.faqcontent }</p>
				</li>
		</c:forEach>
		</ul>
	</div>
	<!-- 페이징 -->
	<ul id="d_paging" class="adPaging clearfix">
		<c:if test="${pageVO.pageNum>1 }">
			<li style="border-bottom:none;"><a class="pagingAdLR_a" href="faqList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
		</c:if>
		<c:if test="${pageVO.pageNum==1 }">
			<li style="border-bottom:none;">&nbsp</li>
		</c:if>
		<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
			<c:if test="${p<=pageVO.totalPage }">
				<c:if test="${p==pageVO.pageNum }">
					<li style="border-bottom:3px solid rgb(191,43,53);"><a href="faqList?pageNum=${p }">${p }</a></li>
				</c:if>
				<c:if test="${p!=pageVO.pageNum }">
					<li><a href="faqList?pageNum=${p }">${p }</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${pageVO.pageNum<pageVO.totalPage }">
			<li style="border-bottom:none;"><a class="pagingAdLR_a" href="faqList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
		</c:if>
	</ul>
</div>
