<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/productInsert.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>상품문의관리</span></p>
			<div id="insertInfo">
				<p><span class=pTitle>문의글 검색</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<form method="post" action="pqnaList" id="p_productSearchFrm">
						<span class="pContent">검색어</span>
						<select name="searchKey" id="searchKey">
							<c:choose>
								<c:when test="${pageVO.searchKey==pname }">
									<option value="pname" selected>상품명</option>
									<option value="userid">작성자</option>
									<option value="pqnasubject">제목</option>
									<option value="pqnacontent">내용</option>
								</c:when>
								<c:when test="${pageVO.searchKey==userid }">
									<option value="pname">상품명</option>
									<option value="userid" selected>작성자</option>
									<option value="pqnasubject">제목</option>
									<option value="pqnacontent">내용</option>
								</c:when>
								<c:when test="${pageVO.searchKey==pqnasubject }">
									<option value="pname">상품명</option>
									<option value="userid">작성자</option>
									<option value="pqnasubject" selected>제목</option>
									<option value="pqnacontent">내용</option>
								</c:when>
								<c:when test="${pageVO.searchKey==pqnacontent }">
									<option value="pname">상품명</option>
									<option value="userid">작성자</option>
									<option value="pqnasubject">제목</option>
									<option value="pqnacontent" selected>내용</option>
								</c:when>
								<c:otherwise>
									<option value="pname">상품명</option>
									<option value="userid">작성자</option>
									<option value="pqnasubject">제목</option>
									<option value="pqnacontent">내용</option>
								</c:otherwise>
							</c:choose>
						</select>
						<input type="text" name="searchWord" id="searchWord" value="${pageVO.searchWord }" />
						<br/><br/>
						<ul id="pDateCate">
							<li><span class="pContent">등록일자</span></li>
							<li><a href="javascript:pDateClick(1)">당일</a></li>
							<li><a href="javascript:pDateClick(2)">일주일</a></li>
							<li><a href="javascript:pDateClick(3)">1개월</a></li>
							<li><a href="javascript:pDateClick(4)">3개월</a></li>
							<li><a href="javascript:pDateClick(5)">1년</a></li>
						</ul>
						<span class="pContent"></span>
						<input type="text" name="startdate" id="startdate" value="${pageVO.startdate }" placeholder="시작일 직접 선택" autocomplete="off"/>
						<span class="centertxt">~</span>
						<input type="text" name="enddate" id="enddate" value="${pageVO.enddate }" placeholder="종료일 직접 선택" autocomplete="off"/>
						<input type="submit" value="Search" class="adminMainBtn"/>
						<br/>
						<input type="hidden" name="pageNum" id="p_pageNum" value="${pageVO.pageNum }"/>
					</form>
				</div>
			</div>
			<br/><br/>
			<div id="productQnaList" class="clearfix">
				<p><span class=pTitle>상품문의목록</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<button type="button" class="adminSubBtn" id="pqnaNoAnswerList">미답변글(${cnt })</button>
				<ul id="productQnaList_ul" class="clearfix">
					<li class="tableHeader">글번호</li>
					<li class="tableHeader wordcut">상품명</li>
					<li class="tableHeader wordcut">문의제목</li>
					<li class="tableHeader">작성자</li>
					<li class="tableHeader">작성일</li>
					<li class="tableHeader">답변상태</li>
					<c:forEach var="vo" items="${vo }">
						<li>${vo.pqnano }</li>
						<li class="wordcut">${vo.pname }</li>
						<li class="wordcut"><a href="pqnaAnswer?pqnano=${vo.pqnano }">${vo.pqnasubject }</a></li>
						<li>${vo.userid }</li>
						<li>${vo.pqnadate }</li>
						<c:if test="${vo.panswercontent=='' || vo.panswercontent==null }">
							<li><span class="answerNo">답변대기중</span></li>
						</c:if>
						<c:if test="${vo.panswercontent!='' && vo.panswercontent!=null }">
							<li><span class="answerOk">답변완료</span></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div id="pagingDiv">
				 <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum-1})">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="javascript:p_pageChange(${p})">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="javascript:p_pageChange(${p})">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="javascript:p_pageChange(${pageVO.pageNum+1})">＞</a></li>
	                </c:if>
	            </ul>
            </div>
		</div>
	</div>
</body>
</html>