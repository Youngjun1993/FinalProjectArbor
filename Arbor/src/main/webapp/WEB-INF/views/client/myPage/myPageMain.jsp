<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $("#qnaPaging>li").length;
		$("#qnaPaging").css({
			"width" : liCnt*30+"px",
			"margin" : "30px auto"
		});
		
		//팝업 닫기버튼 기능 구현
		$(".subPopCloseBtn").click(function(){
			$("#y_printPopup_Wrap").css({
				"display":"none"
			})
		});
		$("#y_popupCloseBtn").click(function(){
			$("#y_orderPopup_Wrap").css({
				"display":"none"
			})
		});
		$(".y_pnameList").click(function(){
			$("#y_orderPopup_Wrap").css({
				"display":"block"
			});
			var url = "orderPopup";
			$.ajax({
				url : url,
				success : function(result){
					var $result = $(result);
					$result.each(idx, vo){
						//주문번호(orderno) //주문일자(orderdate)
						//주문자(arr) //주문서 입금현황
						
						//수취인	//연락처
						//주소
						//배송메세지
						
						//상품정보 //가격 //수량 // 처리상태
						
						//사용한 적립금	  //세부내역
						//사용한 쿠폰금액  //쿠폰명
						//결제금액 	  //카드사명
						$("li").append(vo.pname);
					}, error : function(){
						console.log("팝업 데이터 에러~!!");
					}
				}
			});
		});
	});
