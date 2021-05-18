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
		// 완료버튼 이벤트
		$(".y_inputCoupon>form").submit(function(){
			$(this).parent().css("display","none")
			$(".y_viewCoupon>ul li:last-child button").attr("disabled", false)
			$(".y_viewCoupon>ul li:last-child button").removeClass("y_disabledBtn");
			$(".y_viewCoupon>ul li:last-child button").addClass("adminSubBtn");
			$(this).parent().prev().css("display","none")
		});
		//쿠폰 등록
		$('#y_insertCpn').click(function(){
			$("#y_cpnList").css("display","none");
			$("#y_insertCpn").css("display","none");
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
				insertDiv += "<div><input type='text' name='salerate' placeholder='할인율'  onkeypress='javascript:checkInputNum();'><br/>DISCOUNT</div>";
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
				data : 'json',
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
			$.ajax({
				url : 'couponAdInsert',
				type : "POST",
				data : $("#y_couponAdInsert").serialize(),
				success : function(result){
					alert('ajax성공')
				}, error : function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	// 숫자만 입력
	function checkInputNum(){
		if ((event.keyCode < 48) || (event.keyCode > 57)){
		    event.returnValue = false;
		}
  	}
	//추가등록 삭제
	function cpnRemove(tag){
		$(tag).parent().parent().remove();
	}
</script>
<body>
	<div id="y_adminCouponList_Wrap" class="w1400_container clearfix">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
        <div id="y_adminCouponList_rightcon" class="y_Adrightcon">
            <h2>쿠폰 관리</h2>
            <div id="y_cpnList" class="clearfix">
	            <p class="clearfix"><button class="adminMainBtn">전체삭제</button></p>
	            <div class="y_viewCoupon clearfix">
	                <div>
	                    <span></span>
	                </div>
	                <div>
	                    20%<br/>
	                    DISCOUNT
	                </div>
	                <ul>
	                    <li>행사쿠폰</li>
	                    <li>기간 : <b>2020/12/12 ~ 2020/12/12</b></li>
	                    <li>적용품목 : <b>소파</b></li>
	                    <li><button class="adminSubBtn">수정</button><a href="#" class="adminSubBtn">삭제</a></li>
	                </ul>
	            </div>
	            <div class="y_inputCoupon">
	            	<form action="">
	            		<div>
		                    <span></span>
		                </div>
		                <div>
		                    <input type="number" value="20"><br/>
		                    DISCOUNT
		                </div>
		                <ul>
		                    <li><input type="text" value="행사쿠폰"></li>
		                    <li>기간 <input type="text" value="2020/12/12" onkeypress="onlyNum()">~<input type="text" value="2020/12/12" onkeypress="onlyNum()"></b></li>
		                    <li>적용품목 : 
                    			<select name="apply" class="y_cpnMainApply">
                    				<option value="" selected disabled hidden>대분류</option>
                    				<c:forEach var="mCate" items="${maincate }">
                    					<option value="${mCate.mainno }">${mCate.mainname }</option>
                    				</c:forEach>
                    			</select>
                    			<select name="y_cpnSubApply" class="y_cpnSubApply">
                    				<option value="none" selected disabled hidden>중분류</option>
                    			</select>
		                    </li>
		                    <li><input type="submit" class="adminSubBtn" value="완료"></li>
		                </ul>
	            	</form>
	            </div>
	            <div class="y_viewCoupon clearfix">
	                <div>
	                    <span></span>
	                </div>
	                <div>
	                    80%<br/>
	                    DISCOUNT
	                </div>
	                <ul>
	                    <li>사장님이 미첬어요 쿠폰</li>
	                    <li>기간 : <b>2020/12/12 ~ 2020/12/12</b></li>
	                    <li>적용품목 : <b>소파</b></li>
	                    <li><button class="adminSubBtn">수정</button><a href="#" class="adminSubBtn">삭제</a></li>
	                </ul>
	            </div>
	            <div class="y_inputCoupon">
	            	<form action="">
	            		<div>
		                    <span></span>
		                </div>
		                <div>
		                    <input type="text" value="20"><br/>
		                    DISCOUNT
		                </div>
		                <ul>
		                    <li><input type="text" value="행사쿠폰"></li>
		                    <li>기간 <input type="text" value="2020/12/12">~<input type="text" value="2020/12/12"></b></li>
		                    <li>적용품목 : <input type="text" value="소파"></li>
		                    <li><input type="submit" class="adminSubBtn" value="완료"></li>
		                </ul>
	            	</form>
	            </div>
            </div>
            <p id="y_insertCpn">
            	<button class="adminMainBtn">쿠폰등록</button>
            </p>
            <div id="y_cpnInsertList">
	        	<form action="couponAdInsert" id="y_couponAdInsert" method="post" class="clearfix">
		            <div class="y_insertDiv">
	            		<div>
		                    <span></span>
		                    <button type="button" onclick="javascript:cpnRemove(this);" class="y_removeInsDiv">✕</button>
		                </div>
		                <div>
		                    <input type="text" name="salerate" placeholder="할인율" onkeypress="javascript:checkInputNum();"><br/>
		                    DISCOUNT
		                </div>
		                <ul>
		                    <li><input type="text" name="cpnname" placeholder="쿠폰명 입력"></li>
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