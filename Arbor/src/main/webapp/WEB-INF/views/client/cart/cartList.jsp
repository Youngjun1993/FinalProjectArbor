<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	$(function() {
		var pTag = $(".y_cartCnt");
		var pnoGet = [];
		for(var i=0; i<pTag.length; i++){
			pnoGet[i] = $(pTag).eq(i).children('span').children('input[name=pno]').val();
		}
		var finalpno = [];
		$.each(pnoGet,function(i,value){
			if(finalpno.indexOf(value) == -1) finalpno.push(value);
		});
		$.ajax({
			url : "cartStart",
			dataType : 'json',
			type: "POST",
			data : { 
				finalpno : finalpno
			},success : function(result){
				var $result = $(result);
				var optCnt = 0;
				var point = 0;
				var delivSum = 0;
				var price = 0;
				var totalPrice = 0;
				$result.each(function(idx, data) {
					$(".y_optionList").eq(idx).children().children("li:nth-child(3)").text((data.point).toLocaleString()+"원");
					$(".y_optionList").eq(idx).children().children("li:nth-child(4)").text(data.optquantity);
					$(".y_optionList").eq(idx).children().children("li:nth-child(5)").text((data.optsumprice).toLocaleString()+"원");
					
					optCnt += data.optquantity;
					price += data.optsumprice;
					point += data.point;
				});
				delivSum = 30000*optCnt;
				totalPrice = price+delivSum;
				
				$("#y_cartTotal>ul:nth-child(2)>li:nth-child(1) b").text(optCnt);
				$("#y_cartTotal>ul:nth-child(2)>li:nth-child(2) b").text(price.toLocaleString());
				$("#y_cartTotal>ul:nth-child(2)>li:nth-child(3) b").text(delivSum.toLocaleString());
				$("#y_cartTotal>ul:nth-child(2)>li:nth-child(4) b").text(point.toLocaleString());
				$("#y_cartTotal>ul:nth-child(2)>li:last-child span").text(totalPrice.toLocaleString());
				
			}, error : function(){
				console.log("장바구니 시작 에러~")
			}
		});
		// 옵션 - 버튼
		$(".y_cartOptMinus").click(function(){
			var cartno = $(this).next().val();
			var pno = $(this).next().next().val();
			var price = $(this).parent().parent().children(".getPrice").val();
			var tag = $(this);
			$.ajax({
				url : "cartUpdate",
				dataType : 'json',
				type: "POST",
				data : { 
					cartno : cartno,
					pno : pno,
					temp : 'minus'
				},success : function(result){
					$(tag).parent().children("b").text(result.quantity); // 옵션갯수
					$(tag).parent().parent().children('span').eq(0).text((price*result.quantity).toLocaleString()+"원") // 옵션별 가격
					$(tag).parent().parent().parent().children('ul').children('li').eq(2).text((result.point).toLocaleString()+"원") // 적립금
					$(tag).parent().parent().parent().children('ul').children('li').eq(3).text(result.optquantity+"개") // 총수량
					$(tag).parent().parent().parent().children('ul').children('li').eq(4).text((result.optsumprice).toLocaleString()+"원") // 총수량
					
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(1) b").text(result.totalquantity);
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(2) b").text((result.totalprice).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(3) b").text((result.totaldeliv).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(4) b").text((result.totalpoint).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:last-child span").text((result.totalprice+result.totaldeliv).toLocaleString());
					
				}, error : function(){
					console.log('장바구니 ajax 업뎃 실패~');
				}
			});
		});
		// 옵션 + 버튼
		$(".y_cartOptPlus").click(function(){
			var cartno = $(this).prev().prev().prev().val();
			var pno = $(this).prev().prev().val();
			var price = $(this).parent().parent().children(".getPrice").val();
			var tag = $(this);
			$.ajax({
				url : "cartUpdate",
				dataType : 'json',
				type: "POST",
				data : { 
					cartno : cartno,
					pno : pno,
					temp : 'plus'
				},success : function(result){
					$(tag).parent().children("b").text(result.quantity);
					$(tag).parent().parent().children('span').eq(0).text((price*result.quantity).toLocaleString()+"원") // 옵션별 가격
					$(tag).parent().parent().parent().children('ul').children('li').eq(2).text((result.point).toLocaleString()+"원") // 적립금
					$(tag).parent().parent().parent().children('ul').children('li').eq(3).text(result.optquantity+"개") // 총수량
					$(tag).parent().parent().parent().children('ul').children('li').eq(4).text((result.optsumprice).toLocaleString()+"원") // 총수량
					
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(1) b").text(result.totalquantity);
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(2) b").text((result.totalprice).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(3) b").text((result.totaldeliv).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:nth-child(4) b").text((result.totalpoint).toLocaleString());
					$("#y_cartTotal>ul:nth-child(2)>li:last-child span").text((result.totalprice+result.totaldeliv).toLocaleString());
				}, error : function(){
					console.log('장바구니 ajax 업뎃 실패~');
				}
			});
		});
		// 옵션 삭제 버튼
		$(".y_cartDelBtn").click(function(){
			var tag = $(this);
			var cartno = $(this).parent().children().children('input[name=cartno]').val();
			var pno = $(this).parent().children().children('input[name=pno]').val();
			var price = $(this).parent().parent().children(".getPrice").val();
			var pname = $(this).parent().children("label").text();
			
			if(confirm(pname+"\n 옵션을 삭제하시겠습니까?")){
				$.ajax({
					url : "cartUpdate",
					dataType : 'json',
					type: "POST",
					data : { 
						cartno : cartno,
						pno : pno,
						temp : 'del'
					},success : function(result){
						$(tag).parent().css("display","none");
						$(tag).parent().parent().children('ul').children('li').eq(2).text((result.point).toLocaleString()+"원"); // 적립금
						$(tag).parent().parent().children('ul').children('li').eq(3).text(result.optquantity+"개"); // 총수량
						$(tag).parent().parent().children('ul').children('li').eq(4).text((result.optsumprice).toLocaleString()+"원"); // 총수량
						
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(1) b").text(result.totalquantity);
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(2) b").text((result.totalprice).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(3) b").text((result.totaldeliv).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(4) b").text((result.totalpoint).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:last-child span").text((result.totalprice+result.totaldeliv).toLocaleString());
					},error : function(){
						console.log('장바구니 옵션삭제 에러')
					}
				});
			}
		});
		// 장바구니 메인 삭제버튼
		$(".cartMainDelBtn").click(function(){
			var tag = $(this);
			var pname = $(this).parent().prev().prev().prev().prev().text();
			var pno = $(this).parent().parent().parent().children().children('input[name=pno]').val();
			console.log(pno);
			if(confirm(pname.trim()+"\n상품을 삭제하시겠습니까?")){
				$.ajax({
					url : "cartUpdate",
					dataType : 'json',
					type: "POST",
					data : { 
						cartno : cartno,
						pno : pno,
						temp : 'maindel'
					},success : function(result){
						$(tag).parent().parent().parent().css("display","none");
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(1) b").text(result.totalquantity);
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(2) b").text((result.totalprice).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(3) b").text((result.totaldeliv).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:nth-child(4) b").text((result.totalpoint).toLocaleString());
						$("#y_cartTotal>ul:nth-child(2)>li:last-child span").text((result.totalprice+result.totaldeliv).toLocaleString());
					},error : function(){
						console.log('장바구니 메인 삭제버튼 에러');
					}
				});	
			}
		});
	});
