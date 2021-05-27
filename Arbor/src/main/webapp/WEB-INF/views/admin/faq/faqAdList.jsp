<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqAdList</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/faqAdmin.css" type="text/css" />
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
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
	  $(".d_faqAdc").click(function(){
		var dh = $(this).parent().parent().height();
		if(dh < 45){
		 	var divheight=$(this).parent().next().height();
		 	var dhdh = dh + divheight;
		   	$(this).parent().parent().css('height',dhdh + 'px');
		   	
		   	$(this).parent().parent().siblings().css('height', 41+'px');
		}else if(dh > 45){
			$(this).parent().parent().css('height',41 + 'px');
		}
	    return false;
	  });
});

/* $(document).ready(function(){
	  // $("ul > li:first-child a").next().show();
	  $(".d_faqAdname").click(function(){
		var dh = $(this).parent().height();
		if(dh < 45){
		 	var divheight=$(this).next().height();
		 	var dhdh = dh + divheight;
		   	$(this).parent().css('height',dhdh + 'px');
		   	
		   	$(this).parent().siblings().css('height', 41+'px');
		}else if(dh > 45){
			$(this).parent().css('height',41 + 'px');
		}
	    return false;
	  });
}); */
	  
$(function(){
	
	$('#d_faqBtn').click(function(){
		location.href="faqInsert";
	});
	
});

function faqDel(faqno){
	if(confirm("삭제하시겠습니까?")){
		location.href="faqDel?no="+faqno;
	}
}

</script>
</head>
<body>
<div class="w1400_container clearfix">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm">
	<p class="j_adminMemu"><span>자주묻는 질문</span></p>
	<div class="clearfix j_search">
		<form method="post" class="d_searchFrm" action="faqList">
			<select name="searchKey" id="d_searchKey">
				<option value="faqsubject">제목</option>
				<option value="faqcontent">내용</option>
			</select>
			<input type="text" name="searchWord" placeholder="검색어 입력"/>
			<input type="submit" class="adminMainBtn" value="검색"/>
		</form>
	</div>
	<div id="d_faqAdtitle">
	<ul>
		<li></li>
	</ul>
	</div>
	<div>
		<c:forEach var="faqList" items="${faqAd}">
			<div class="d_faqAdsubject">
				<div class="d_faqAdname">
					<div>Q</div>
					<div class="d_faqAdc">
						<a href="#">[${faqList.faqcate}] ${faqList.faqsubject }</a>
					</div>
					<div>
						<input type="button" class="adminSubBtn"  onclick="javascript:faqDel(${faqList.faqno})" value="삭제"/>
						<input type="button" class="adminMainBtn" onclick="location.href='faqEdit?no=${faqList.faqno}'" value="수정"/>
					</div>
				</div>
				<div class="d_faqAdcontent">
					<div class="d_faqA">A</div><div>${faqList.faqcontent }</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<p class="j_eventSetBtn"><input type="button" class="adminMainBtn" id="d_faqBtn" value="등록하기"></p>
	<!-- 페이징 -->
	<ul id="d_paging" class="adPaging clearfix">
         <c:if test="${pageVO.pageNum>1 }">
            <li style="border-bottom:none;"><a class="pagingAdLR_a" href="faqAdList?pageNum=${pageVO.pageNum-1 }">＜</a></li>
         </c:if>
         <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
            <c:if test="${p<=pageVO.totalPage }">
               <c:if test="${p==pageVO.pageNum }">
                  <li style="border-bottom:3px solid rgb(191,43,53);"><a href="faqAdList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
               <c:if test="${p!=pageVO.pageNum }">
                  <li><a href="faqAdList?pageNum=${p }<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
               </c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            <li style="border-bottom:none;"><a class="pagingAdLR_a" href="faqAdList?pageNum=${pageVO.pageNum+1 }">＞</a></li>
         </c:if>
     </ul>
	</div>
</div>
</body>
</html>