<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		$("#y_chanRepAllChck").change(function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		$("#y_exchanFrm").submit(function(){
			if(confirm("선택하신 상품이 교환처리 됩니다.\n내용을 재확인 하시려면 취소를 눌러주세요.")){
				if($("input[name=y_chanChck]:checked").length == 0){
					alert("선택된 상품이 없습니다.")
					return false;
				}else if($("#exchanselect").val()=="" || $("#exchanselect").val()==null){
					alert("선택된 사유가 없습니다.")
					return false;
				}else if($("#username").val()==""){
					alert("이름을 입력해주세요.")
					return false;
				}else if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
					alert("연락처를 입력해주세요.")
					return false;
				}else if($("#zipcode").val()==""){
					alert("우편번호를 입력해주세요.")
					return false;
				}else if($("#addr").val()==""){
					alert("주소를 입력해주세요.")
					return false;
				}else if($("#detailaddr").val()==""){
					alert("상세주소를 입력해주세요.")
					return false;
				}else{
					for(var i=0; i<$("input[name=y_chanChck]").not(":checked").length; i++){
						$("input[name=y_chanChck]").not(":checked").eq(i).prop("disabled", true);
						$("input[name=y_chanChck]").not(":checked").eq(i).parent().next().children('input[type=hidden]').prop("disabled", true);
					}
				}
				return true;
			}
		});
	});
	/* 카카오주소api 연동 */
	function kakao_address(){
	 
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //주소변수 문자열과 합치기
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
                $(".y_chngZipcode").val(data.zonecode);//우편변호
                $(".y_chngAddr").val(addr);//주소
                
                // 커서를 상세주소 필드로 이동한다.
                $(".y_chngDetailAddr").attr("readonly", false);
                $(".y_chngDetailAddr").focus();
	 
	        }
	    
	    }).open();    
	    
	}
</script>
<div id="y_myPageMain_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_ChangeRefund">
        <h1>교환/환불신청</h1>
        <form action="exchangeWrite" method="post" id="y_exchanFrm">
	        <div>
	            <p><span class="colorRed">*</span> 교환/환불 상품정보</p>
	            <p class="colorRed">* 리스트에서 체크된 상품만 교환/환불요청이 진행됩니다.</p>
	            <ul class="clearfix">
	                <li><input id="y_chanRepAllChck" type="checkbox"></li>
	                <li>상품주문번호</li>
	                <li>상품명</li>
	                <li>차감될 적립금</li>
	                <li>결제금액(수량)</li>
	                <li>배송비</li>
	            </ul>
	            <ul id="y_chanRepList" class="clearfix">
	            	<c:forEach var="data" items="${list }">
		                <li><input name="y_chanChck" class="y_chanChck" type="checkbox"></li>
		                <li>${data.orderno }<input type="hidden" name="orderno" value="${data.orderno }"><input type="hidden" name="suborderno" value="${data.suborderno }"></li>
		                <li class="clearfix"><img src="<%=request.getContextPath()%>/upload/${data.img1}" alt=""><p class="wordcut">${data.pname }<c:if test="${data.optinfo!=null }">(${data.optinfo })</c:if></p></li>
		                <li><fmt:formatNumber value="${(data.subprice*data.quantity)*0.02 }"/>원</li>
		                <li><fmt:formatNumber value="${data.subprice*data.quantity}"/>원<br/>(${data.quantity }개)</li>
		                <li><fmt:formatNumber value="${data.quantity*30000 }"/>원</li>
	                </c:forEach>
	            </ul>
	        </div>
	        <div class="clearfix">
	            <ul>
	                <li><span class="colorRed">*</span> 사유선택</li>
	                <li><span class="colorWhite">*</span> 사유입력</li>
	            </ul>
	            <ul>
	                <li>
	                    <select name="exchanselect" id="exchanselect">
	                        <option value="" selected="selected" disabled="disabled" hidden>교환사유를 선택해주세요</option>
	                        <option value="1">옵션 변경</option>
	                        <option value="2">다른상품 잘못 주문</option>
	                        <option value="3">상품파손</option>
	                        <option value="4">상품정보 상이</option>
	                        <option value="5">오배송</option>
	                        <option value="6">색상 등 다른상품 잘못 배송</option>
	                    </select>
	                </li>
	                <li>
	                    <textarea name="exchancontent" id="exchancontent" cols="50" rows="3"></textarea>
	                </li>
	            </ul>
	        </div>
	        <p class="colorRed">* 사용한 적립금은 차감될 적립금만큼 빠진금액이 환불됩니다.</p>
	        <div>
	            <p><span class="colorRed">*</span> 교환신청시 수거정보 추가입력</p>
	            <div class="clearfix">
	                <ul>
	                    <li><span class="colorWhite">*</span> 이름</li>
	                    <li><span class="colorWhite">*</span> 연락처</li>
	                    <li><span class="colorWhite">*</span> 주소</li>
	                </ul>
	                <ul>
	                    <li><input type="text" name="username" id="username" maxlength="10" value="${memberVO.username }"></li>
	                    <li><input type="text" name="tel1" id="tel1" value="${memberVO.tel1 }" maxlength="3"> - <input type="text" name="tel2" id="tel2" maxlength="4" value="${memberVO.tel2 }"> - <input type="text" name="tel3" id="tel3" maxlength="4" value="${memberVO.tel3 }"></li>
	                    <li><input type="text" class="y_chngZipcode" name="zipcode" id="zipcode" maxlength="6" value="${memberVO.zipcode }"> <button class="y_chngZipcodeBtn" type="button" onclick="javascript:kakao_address()">우편번호</button></li>
	                    <li><input type="text" class="y_chngAddr" name="addr" id="addr" value="${memberVO.addr }"></li>
	                    <li><input type="text" class="y_chngDetailAddr" name="detailaddr" id="detailaddr" value="${memberVO.detailaddr }"></li>
	                </ul>
	            </div>
	        </div>
	        <div>
	            <button type="button" class="clientSubBtn">환불신청</button>
	            <button type="submit" class="clientMainBtn">교환신청</button>
	        </div>
        </form>
    </div>
</div>