</script>
<div id="y_myPageMain_wrap" class="clearfix w1400_container">
    <div id="y_leftMenu">
        <ul>
            <li class="title_fs25">My Page</li>
            <li><a href="#">구매내역</a></li>
            <li><a href="#">회원정보수정</a></li>
            <li><a href="#">리뷰관리</a></li>
            <li><a href="#">1:1문의</a></li>
            <li><a href="#">쿠폰내역</a></li>
            <li><a href="#">적립금내역</a></li>
            <li><a href="#">회원탈퇴</a></li>
        </ul>
    </div>
    <div id="y_myPage_rightCon">
        <div>
            <ul class="clearfix">
                <li>ㅇㅇㅇㅇ님 환영합니다.</li>
                <li>
                    <span><i class="fas fa-gem fa-3x"></i></span>
                    <span>적립금<br/>
                    <a href="#" class="ftBold25_blue">0</a>원</span>
                </li>
                <li>
                    <span><i class="fas fa-tag fa-3x"></i></span>
                    <span>쿠폰<br/>
                    <a href="#" class="ftBold25_blue">0</a>개</span>
                </li>
                <li>
                    <span><i class="fas fa-edit fa-3x"></i></span>
                    <span>리뷰<br/>
                    <a href="#" class="ftBold25_blue">0</a>건</span>
                </li>
            </ul>
        </div>
        <div>
            <ul class="clearfix">
                <li>주문일자</li>
                <li>상품명</li>
                <li>결제금액</li>
                <li>상태</li>
                
                <c:forEach var="data" items="${list }">
	                <li>${data.orderdate }</li>
	                <li class="wordcut"><a class="y_pnameList" id="y_pnameList" href="#">${data.pname }</a></li>
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
        <ul id="qnaPaging" class="clearfix">
          	<c:if test="${pageVO.pageNum>1 }">
              	<li><a href="qnaList?pageNum=${pageVO.pageNum-1}">이전</a></li>
              </c:if>
              <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
              	<c:if test="${p<=pageVO.totalPage }">
               	<c:if test="${p==pageVO.pageNum }">
               		<li><a href="qnaList?pageNum=${p}">${p }</a></li>
               	</c:if>
               	<c:if test="${p!=pageVO.pageNum }">
               		<li><a href="qnaList?pageNum=${p}">${p }</a></li>
               	</c:if>
              	</c:if>
              </c:forEach>
              <c:if test="${pageVO.pageNum<pageVO.totalPage }">
              	<li><a href="qnaList?pageNum=${pageVO.pageNum+1}">다음</a></li>
              </c:if>
          </ul>
    </div>
    <div id="y_orderPopup_Wrap">
            <p>ㅇㅇㅇ님의 0000-00-00 주문내역</p>
            <div class="w600_center">
                <p>주문자정보</p>
                <ul class="clearfix">
                    <li>주문번호</li>
                    <li>2020202020-2020202020</li>
                    <li>주문일자</li>
                    <li>0000-00-00</li>
                    <li>주문자</li>
                    <li>ㅇㅇㅇ</li>
                    <li>주문서 입금현황</li>
                    <li>입금완료</li>
                </ul>
            </div>
            <div class="w600_center">
                <p>배송지정보</p>
                <ul class="clearfix">
                    <li>수취인</li>
                    <li>ㅇㅇㅇ</li>
                    <li>연락처</li>
                    <li>010-0000-0000</li>
                </ul>
                <ul class="clearfix">
                    <li>주소</li>
                    <li>000-000 ㅇㅇ도 ㅇㅇ시 ㅇㅇ구 ㅇㅇ동</li>
                    <li>배송메세지</li>
                    <li>부재시 문 앞에 놓아주세요</li>
                </ul>
            </div>
            <div class="w600_center">
                <p>주문상품</p>
                <ul class="clearfix">
                    <li>상품정보</li>
                    <li>가격</li>
                    <li>수량</li>
                    <li>처리상태</li>
                    <li>이미지 + ${popupList.pname }</li>
                    <li>159,000원</li>
                    <li>1</li>
                    <li>배송완료</li>
                </ul>
            </div>
            <div class="w600_center">
                <p class="clearfix">결제정보 <a id="y_popupPrintBtn" href="#">영수증출력</a></p>
                <ul class="clearfix">
                    <li>결제방법</li>
                    <li>결제금액</li>
                    <li>세부내역</li>
                    <li>사용한 적립금</li>
                    <li>　</li>
                    <li>　</li>
                    <li>사용한 쿠폰</li>
                    <li>5,000원</li>
                    <li>배송료 할인 쿠폰</li>
                    <li>카드</li>
                    <li>154,000원</li>
                    <li>현대카드 일시불</li>
                </ul>
            </div>
            <a id="y_popupCloseBtn" href="#">닫기</a>
        </div>
        <div id="y_printPopup_Wrap">
            <div>
               <p><a href="#" class="subPopCloseBtn">✕</a></p>
            </div>
            <h3>구매영수증</h3>
            <div>
                <ul class="clearfix">
                    <li>주문번호<br/><span>(ORDER NO.)</span></li>
                    <li>123141241241412</li>
                    <li>거래일시<br/><span>(TRANS DATE)</span></li>
                    <li>2020.02.02</li>
                    <li>상품명<br/><span>(DESCRIPTION)</span></li>
                    <li>ㅇㅇㅇㅇㅇㅇ상품</li>
                    <li>합계<br/><span>(TOTAL)</span></li>
                    <li>149,500원</li>
                    <li>회사명<br/><span>(COMPANY NAME)</span></li>
                    <li><img src="<%=request.getContextPath()%>/img/logo.png" alt="logoImg"></li>
                    <li>서명<br/><span>(SIGNATURE)</span></li>
                    <li>고객명 데이터</li>
                </ul>
                <p>구매 영수증은 세금계산서 등 세무상 증빙서류로 활용할 수 없으며, 거래내역 및 거래금액을 확인하는 용도로만 사용 가능합니다.</p>
            </div>
            <div>
               <div class="clearfix">
                    <p><img src="<%=request.getContextPath()%>/img/subLogo.jpg" alt="sublogoImg"></p>
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
                <a href="#">인쇄</a>
                <a href="#" class="subPopCloseBtn">확인</a>
            </div>
        </div>
</div>