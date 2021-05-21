<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/couponAd.css" type="text/css"/>
</head>
<script>
	$(function(){
		//페이징 li만큼 갯수 구하기
		var liCnt = $(".adPaging>li").length;
		$(".adPaging").css({
			"width" : liCnt*40+"px",
			"margin" : "0 auto"
		});	
		// 수정버튼 이벤트
		$(".y_viewCoupon>ul li:last-child button").click(function(){
			/* $(this).parent().parent().parent().css({
				"display":"none"
			}) */
			$(this).parent().parent().parent().css("display","none");
			$(".y_viewCoupon>ul li:last-child button").attr("disabled", true)
			$(".y_viewCoupon>ul li:last-child button").removeClass("adminSubBtn");
			$(".y_viewCoupon>ul li:last-child button").addClass("y_disabledBtn");
			$(this).parent().parent().parent().next().fadeIn()
		});
		// 수정완료 버튼 이벤트
		$(".y_cpnAdEditFrm").submit(function(){
			var inputSalerate = $('.y_cpnAdEditFrm>div:nth-of-type(2) input[name=salerate]').val();
			var inputCpnname = $('.y_cpnAdEditFrm>ul li:nth-child(1) input[name=cpnname]').val();
			var inputCpnStart = $('.y_cpnAdEditFrm>ul li:nth-child(2) input[name=cpnstart]').val();
			var inputCpnEnd = $('.y_cpnAdEditFrm>ul li:nth-child(2) input[name=cpnend]').val();
			if(inputSalerate==null || inputSalerate == ""){
				alert("할인율을 입력해주세요.")
				return false;
			}else if(inputCpnname==null || inputCpnname == "") {
				alert("쿠폰명을 입력해주세요.")
				return false;
			}else if(inputCpnStart==null || inputCpnStart =="") {
				alert("시작기간을 입력해주세요.")
				return false;
			}else if(inputCpnEnd==null || inputCpnEnd=="") {
				alert("종료기간을 입력해주세요.")
				return false;
			}
			return true;
		});
		//쿠폰 등록
		$('#y_insertCpn').click(function(){
			$("#y_cpnList").css("display","none");
			$("#y_insertCpn").css("display","none");
			$("#y_pagingDiv").css("display","none");
			$(".y_insertDiv").fadeIn();
			$("#y_insertOkCpn").fadeIn();
		});
		//목록가기 버튼
		$("#y_goCpnList").click(function(){
			location.href="couponAdList";
		});
		//추가등록 버튼
		$("#y_plusInsertCpn").click(function(){
			var insertDiv = '<div class="y_insertDiv" style="display:block;">';
				insertDiv += '<div><span></span><button type="button" onclick="javascript:cpnRemove(this)" class="y_removeInsDiv">✕</button></div>';
				insertDiv += "<div><input type='text' name='salerate' placeholder='할인율' class='y_cpnsalerate'><br/>DISCOUNT</div>";
				insertDiv += '<ul>';
				insertDiv += '<li><input type="text" name="cpnname" placeholder="쿠폰명 입력"></li>'; 
				insertDiv += '<li><label for="cpnstart">기간 :</label><input type="text" name="cpnstart" class="y_cpnstart" placeholder="시작기간">~<input type="text" name="cpnend" class="y_cpnend" placeholder="끝나는 기간"></li>';
				insertDiv += '<li><label for="apply">적용품목 :</label>';
				insertDiv += '<select name="mainApply" class="y_cpnMainApply"><option value="" selected disabled hidden>대분류</option><c:forEach var="mCate" items="${maincate }"><option value="${mCate.mainno }">${mCate.mainname }</option></c:forEach></select>';
       			insertDiv += '<select name="apply" class="y_cpnSubApply"><option value="" selected disabled hidden>중분류</option></select>';
				insertDiv += '</ul></div>';
				
			$("#y_couponAdInsert").append(insertDiv);
		});
		// 대분류 선택시 중분류 데이터 끌고오는 이벤트
		$(document).on('change','.y_cpnMainApply' ,function() {
			var selectTag = $(this);
			var mainno = $(this).val();
			
			var changeItem;
			$.ajax({
				url : 'cpnSelectCate',
				dataType : 'json',
				type: "POST",
				data : {
					mainno : mainno
				}, success : function(result){
					var $result = $(result);
					var tag = "";
					$result.each(function(idx, vo) {
						tag += "<option value="+vo.subno+">"+vo.subname+"</option>";
					});
					$(selectTag).next('select').html(tag);
				}, error : function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		//시작기간 datepicker
		$(document).on('mousedown','.y_cpnstart',function(){
			$(".y_cpnstart").datepicker({
				changeMonth: true, 
			    changeYear: true,
			    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dateFormat: "yy-mm-dd",
			    onClose : function(selectedDate){
			    	// 시작일 datepicker가 닫히면 종료일 datepick는 시작일 이전 선택불가하게 설정
			    	$(".y_cpnend").datepicker("option", "minDate", selectedDate);
			    }
			});
		});
		//종료기간 datepicker
		$(document).on('mousedown','.y_cpnend',function(){
			$(".y_cpnend").datepicker({ 
				changeMonth: true, 
			    changeYear: true,
			    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dateFormat: "yy-mm-dd",
			    onClose : function(selectedDate){
			    	// 종료일 datepicker가 닫히면 시작일 datepick는 종료일 이후 선택불가하게 설정
			    	$(".y_cpnstart").datepicker("option", "maxDate", selectedDate);
			    }
			});
		});
		//등록완료 버튼
		$(document).on('click','#y_cpnInsertOk',function(){
			var divLength = $("#y_couponAdInsert>div").length;
			var bool = false;
			for(var i=0; i<divLength; i++){
				if($("#y_couponAdInsert>div").eq(i).find('input[name=salerate]').val()==null || $("#y_couponAdInsert>div").eq(i).find('input[name=salerate]').val()==""){
					alert((i+1)+"번째 쿠폰의 할인율을 입력하세요.")
					bool = false;
				}else if($("#y_couponAdInsert>div").eq(i).find('input[name=cpnname]').val()==null || $("#y_couponAdInsert>div").eq(i).find('input[name=cpnname]').val()==""){
					alert((i+1)+"번째 쿠폰의 쿠폰명을 입력하세요.")
					bool = false;
				}else if($("#y_couponAdInsert>div").eq(i).find('input[name=cpnstart]').val()==null || $("#y_couponAdInsert>div").eq(i).find('input[name=cpnstart]').val()==""){
					alert((i+1)+"번째 쿠폰의 시작기간을 입력하세요.")
					bool = false;
				}else if($("#y_couponAdInsert>div").eq(i).find('input[name=cpnend]').val()==null || $("#y_couponAdInsert>div").eq(i).find('input[name=cpnend]').val()==""){
					alert((i+1)+"번째 쿠폰의 종료기간을 입력하세요.")
					bool = false;
				}else if($("#y_couponAdInsert>div").eq(i).find('select[name=apply]').val()==null || $("#y_couponAdInsert>div").eq(i).find('select[name=apply]').val()==""){
					alert((i+1)+"번째 쿠폰의 적용품목을 선택하세요.")
					bool = false;
				}else{
					bool=true;
				}
			}
			if(bool){
				$.ajax({
					url : 'couponAdInsert',
					type : "POST",
					data : $("#y_couponAdInsert").serialize(),
					success : function(result){
						alert('등록이 완료되었습니다.');
						location.href="couponAdList";
					}, error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});		
			}
		});
		// 쿠폰등록 할인율 숫자만 입력받기
		$(document).on('keyup','.y_cpnsalerate',function(){
			var inputval = $(this).val();
			$(this).val(inputval.replace(/[^0-9]/gi, ''));
		});
		// 쿠폰 전체사제
		$("#y_cpnAllDel").click(function() {
			if(confirm("전체삭제 하시겠습니까?")){
				location.href="cpnAllDel";	
			}
		});
	});
	//추가등록 삭제
	function cpnRemove(tag){
		$(tag).parent().parent().remove();
	}
	//삭제
	function cpnAdDelete(cpnadno){
		if(confirm("삭제하시겠습니까?")){
			location.href="cpnAdDelete?cpnadno="+cpnadno;	
		}
	}
</script>
<body>
	<div id="y_adminCouponList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
        <div id="y_adminCouponList_rightcon" class="y_Adrightcon clearfix">
            <p id="pageTitle"><span>쿠폰 관리</span></p>
	            <div id="y_cpnList" class="clearfix">
		            <p class="clearfix"><button id="y_cpnAllDel" class="adminMainBtn">전체삭제</button></p>
		            <c:forEach var="data" items="${list }">
			            <div class="y_viewCoupon clearfix">
			                <div>
			                    <span></span>
			                </div>
			                <div>
			                    ${data.salerate }%<br/>
			                    DISCOUNT
			                </div>
			                <ul>
			                    <li class="wordcut">${data.cpnname }</li>
			                    <li>기간 : <b>${data.cpnstart } ~ ${data.cpnend }</b></li>
			                    <li>적용품목 : <b>${data.subname }</b></li>
			                    <li><button class="adminSubBtn">수정</button><a href="javascript:cpnAdDelete(${data.cpnadno })" class="adminSubBtn">삭제</a></li>
			                </ul>
			            </div>
			            <div class="y_inputCoupon">
			            	<form action="cpnAdEdit" class="y_cpnAdEditFrm" method="post" class="clearfix" autocomplete='off'>
			            		<div>
				                    <span></span>
				                </div>
				                <div>
				                    <input type="number" name="salerate" min="0" max="100" value="${data.salerate }"><br/>
				                    DISCOUNT
				                </div>
				                <ul>
				                    <li><input type="text" name="cpnname" maxlength="50" value="${data.cpnname }"></li>
				                    <li>기간 <input type="text" name="cpnstart" value="${data.cpnstart }" class="y_cpnstart" onkeypress="onlyNum()">~<input type="text" name="cpnend" class="y_cpnend" value="${data.cpnend }" onkeypress="onlyNum()" ></li>
				                    <li>적용품목 : 
		                    			<select name="Mainapply" class="y_cpnMainApply">
		                    				<option value="${data.mainno }" selected hidden>${data.mainname }</option>
		                    				<c:forEach var="mCate" items="${maincate }">
		                    					<option value="${mCate.mainno }">${mCate.mainname }</option>
		                    				</c:forEach>
		                    			</select>
		                    			<select name="apply" class="y_cpnSubApply">
		                    				<option value="${data.subno }" selected>${data.subname }</option>
		                    			</select>
				                    </li>
				                    <li><input type="submit" class="adminSubBtn" value="완료"></li>
				                </ul>
				                <input type="hidden" name="cpnadno" value="${data.cpnadno }">
			            	</form>
			            </div>
           			</c:forEach>
	            </div>
           <p id="y_insertCpn">
           		<button class="adminMainBtn">쿠폰등록</button>
           </p>
	        <div id="y_pagingDiv">
	            <ul class="adPaging" class="clearfix">
	            	<c:if test="${pageVO.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="couponAdList?pageNum=${pageVO.pageNum-1}">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="5">
	                	<c:if test="${p<=pageVO.totalPage }">
		                	<c:if test="${p==pageVO.pageNum }">
		                		<li style="border-bottom:3px solid rgb(191,43,53);"><a href="couponAdList?pageNum=${p}">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO.pageNum }">
		                		<li><a href="couponAdList?pageNum=${p}">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingAdLR_a" href="couponAdList?pageNum=${pageVO.pageNum+1}">＞</a></li>
	                </c:if>
	            </ul>
            </div>
            <div id="y_cpnInsertList">
	        	<form action="couponAdInsert" id="y_couponAdInsert" method="post" class="clearfix"autocomplete='off'>
		            <div class="y_insertDiv">
	            		<div>
		                    <span></span>
		                    <button type="button" onclick="javascript:cpnRemove(this);" class="y_removeInsDiv">✕</button>
		                </div>
		                <div>
		                    <input type="text" name="salerate" placeholder="할인율" maxlength="3" class="y_cpnsalerate"><br/>
		                    DISCOUNT
		                </div>
		                <ul>
		                    <li><input type="text" name="cpnname" placeholder="쿠폰명 입력" maxlength="50"></li>
		                    <li><label for="cpnstart">기간 :</label><input type="text" name="cpnstart" class="y_cpnstart" placeholder="시작기간">~<input type="text" name="cpnend" class="y_cpnend" placeholder="끝나는 기간"></li>
		                    <li>
		                    	<label for="apply">적용품목 :</label>
		                    	<select name="mainApply" class="y_cpnMainApply">
                   					<option value="" selected disabled hidden>대분류</option>
                    				<c:forEach var="mCate" items="${maincate }">
                    					<option value="${mCate.mainno }">${mCate.mainname }</option>
                    				</c:forEach>
	                   			</select>
	                   			<select name="apply" class="y_cpnSubApply">
	                   				<option value="" selected disabled hidden>중분류</option>
	                   			</select>
		                    </li>
		                </ul>
		            </div>
            	</form>
            </div>
            <p id="y_insertOkCpn" class="clearfix">
            	<button type="button" id="y_goCpnList" class="adminSubBtn">목록가기</button>
            	<button type="button" id="y_plusInsertCpn" class="adminSubBtn">추가등록</button>
            	<button type="submit" id="y_cpnInsertOk" class="adminMainBtn">등록완료</button>
            </p>
        </div>
    </div>
</body>
</html>