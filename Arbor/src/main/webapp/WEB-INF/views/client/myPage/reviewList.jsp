<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li").length;
		$(".paging").css({
			"width" : liCnt*35+"px",
			"margin" : "30px auto"
		});	
		$("#y_leftMenu>ul>li:nth-child(4) a").css({
			"font-weight":"bold",
			"background" :"rgb(94, 94, 94)",
			"color":"#fff"
		});
		if(window.location.pathname=="/home/reviewList"){
			$("#y_reviewDateDescBtn").css({
				"border":"1px solid #333"
			});
		}else if(window.location.pathname=="/home/reviewGradeDesc"){
			$("#y_reviewGradeDescBtn").css({
				"border":"1px solid #333"
			});
		}
	});
	function reviewDel(reviewno){
		if(confirm("삭제하시겠습니까?")){
			location.href="reviewDel?reviewno="+reviewno;
		}
	}
	function reviewEdit(grade, status){
		var gradeLen;
		if(grade.indexOf("☆") < 0){
			gradeLen = "★★★★★";
		}else{
			gradeLen = grade.substring(0, grade.indexOf("☆"));
		}
		console.log(status);
		//버튼 클릭시 변경
		if($(status).text()=="수정"){
			$(status).text("닫기");
		}else{
			$(status).text("수정");
		}
		//display 이벤트
		$(status).parent().next().slideToggle();
		
		//평점 셀렉트
		$(status).parent().next().children().children().children().children("input[name='grade']").val([gradeLen.length]);
	}
	function reviewEditOk(){
		location.href = "reviewEditOk";
	}
</script>
<div id="y_reviewList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_reviewList_rightCon">
        <h2>리뷰관리</h2>
        <div class="clearfix">
            <a id="y_reviewDateDescBtn" href="reviewList">최신순</a>
            <a id="y_reviewGradeDescBtn" href="reviewGradeDesc">평점순</a>
        </div>
        <div>
            <ul class="clearfix">
                <li>리뷰번호</li>
                <li>상품명</li>
                <li>리뷰내용</li>
                <li>평점</li>
                <li>등록일</li>
                <li>　</li>
            </ul>
            <ul class="clearfix">
            	<c:forEach var="data" items="${list }">
	                <li>${data.reviewno }</li>
	                <li class="wordcut"><a href="#">${data.pname }</a></li>
	                <li class="wordcut">${data.reviewcontent }</li>
	                <li>${data.grade }(${data.gradeint })</li>
	                <li>${data.reviewdate }</li>
	                <li>
	                	<button id="y_reviewEdit" class="clientSubBtn" onclick="javascript:reviewEdit('${data.grade}',this)">수정</button>
	                	<button class="clientSubBtn" onclick="reviewDel(${data.reviewno })">삭제</button>
	                </li>
	                <li>
	                	<form action="reviewEditOk" method="post" class="clearfix">
	                		<p><b>상품명</b></p>
	                		<p>${data.pname }</p>
	                		<p><b>리뷰내용</b></p>
	                		<p><textarea name="reviewcontent" rows="5" cols="50">${data.reviewcontent }</textarea></p>
	                		<p><b>평점</b></p>
	                		<p>
	                			<span>
			                		<input type="radio" name="grade" value="1">1
			                		<input type="radio" name="grade" value="2">2
			                		<input type="radio" name="grade" value="3">3
			                		<input type="radio" name="grade" value="4">4
			                		<input type="radio" name="grade" value="5">5
		                		</span>
	                		</p>
	                		<input type="submit" name="reviewEditBtn" class="clientMainBtn" value="수정완료">
	                		<input type="hidden" name="reviewno" value="${data.reviewno }">
	                	</form>
	                </li>
                </c:forEach>
            </ul>
        </div>
        <ul class="paging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li style="border-bottom:none;"><a class="pagingLR_a"  href="reviewList?pageNum=${pageVO.pageNum-1}">＜</a></li>
            </c:if>
            <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
	               	<c:if test="${p==pageVO.pageNum }">
	               		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="reviewList?pageNum=${p}">${p }</a></li>
	               	</c:if>
	               	<c:if test="${p!=pageVO.pageNum }">
	               		<li><a href="reviewList?pageNum=${p}">${p }</a></li>
	               	</c:if>
              	</c:if>
            </c:forEach>
            <c:if test="${pageVO.pageNum<pageVO.totalPage }">
            	<li style="border-bottom:none;"><a class="pagingLR_a"  href="reviewList?pageNum=${pageVO.pageNum+1}">＞</a></li>
            </c:if>
         </ul>
    </div>
</div>