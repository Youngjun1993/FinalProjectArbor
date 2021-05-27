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
	  // $("ul > li:first-child a").next().show();
	  $(".d_faqname").click(function(){
		var dh = $(this).parent().height();
		if(dh < 60){
		 	var divheight=$(this).next().height();
		 	var dhdh = dh + divheight;
		   	$(this).parent().css('height',dhdh + 'px');
		   	
		   	$(this).parent().siblings().css('height', 51+'px');
		}else if(dh > 60){
			$(this).parent().css('height',51 + 'px');
		}
	    return false;

	 });
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
			<input type="submit" class="clientMainBtn" value="검색"/>
		</form>
	</div>
	<div id="d_faqtitle">
	<ul>
		<li></li>
	</ul>
	</div>
	<div>
		<c:forEach var="faqList" items="${faqlist}">
		<div class="d_faqsubject">
			<div class="d_faqname">
				<div>Q</div><div><a href="#"> [${faqList.faqcate}] ${faqList.faqsubject }</a></div>
			</div>
			<div class="d_faqcontent">
				<div>A</div><div>${faqList.faqcontent }</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<ul id="d_paging" class="paging clearfix">
         <c:if test="${pageVO.pageNum>1 }">
            <li style="border-bottom:none;"><a class="pagingLR_a" href="faqList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
         </c:if>
         <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
            <c:if test="${p<=pageVO.totalPage }">
               <c:if test="${p==pageVO.pageNum }">
                  <li style="border-bottom:3px solid rgb(90,120,114);"><a href="faqList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
               <c:if test="${p!=pageVO.pageNum }">
                  <li><a href="faqList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            <li style="border-bottom:none;"><a class="pagingLR_a" href="faqList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
         </c:if>
     </ul>
</div>
