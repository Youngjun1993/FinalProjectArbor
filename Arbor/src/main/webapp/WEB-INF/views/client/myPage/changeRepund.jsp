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
		$("#y_exchangeMainBtn").click(function(){
				if($("input[name=y_chanChck]:checked").length == 0){
					alert("선택된 상품이 없습니다.")
				}else if($("#exchanselect").val()=="" || $("#exchanselect").val()==null){
					alert("선택된 사유가 없습니다.")
				}else if($("#username").val()==""){
					alert("이름을 입력해주세요.")
				}else if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
					alert("연락처를 입력해주세요.")
				}else if($("#zipcode").val()==""){
					alert("우편번호를 입력해주세요.")
				}else if($("#addr").val()==""){
					alert("주소를 입력해주세요.")
				}else if($("#detailaddr").val()==""){
					alert("상세주소를 입력해주세요.")
				}else{
					// suborderno 배열
					var suborderno = [];
					for(var i=0; i<$("input[name=y_chanChck]:checked").length; i++){
						suborderno.push($("input[name=y_chanChck]:checked").eq(i).parent().next().children('input[name=suborderno]').val());
					}
					//팝업 상품정보 변경
					$.ajax({
						url : "exchangePopList",
						dataType : 'json',
						type : "POST",
						data : {
							suborderno : suborderno
						},success : function(result){
							var $result = $(result);
							var tag="";
							$result.each(function(i, data) {
								tag += "<li class='wordcut'><input type='hidden' name='pname' value='"+data.pname+"'><input type='hidden' name='orderno' value='"+data.orderno+"'><input type='hidden' name='pno' value='"+data.pno+"'/><input type='hidden' name='saleprice' value='"+data.saleprice+"'>" + data.pname + "</li>";
								if(data.optinfo==null){
									tag += "<li class='y_optChangeList'><input type='hidden' name='suborderno' value='"+data.suborderno+"'/><select name='optinfo' class='wordcut y_chanOptionSelect' style='width:199px;'><option val='' selected>기본 옵션</option></select></li>";	
								}else{
									tag += "<li class='y_optChangeList'><input type='hidden' name='suborderno' value='"+data.suborderno+"'/><select name='optinfo' class='wordcut y_chanOptionSelect' style='width:199px;'><option val='"+data.optinfo+"' selected>"+data.optinfo+"(기존옵션)</option></select></li>";
								}
								tag += "<li><input type='hidden' name='quantity' value='"+data.quantity+"'/><input type='hidden' name='changeQuantity' value='0'/><button type='button' class='y_chanMinusBtn'>-</button><span>" + data.quantity + "</span><button type='button' class='y_chanPlusBtn'>+</button></li>";
								tag += "<li><input type='hidden' name='subprice' value='"+data.subprice+"'/><input type='hidden' name='changeSubprice' value='"+data.subprice+"'/>" + comma(data.subprice) + "원</li>";
								tag += "<li>-</li>";
								tag += "<li>-</li>";
							});
							$("#y_exchangePopUl").html(tag);
							//팝업 옵션정보 변경
							$.ajax({
								url : "exchangeOptSelect",
								dataType : 'json',
								type : "POST",
								data : {
									suborderno : suborderno
								},success : function(result){
									var $result = $(result);
									var tag="";
									for(var i=0; i<$(".y_optChangeList").length; i++){
										$result.each(function(idx, data) {
											if(data.suborderno==$(".y_optChangeList").eq(i).children('input[name=suborderno]').val()){
												$(".y_optChangeList").eq(i).children('select').append("<input type='hidden' name='optprice' value='"+data.optprice+"'/><option value='"+data.optname+" : "+data.optvalue+"'>"+data.optname+" : "+data.optvalue+"(옵션금액:"+comma(data.optprice)+"원)"+"</option>");
											}
										});	
									}
									
								}, error : function(request,status,error){
									console.log('교환 팝업 옵션선택 에러')
									console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						}, error : function(request,status,error){
							console.log('교환 팝업 에러')
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
					
					$(".y_modal").css("display","block");
					var offset = $('#y_ChangeRefund').offset(); //선택한 태그의 위치를 반환
					//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
					$('html').animate({scrollTop : offset.top}, 400);
					
					for(var i=0; i<$("input[name=y_chanChck]").not(":checked").length; i++){
						$("input[name=y_chanChck]").not(":checked").eq(i).prop("disabled", true);
						$("input[name=y_chanChck]").not(":checked").eq(i).parent().next().children('input[type=hidden]').prop("disabled", true);
					}
					
				}
		});
		//팝업 닫기
		$("#y_exchangePopClsBtn").click(function(){
			$(".y_modal").css("display","none");
		});
		//옵션 선택시
		$(document).on("change", '.y_chanOptionSelect', function() {
			var optprice = $(this).find('option:selected').prev('input[type=hidden]').val(); //옵션가격
			var saleprice = $(this).parent().prev().children('input[name=saleprice]').val(); //상품 옵션제외 가격
			var pno = $(this).parent().prev().children('input[name=pno]').val() //상품번호
			var subprice = $(this).parent().next().next().children('input[name=subprice]').val(); //결제금액
			var quantity = $(this).parent().next().children('span').text();
			var selectPrice = 0; //옵션선택 상품가격 
			if(optprice==null || optprice==""){
				optprice=0;
			}
			if(optprice<0){
				selectPrice = parseInt(saleprice) - Math.abs(optprice); 
			}else{
				selectPrice = parseInt(saleprice) + parseInt(optprice);
			}
			$(this).parent().next().next().children('input[name=changeSubprice]').val(selectPrice);
			$(this).parent().next().next().next().text(comma(selectPrice)+"원");
			$(this).parent().next().next().next().next().text(comma((subprice-selectPrice)*quantity)+"원");
		});
		
		//팝업 + 버튼
		$(document).on("click", ".y_chanPlusBtn", function(){
			var quantity = $(this).parent().children('span').text();
			var plusTotalPrice = $(this).parent().next().next().next().text();
			var subprice = $(this).parent().next().children('input[name=subprice]').val(); //결제금액
			var optprice = $(this).parent().prev().children().find('option:selected').prev('input[type=hidden]').val(); //옵션가격
			var saleprice = $(this).parent().prev().prev().children('input[name=saleprice]').val(); //상품 옵션제외 가격
			if(quantity>=$(this).parent().children('input[name=quantity]').val()){
				alert("주문하신 수량을 초과할 수 없습니다.")
			}else{
				quantity = parseInt(quantity) + 1;	
			}
			
			var selectPrice = 0; //옵션선택 상품가격 
			if(optprice==null || optprice==""){
				optprice=0;
			}
			if(optprice<0){
				selectPrice = parseInt(saleprice) - Math.abs(optprice); 
			}else{
				selectPrice = parseInt(saleprice) + parseInt(optprice);
			}
			
			if(plusTotalPrice != "-" && plusTotalPrice != "0원"){
				$(this).parent().next().next().next().text(comma((subprice-selectPrice)*quantity)+"원");
			}
			
			$(this).parent().children('span').text(quantity);
			$(this).parent().children('input[name=changeQuantity]').val(quantity);
		});
		//팝업 - 버튼
		$(document).on("click", ".y_chanMinusBtn", function(){
			var quantity = $(this).parent().children('span').text(); 
			var plusTotalPrice = $(this).parent().next().next().next().text();
			var subprice = $(this).parent().next().children('input[name=subprice]').val(); //결제금액
			var optprice = $(this).parent().prev().children().find('option:selected').prev('input[type=hidden]').val(); //옵션가격
			var saleprice = $(this).parent().prev().prev().children('input[name=saleprice]').val(); //상품 옵션제외 가격
			if(quantity==1){
				alert("교환은 최소 1개의 수량이 있어야합니다.")
			}else{
				quantity = parseInt(quantity) - 1;	
			}
			
			var selectPrice = 0; //옵션선택 상품가격 
			if(optprice==null || optprice==""){
				optprice=0;
			}
			if(optprice<0){
				selectPrice = parseInt(saleprice) - Math.abs(optprice); 
			}else{
				selectPrice = parseInt(saleprice) + parseInt(optprice);
			}
			
			if(plusTotalPrice != "-" && plusTotalPrice != "0원"){
				$(this).parent().next().next().next().text(comma((subprice-selectPrice)*quantity)+"원");
			}
			$(this).parent().children('span').text(quantity);
			$(this).parent().children('input[name=changeQuantity]').val(quantity);
		});
		//교환완료 버튼
		$("#y_exchangeFrm").submit(function() {
			if(confirm("선택한 옵션으로 교환하시겠습니까?")){
				var changeprice = 0;
				var minusOriginPrice=0;
				var plusOriginPrice=0;
				var originExchangePrice=0;
				$("#y_exchangePopUl>li:nth-child(6n+6)").each(function(i, e) {
					if($(this).text()=="-"){
						originExchangePrice = 0;
					}else{
						$(this).text().replace("원", "");
						originExchangePrice = parseInt($(this).text().replace(/,/g, ""));
					}
					if(originExchangePrice<=0){
						minusOriginPrice += Math.abs(originExchangePrice);
					}else{
						plusOriginPrice += originExchangePrice;
					}
				})
				changeprice = plusOriginPrice - minusOriginPrice;
				
				if(changeprice<0){
					alert("추가결제금 "+ comma(Math.abs(changeprice))+"원을 계좌로 입금바랍니다.")
				}else if(changeprice==0){
					alert("추가결제금은 없으며 별도 배송비를 동봉해주시면 교환이 진행됩니다.")
				}else{
					alert("초과결제된 금액 "+ comma(changeprice)+"원을 고객님 계좌로 환불해드립니다.\n영업일 기준 2~3일 소요됩니다.")
				}
				$.ajax({
					url : 'exchangeWrite',
					type : "POST",
					data : $("#y_exchanFrm").serialize(),
					success : function(result){
						
					},error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
				$("#y_exchanFrm").submit();
				return true;
			}
			return false;
		});
		// 환불버튼
		$("#y_exchangeDelBtn").click(function(){
			if(confirm("선택된 목록을 환불처리 하시겠습니까?")){
				// suborderno 배열
				var delSuborderno = [];
				var delSubprice = [];
				var sumDelPrice = 0;
				var delQuantity = 0;

				for(var i=0; i<$("input[name=y_chanChck]:checked").length; i++){
					delSuborderno.push($("input[name=y_chanChck]:checked").eq(i).parent().next().children('input[name=suborderno]').val());
					sumDelPrice = $("input[name=y_chanChck]:checked").eq(i).parent().next().next().next().children('input[name=subprice]').val();
					delQuantity = $("input[name=y_chanChck]:checked").eq(i).parent().next().next().next().children('input[name=quantity]').val();
					 
					delSubprice.push(sumDelPrice * delQuantity);
				}
				var delOrderno = $("#y_chanRepList>li:nth-child(2)").children('input[name=orderno]').val();
				
				$.ajax({
					url : 'exchangeDelete',
					type : "POST",
					data : {
						suborderno : delSuborderno,
						orderno : delOrderno,
						subprice : delSubprice 
					},
					success : function(result){
						alert('환불처리 되었습니다. \n환불금액은 영업일 기준 2~3일 뒤 처리됩니다.')
						location.href="purchaseList";
					},error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		});
	});
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
        <form method="post" id="y_exchanFrm">
	        <div>
	            <p><span class="colorRed">*</span> 교환/환불 상품정보</p>
	            <p class="colorRed">* 리스트에서 체크된 상품만 교환/환불요청이 진행됩니다.</p>
	            <ul class="clearfix">
	                <li><input id="y_chanRepAllChck" type="checkbox"></li>
	                <li>상품주문번호</li>
	                <li>상품명</li>
	                <li>환불시 차감 적립금</li>
	                <li>결제금액(수량)</li>
	                <li>배송비</li>
	            </ul>
	            <ul id="y_chanRepList" class="clearfix">
	            	<c:forEach var="data" items="${list }">
		                <li><input name="y_chanChck" class="y_chanChck" type="checkbox"></li>
		                <li>${data.orderno }<input type="hidden" name="orderno" value="${data.orderno }"><input type="hidden" name="suborderno" value="${data.suborderno }"></li>
		                <li class="clearfix"><img src="<%=request.getContextPath()%>/upload/${data.img1}" alt=""><p class="wordcut">${data.pname }<c:if test="${data.optinfo!=null }">(${data.optinfo })</c:if></p></li>
		                <li><input type="hidden" name="subprice" value="${data.subprice }"><input type="hidden" name='quantity' value="${data.quantity }"><fmt:formatNumber value="${(data.subprice*data.quantity)*0.02 }"/>원</li>
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
	            <button type="button" id="y_exchangeDelBtn" class="clientSubBtn">환불신청</button>
	            <button type="button" id="y_exchangeMainBtn" class="clientMainBtn">교환신청</button>
	        </div>
        </form>
    </div>
</div>
<div class="y_modal">
	<form action="exchangeOk" method="post" id="y_exchangeFrm">
		<div id="y_exchangePopup">
	         <p><span class="colorRed">*</span> 교환옵션 선택</p>
	         <ul class="clearfix">
	             <li>상품명</li>
	             <li>옵션선택</li>
	             <li>교환할 수량</li>
	             <li>구매상품 가격</li>
	             <li>교환상품 가격</li>
	             <li>총수량 차액</li>
	         </ul>
	         <ul id="y_exchangePopUl" class="clearfix">
	             
	         </ul>
	         <p class="colorRed">* 배송비는 별도 계산됩니다.</p>
	         <div>
	             <button id="y_exchangePopClsBtn" type="button" class="clientSubBtn">닫기</button>
	             <button type="submit" class="clientMainBtn">교환요청</button>
	         </div>
	     </div>
     </form>
</div>