<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	var printno = 0; //orderno 받아오기
	function subPopupList(orderno){//상세 팝업
		console.log(orderno);
		printno = orderno;
		var url = "orderPopup";
		var params = "orderno="+orderno;
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				var tag = "<li>상품정보</li><li>가격</li><li>수량</li><li>처리상태</li>";
				$result.each(function(idx, vo){
					$("#y_orderPopup_Wrap>p").text(vo.arr + "님의 " + vo.orderdate +" 주문내역")
					$("#y_orderPopup_Wrap>div:first-of-type ul li:nth-child(2)").text(vo.orderno);					//주문번호(orderno)
					$("#y_orderPopup_Wrap>div:first-of-type ul li:nth-child(4)").text(vo.orderdate);				//주문일자(orderdate)
					$("#y_orderPopup_Wrap>div:first-of-type ul li:nth-child(6)").text(vo.arr);						//주문자(arr) 
					$("#y_orderPopup_Wrap>div:first-of-type ul li:nth-child(8)").text('입금완료');						//주문서 입금현황
					
					$("#y_orderPopup_Wrap>div:nth-of-type(2) ul:nth-of-type(1) li:nth-child(2)").text(vo.arr);			//수취인(arr)
					$("#y_orderPopup_Wrap>div:nth-of-type(2) ul:nth-of-type(1) li:nth-child(4)").text(vo.arrtel);		//연락처(arrtel)
					$("#y_orderPopup_Wrap>div:nth-of-type(2) ul:nth-of-type(2) li:nth-child(2)").text(vo.arraddr + " " + vo.arrdetailaddr);		//주소(arraddr + arrdetailaddr)
					$("#y_orderPopup_Wrap>div:nth-of-type(2) ul:nth-of-type(2) li:nth-child(4)").text(vo.request);		//배송메세지(request)
					
					//반복
					tag += "<li>" + vo.pname + "</li>"; 	//상품명(pname)
					tag += "<li>" + vo.subprice+"원" +"</li>";	//가격(subprice)
					tag += "<li>" + vo.quantity +"</li>";	//수량(quantity)
					tag += "<li>" + vo.status +"</li>";		// 처리상태(status)
					$("#y_orderPopup_Wrap>div:nth-of-type(3) ul").html(tag);
					
					$("#y_orderPopup_Wrap>div:nth-of-type(4) ul li:nth-child(5)").text(vo.usepoint+"원");		//사용한 적립금(usepoint)	  
					//세부내역 (값을 끌어올게 없음)
					$("#y_orderPopup_Wrap>div:nth-of-type(4) ul li:nth-child(8)").text(vo.couponprice+"원");		//사용한 쿠폰금액(필드추가)  
					$("#y_orderPopup_Wrap>div:nth-of-type(4) ul li:nth-child(9)").text(vo.usecoupon);		//쿠폰명(usecoupon)
					$("#y_orderPopup_Wrap>div:nth-of-type(4) ul li:nth-child(11)").text(vo.totalprice+"원");		//결제금액(totalprice) 	  
					//카드사명 (값을 끌어올게 없음)
					
				});
			}, error : function(){
				console.log("팝업 데이터 에러~!!");
			}
		});
	}
	function printPopup(){//프린트 팝업
		console.log(printno);
		var url = "orderPopup";
		var params = "orderno="+printno;
		var pnameHap = "";
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				$result.each(function(idx, vo){
					$("#y_printPopup_Wrap>div:nth-of-type(2) ul li:nth-child(2)").text(vo.orderno);
					$("#y_printPopup_Wrap>div:nth-of-type(2) ul li:nth-child(4)").text(vo.orderdate);
					pnameHap += vo.pname +"/";
					$("#y_printPopup_Wrap>div:nth-of-type(2) ul li:nth-child(6)").text(pnameHap);
					$("#y_printPopup_Wrap>div:nth-of-type(2) ul li:nth-child(8)").text(vo.totalprice+"원");
					$("#y_printPopup_Wrap>div:nth-of-type(2) ul li:nth-child(12)").text(vo.arr);
				});
			}, error : function(){
				console.log("출력팝업 데이터 에러~!!");
			}
		});
	}
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li").length;
		$(".paging").css({
			"width" : liCnt*35+"px",
			"margin" : "30px auto"
		});
		
		//팝업 닫기버튼 기능 구현
		$(".subPopCloseBtn").click(function(){
			$("#y_printPopup_Wrap").css({
				"display":"none"
			});
		});
		$("#y_popupCloseBtn").click(function(){
			$("#y_orderPopup_Wrap").css({
				"display":"none"
			});
			$("#y_printPopup_Wrap").css({
				"display":"none"
			});
		});
		$(".y_pnameList").click(function(){
			$("#y_orderPopup_Wrap").css({
				"display":"block"
			});
		});
		$("#y_popupPrintBtn").click(function(){
			$("#y_printPopup_Wrap").css({
				"display":"block"
			});
		});
		$("#y_printPopup_Wrap>div:nth-of-type(4) button").click(function(){
			$("#y_printPopup_Wrap").css({
				"display":"none"
			});
		})
		$("#y_leftMenu>ul>li:nth-child(2) a").css({
			"font-weight":"bold",
			"background" :"rgb(94, 94, 94)",
			"color":"#fff"
		});
	});
	function printWindow() {//프린트 호출
		var subpopup = document.getElementById("y_orderPopup_Wrap");
		var printpopup = document.getElementById("y_printPopup_Wrap");
		var initBody;
		
		subpopup.style.display="none";
		printpopup.classList.remove("boxshadow");
		window.onbeforeprint = function(){
			initBody = document.body.innerHTML;
			printpopup.style.left="20%";
			document.body.innerHTML = document.getElementById("y_printarea").innerHTML;
		};
		window.onafterprint = function(){
			document.body.innerHTML = initBody;
			printpopup.style.display="none";
			window.location.reload();
		};
		
		window.print();
		return false;
	}