</script>
<div id="y_cart_wrap" class="w1400_container">
    <div>
        <h1>장바구니</h1>
        <div>
            <ul class="clearfix">
                <li><i class="fas fa-cart-arrow-down fa-3x"></i></li>
                <li></li>
                <li><i class="far fa-credit-card fa-3x"></i></li>
                <li></li>
                <li><i class="far fa-check-square fa-3x"></i></li>
            </ul>
            <ul class="clearfix">
                <li>장바구니</li>
                <li>주문/결제</li>
                <li>주문완료</li>
            </ul>
        </div>
    </div>
    <div>
        <ul class="clearfix">
            <li><input type="checkbox" id="y_cartAllChck" name="y_cartAllChck"></li>
            <li>상품정보</li>
            <li>적립예정 금액</li>
            <li>총수량</li>
            <li>결제금액</li>
            <li>선택</li>
        </ul>
        <c:forEach var="cartData" items="${list }">
	        <div class="y_optionList"><!--테이블 내용-->
	            <ul class="clearfix">
	                <li>
	                    <input type="checkbox" class="y_cartChck" name="y_cartChck">
	                </li>
	                <li class="clearfix">
	                    <img src="argian.jpg" alt="">
	                    <span>${cartData.pname }</span>
	                </li>
	                <li>-</li>
	                <li>-</li>
	                <li>-</li>
	                <li>
	                    <button class="clientMainBtn">바로구매</button><br/>
	                    <button class="clientSubBtn cartMainDelBtn">삭제</button>
	                </li>
	            </ul>
	            <!--옵션-->
	            <c:forEach var="cartOptData" items="${optList }" varStatus="status">
	            	<c:if test="${cartData.pno eq cartOptData.pno }">
			            <c:if test="${cartOptData.optionvalue == null }">
				            <p class="clearfix y_cartCnt">
				                옵션이 없는 상품입니다.
				                <input type="hidden" class="getPrice" name="price" value="${cartOptData.price }">
				                <span style="margin-right:50px;"><fmt:formatNumber value="${cartOptData.price*cartOptData.quantity }"/> 원</span> 
				                <span><button class="y_cartOptMinus">-</button><input type="hidden" name="cartno" value="${cartOptData.cartno }"><input type="hidden" name="pno" value="${cartOptData.pno }"> <b>${cartOptData.quantity }</b> <button class="y_cartOptPlus">+</button></span>
				            </p>
			            </c:if>
			            <c:if test="${cartOptData.optionvalue != null }">
				            <p class="clearfix y_cartCnt">
				                <button class="y_cartDelBtn">✕</button>
				                <small style="color:#aaa; float:left; margin-left:0; font-weight:normal;background: none;border:none;line-height: 25px; margin-right:10px;">선택된 옵션 ) </small><label> ${cartOptData.optionvalue }</label>
				                <input type="hidden" class="getPrice" name="price" value="${cartOptData.price }">
				                <span><fmt:formatNumber value="${cartOptData.price*cartOptData.quantity }"/> 원</span> 
				                <span><button class="y_cartOptMinus">-</button><input type="hidden" name="cartno" value="${cartOptData.cartno }"><input type="hidden" name="pno" value="${cartOptData.pno }"> <b>${cartOptData.quantity }</b> <button class="y_cartOptPlus">+</button></span>
				            </p>
			            </c:if>
		            </c:if>
	            </c:forEach>
	        </div>
        </c:forEach>
        <button class="clientSubBtn">선택삭제</button>
    </div>
    <div class="clearfix">
        <div>
            <h2>총 주문금액</h2>
        </div>
        <div id="y_cartTotal" class="clearfix">
            <ul>
                <li>주문상품 수</li>
                <li>주문금액</li>
                <li>
                	배송비<br/>
                	<span class="y_smallText">* 배송비는 개별적용입니다.</span>
                </li>
                <li>
                    적립금<br/>
                    <span class="y_smallText">* 다음주문부터 사용 가능합니다.</span>
                </li>
                <li>최종 결제금액</li>
            </ul>
            <ul>
                <li><b>-</b> 개</li>
                <li><b>-</b> 원</li>
                <li><b>-</b> 원</li>
                <li>
                    <b>-</b> 원<br/>　
                </li>
                <li><span class="y_totalPrice">-</span> 원</li>
            </ul>
        </div>
    </div>
    <div>
        <span class="clearfix">
            <a href="#" class="clientSubBtn">쇼핑목록 가기</a>
            <a href="#" class="clientSubBtn">선택상품구매</a>
            <a href="#" class="clientMainBtn">전체상품구매</a>
        </span>
    </div>
</div>