<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li");
		$(".paging").css({
			"width" : liCnt.length*40+"px",
			"margin" : "0 auto"
		});
		
		var optList = $('.y_dibsOpt').children('span');
		var dibsPnoSet = [];
		var dibsPnoGet = [];
		
		for(var i=0; i<optList.length; i++){
			dibsPnoSet[i] = $(optList).eq(i).children('input[name=pno]').val();
		}
		
		$.each(dibsPnoSet,function(i,value){
			if(dibsPnoGet.indexOf(value) == -1) dibsPnoGet.push(value);
		});
		
		$.ajax({
			url : "dibsStart",
			dataType : "json",
			type : "POST",
			data : {
				dibsPnoGet : dibsPnoGet
			}, success : function(result){
				var $result = $(result);
				var price = 0;
				
				$result.each(function(idx, data) {
					$('.y_dibsMainList').eq(idx).children('li:nth-child(4)').children('span:nth-of-type(2)').text((data.price).toLocaleString()+"원");
					price += data.price;
				});
				
			}, error : function(request,status,error){
				console.log('찜목록 시작 에러')
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	});
	function dibsAppendCart(pno){
		$.ajax({
			url : "dibsAppendCart",
			dataType : "json",
			type : "POST",
			data : {
				pno : pno
			}, success : function(result){
				if(result>0) {
					if(confirm("장바구니에 등록되었습니다. 장바구니로 이동하시겠습니까?")) {
						location.href="cartList";
					} else {
						location.href="dibsList";
					}
				}
			}, error : function(request,status,error){
				console.log('찜목록 장바구니에 추가 버튼 에러')
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	function dibsDelete(pno){
		if(confirm("상품을 삭제하시겠습니까?")) {
			location.href="dibsDelete?pno="+pno;
		}
	}
</script>
<div id="y_dibsTop">
	<div class="y_dibsHeader"></div>
	<p>Furniture days</p>
</div>
<div id="y_dibs_wrap" class="w1400_container">
	<div>
	    <h1 style="text-align: center;">찜목록</h1>
	    <div class="clearfix">
	    	<c:forEach var="data" items="${list }">
	         <ul class="y_dibsMainList">
	             <li><button onclick="location.href='javascript:dibsDelete(${data.pno})'">✕</button></li>
	             <li><h2 class="wordcut">${data.pname }</h2></li>
	             <li><img src="<%=request.getContextPath()%>/upload/${data.img1}" alt=""></li>
	             <li>
	                 남은 재고 : <span>${data.stock }개</span><br/>
	                 총 가격 : <span>-</span><br/>
	                 찜한 날짜 : <span>${data.dibsdate }</span>
	             </li>	                
	             <li class="clearfix wordcut y_dibsOpt">
	             	<c:forEach var="opt" items="${optList }">
	             		<c:if test="${data.pno==opt.pno }">
	                 		<c:if test="${opt.optionvalue != '' && opt.optionvalue != null }">
	                 		 	<span>${fn:trim(opt.optionvalue) } ${opt.quantity }개<input type="hidden" name="pno" value="${opt.pno }"></span>
	                 		</c:if>
	                 		<c:if test="${opt.optionvalue == '' || opt.optionvalue == null }">
	                 		 	<span style="border:none;">옵션이 없는 상품입니다.<input type="hidden" name="pno" value="${opt.pno }"></span>
	                 		</c:if>
	                 	</c:if>
	                 </c:forEach>
	             </li>
	             <li class="clearfix"><a href="javascript:dibsAppendCart(${data.pno })" class="clientMainBtn">장바구니에 추가</a></li>
	         </ul>
	        </c:forEach>
	    </div>
	    <ul class="paging clearfix">
	     	<c:if test="${pageVO.pageNum>1 }">
	         	<li style="border-bottom:none;"><a class="pagingLR_a" href="dibsList?pageNum=${pageVO.pageNum-1}">＜</a></li>
	         </c:if>
	         <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	         	<c:if test="${p<=pageVO.totalPage }">
		          	<c:if test="${p==pageVO.pageNum }">
		          		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="dibsList?pageNum=${p}">${p }</a></li>
		          	</c:if>
		          	<c:if test="${p!=pageVO.pageNum }">
		          		<li><a href="dibsList?pageNum=${p}">${p }</a></li>
		          	</c:if>
	         	</c:if>
	         </c:forEach>
	         <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	         	<li style="border-bottom:none;"><a class="pagingLR_a" href="dibsList?pageNum=${pageVO.pageNum+1}">＞</a></li>
	         </c:if>
	     </ul>
     </div>
</div>