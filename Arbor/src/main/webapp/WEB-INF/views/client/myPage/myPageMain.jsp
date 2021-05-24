<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					if(vo.optinfo==null){
						tag += "<li class='wordcut'>" + vo.pname+"</li>"; 	//상품명(pname)	
					}else{
						tag += "<li class='wordcut'>" + vo.pname+"-"+vo.optinfo + "</li>"; 	//상품명(pname)
					}
					tag += "<li>" + vo.subprice+"원" +"</li>";	//가격(subprice)
					tag += "<li>" + vo.quantity +"</li>";	//수량(quantity)
					tag += "<li>" + vo.status +"</li>";		// 처리상태(status)
					$("#y_orderPopup_Wrap>div:nth-of-type(3) ul").html(tag);
					
					$("#y_orderPopup_Wrap>div:nth-of-type(4) ul li:nth-child(5)").text(comma(vo.usepoint)+"원");		//사용한 적립금(usepoint)	  
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
	//콤마찍기
	function comma(str) {
	    str = String(str);
	    var minus = str.substring(0, 1);
	 
	    str = str.replace(/[^\d]+/g, '');
	    str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

	     //음수일 경우
	    if(minus == "-") str = "-"+str;
	 
	    return str;
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
		$("#y_reviewWrtClsBtn").click(function(){
			$("#y_reviewWrite").css("display","none");
		})
		// reviewWrite 등록
		$("#y_reviewWriteFrm").submit(function(){
			if(!$(this).find('input[name=pno]').is(":checked")){
				alert('상품을 선택해주세요.')
				return false;
			}else if(!$(this).find('input[name=grade]').is(":checked")){
				alert('평점을 선택해주세요.')
				return false;
			}else if($(this).find('textarea').val().replace(/\s| /gi, "").length == 0){
				alert("후기를 작성해주세요.")
				return false;
			}
			return true;
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
	function myPagePopup(){
		var popupWidth = 900;
		var popupHeight = 500;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		window.open("myPagePopup", '배송준비','width=900px,height=500px,scollbars=no,'+"left="+popupX + ",top="+popupY);
	}
	function reviewWrite(orderno){
		$("#y_reviewWrite").css("display","block");
		var url = "reviewWrite";
		var params = "orderno="+orderno;
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				console.log($result);
				
				var tag = "";
				$result.each(function(idx, vo){
					
					//반복
					tag += "<li><p><img src='<%=request.getContextPath()%>/upload/" + vo.img1 + "'/></p>";
					tag += "<p class='wordcut'>"+vo.pname +"-"+vo.optinfo+"</p>";
					if(vo.usecoupon == "작성완료"){
						tag += "<p style='color:red'>리뷰가 작성된 상품입니다.</p>"
					}else{
						tag += "<p><input type='radio' name='pno' value="+vo.pno+"></p></li>";	
					}
					
					
					$("#y_reviewPnoList").html(tag);
				});
			}, error : function(){
				console.log("팝업 데이터 에러~!!");
			}
		});
	}
	
	/* 주문취소 */
	
	function cancelPay(orderno) {
		if(confirm("해당 주문을 취소하시겠습니까?")) {
			$.ajax({
				url : "cancelPay",
				data : "orderno="+orderno,
				type : "POST",
				success : function(result) {
					if(result>1) {
						alert("주문취소 신청이 완료되었습니다. 승인 후 환불처리됩니다.");
					} else {
						alert("주문취소 신청이 실패했습니다. 다시 시도해주시거나 고객센터로 문의바랍니다.");
					}
				}, error : function(e) {
					
				}
			});
		}
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
	                <li><fmt:formatNumber value="${data.totalprice }" /> 원</li>
	                <li class="clearfix">
	                	<c:if test="${data.status=='배송준비' }"><a href="javascript:myPagePopup()" class="status_ready">배송준비</a><a href="javascript:cancelPay(${data.orderno })" class="status_cashCancle">주문취소</a></c:if>
	                	<c:if test="${data.status=='배송완료' }"><a class="status_delivDone">배송완료</a><a href="javascript:reviewWrite(${data.orderno })" class="status_review">리뷰작성</a><a href="#" class="status_change">교환/환불</a></c:if>
	                	<c:if test="${data.status=='배송중' }"><a style="padding:5px 85px;">배송중입니다.</a></c:if>
	                	<c:if test="${data.status=='교환중' }"><a style="padding:5px 85px;">교환중입니다.</a></c:if>
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
      <div id="y_reviewWrite">
          <p class="cleafix"><button id="y_reviewWrtClsBtn">✕</button></p>
          <form id="y_reviewWriteFrm" action="reviewWriteOk" method="post">
              <ul>
                  <li><span class="colorRed">*</span> 구매목록<span class="y_reviewWriteSmallText">※ 상품별 하나의 후기만 작성 가능합니다.</span></li>
                  <li>
                      <ul id="y_reviewPnoList" class="clearfix">
                      	
                      </ul>
                  </li>
                  <li><span class="colorRed">*</span> 후기작성</li>
                  <li>
                      <textarea name="reviewcontent" cols="50" rows="10"></textarea>
                  </li>
                  <li><span class="colorRed">*</span> 평점</li>
                  <li>
                      <input type="radio" name="grade" value="1"><span class="gradestar">★</span><span class="elsestar">★★★★</span>
                      <input type="radio" name="grade" value="2"><span class="gradestar">★★</span><span class="elsestar">★★★</span>
                      <input type="radio" name="grade" value="3"><span class="gradestar">★★★</span><span class="elsestar">★★</span>
                      <input type="radio" name="grade" value="4"><span class="gradestar">★★★★</span><span class="elsestar">★</span>
                      <input type="radio" name="grade" value="5"><span class="gradestar">★★★★★</span>
                  </li>
              </ul>
              <input type="submit" class="clientMainBtn" value="등록하기">
          </form>
      </div>
</div>