</script>
<div id="y_myPageMain_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_myPage_rightCon">
        <div>
        	<h2>구매내역</h2>
            <ul class="clearfix">
                <li>주문일자</li>
                <li>상품명</li>
                <li>결제금액</li>
                <li>상태</li>
                
                <c:forEach var="data" items="${list }">
	                <li>${data.orderdate }</li>
	                <li class="wordcut"><a class="y_pnameList" id="y_pnameList" href="javascript:subPopupList(${data.orderno })">${data.pname }</a></li>
	                <li>${data.totalprice }</li>
	                <li>
	                    <a href="#" class="statusBtn">배송준비</a> 
	                    <a href="#" class="statusBtn">배송완료</a> 
	                    <a href="#" class="statusBtn">주문취소</a> 
	                    <a href="#" class="statusBtn">리뷰작성</a> 
	                    <a href="#" class="statusBtn">교환/환불</a> 
	                    <a href="#">배송중입니다.</a> 
	                </li>
                </c:forEach>
            </ul>
        </div>
        <ul class="paging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li><a class="pagingLR_a"  href="purchaseList?pageNum=${pageVO.pageNum-1}">＜</a></li>
              </c:if>
              <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
               	<c:if test="${p==pageVO.pageNum }">
               		<li style="border-bottom:3px solid rgb(93, 121, 115);"><a href="purchaseList?pageNum=${p}">${p }</a></li>
               	</c:if>
               	<c:if test="${p!=pageVO.pageNum }">
               		<li><a href="purchaseList?pageNum=${p}">${p }</a></li>
               	</c:if>
              	</c:if>
              </c:forEach>
              <c:if test="${pageVO.pageNum<pageVO.totalPage }">
              	<li><a class="pagingLR_a"  href="purchaseList?pageNum=${pageVO.pageNum+1}">＞</a></li>
              </c:if>
          </ul>
    </div>
   <div id="y_orderPopup_Wrap" class="boxshadow">
           <p><b>-</b></p>
           <div class="w600_center">
               <p><b>주문자정보</b></p>
               <ul class="clearfix">
                   <li>주문번호</li>
                   <li>-</li>
                   <li>주문일자</li>
                   <li>-</li>
                   <li>주문자</li>
                   <li>-</li>
                   <li>주문서 입금현황</li>
                   <li>-</li>
               </ul>
           </div>
           <div class="w600_center">
               <p><b>배송지정보</b></p>
               <ul class="clearfix">
                   <li>수취인</li>
                   <li>-</li>
                   <li>연락처</li>
                   <li>-</li>
               </ul>
               <ul class="clearfix">
                   <li>주소</li>
                   <li>-</li>
                   <li>배송메세지</li>
                   <li>-</li>
               </ul>
           </div>
           <div class="w600_center">
               <p><b>주문상품</b></p>
               <ul class="clearfix">
                   
               </ul>
           </div>
           <div class="w600_center">
               <p class="clearfix"><b>결제정보</b> <a id="y_popupPrintBtn" href="javascript:printPopup()" class="clientSubBtn">영수증출력</a></p>
               <ul class="clearfix">
                   <li>결제방법</li>
                   <li>결제금액</li>
                   <li>세부내역</li>
                   <li>사용한 적립금</li>
                   <li>-</li>
                   <li>-</li>
                   <li>사용한 쿠폰</li>
                   <li>-</li>
                   <li class="wordcut">-</li>
                   <li>카드</li>
                   <li>-</li>
                   <li>-</li>
               </ul>
           </div>
           <button id="y_popupCloseBtn" class="clientMainBtn">닫기</button>
       </div>
       <div id="y_printarea">	
	       <div id="y_printPopup_Wrap" class="boxshadow">
	           <div>
	              <p><button class="subPopCloseBtn">✕</button></p>
	           </div>
	           <h3>구매영수증</h3>
	           <div>
	               <ul class="clearfix">
	                   <li>주문번호<br/><span>(ORDER NO.)</span></li>
	                   <li>-</li>
	                   <li>거래일시<br/><span>(TRANS DATE)</span></li>
	                   <li>-</li>
	                   <li>상품명<br/><span>(DESCRIPTION)</span></li>
	                   <li class="wordcut">-</li>
	                   <li>합계<br/><span>(TOTAL)</span></li>
	                   <li>-</li>
	                   <li>회사명<br/><span>(COMPANY NAME)</span></li>
	                   <li><img src="<%=request.getContextPath()%>/img/logo.png" alt="logoImg"></li>
	                   <li>서명<br/><span>(SIGNATURE)</span></li>
	                   <li>-</li>
	               </ul>
	               <p>구매 영수증은 세금계산서 등 세무상 증빙서류로 활용할 수 없으며, 거래내역 및 거래금액을 확인하는 용도로만 사용 가능합니다.</p>
	           </div>
	           <div>
	              <div class="clearfix">
	                   <p><img src="<%=request.getContextPath()%>/img/sublogo.jpg" alt="sublogoImg"></p>
	                   <ul>
	                       <li>Arbor</li>
	                       <li>Company : ㈜arbor</li>
	                       <li>Ceo : ㅇㅇㅇ</li>
	                       <li>Cpo : 아르보르(info@arbor.co.kr)</li>
	                       <li>Address : ㅇㅇ구 ㅇㅇ동</li>
	                   </ul>
	               </div>
	           </div>
	           <div class="clearfix">
	               <a href="javascript:printWindow()" class="clientMainBtn">인쇄</a>
	               <button class="clientSubBtn">확인</button>
	           </div>
	       </div>
      </div>
</div>