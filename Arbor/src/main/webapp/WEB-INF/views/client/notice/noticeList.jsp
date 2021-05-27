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

</script>
<div class="w1400_container clearfix">
	<div id="d_board_top">
		<img src="<%=request.getContextPath()%>/img/d_boardimg.png"/>
		<div>
			<p>CUMMUNITY</p>
			<p>커뮤니티</p>
		</div>
	</div>
	<h1>공지사항</h1>
	<div class="clearfix d_search">
		<form method="post" class="d_searchFrm" action="noticeList">
			<select name="searchKey" id="d_searchKey">
				<option value="noticesubject">제목</option>
				<option value="noticecontent">내용</option>
			</select>
			<input type="text" name="searchWord" placeholder="검색어 입력"/>
			<input type="submit" class="adminMainBtn" value="검색"/>
		</form>
	</div>
	<ul id="d_list" class="d_noticeList">
		<li><p>번호</p></li>
		<li>제목</li>
		<li>등록일</li>
	</ul>
	<div id="d_listContent" class="d_noticeList">
	<ul class="d_noticeList">
		<c:forEach var="noticeList" items="${noticeList}">
		<li><p>${noticeList.noticeno }</p></li>
		<li class="wordcut"><a href="noticeView?no=${noticeList.noticeno }">${noticeList.noticesubject }</a></li>
		<li>${noticeList.noticedate }</li>
		</c:forEach>
	</ul>
	</div>
	<%-- <!-- 페이징 -->
	<ul id="d_paging" class="adPaging clearfix">
		<c:if test="${pageVO.pageNum>1 }">
			<li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
		</c:if>
		<c:if test="${pageVO.pageNum==1 }">
			<li style="border-bottom:none;">&nbsp</li>
		</c:if>
		<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
			<c:if test="${p<=pageVO.totalPage }">
				<c:if test="${p==pageVO.pageNum }">
					<li style="border-bottom:3px solid rgb(191,43,53);"><a href="noticeList?pageNum=${p }">${p }</a></li>
				</c:if>
				<c:if test="${p!=pageVO.pageNum }">
					<li><a href="noticeList?pageNum=${p }">${p }</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${pageVO.pageNum<pageVO.totalPage }">
			<li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
		</c:if>
	</ul> --%>
	<ul id="d_paging" class="adPaging clearfix">
         <c:if test="${pageVO.pageNum>1 }">
            <li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
         </c:if>
         <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
            <c:if test="${p<=pageVO.totalPage }">
               <c:if test="${p==pageVO.pageNum }">
                  <li style="border-bottom:3px solid rgb(191,43,53);"><a href="noticeList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
               <c:if test="${p!=pageVO.pageNum }">
                  <li><a href="noticeList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            <li style="border-bottom:none;"><a class="pagingAdLR_a" href="noticeList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
         </c:if>
     </ul>
</div>
