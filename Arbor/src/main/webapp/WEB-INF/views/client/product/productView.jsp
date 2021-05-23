<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<span id="p_top"></span>
<div class="w1400_container font_ng">
	<h1 id="p_detailTitle">《 ${vo.pname } 》</h1>
	<hr />
	<div id="p_detail" class="clearfix">
		<!-- 모델명, 이미지 띄울 곳 -->
		<div id="p_detailImg">
			<img src="<%=request.getContextPath() %>/upload/${vo.img1}"/>
		</div>
		<!-- 이미지 옆에 기본정보, 옵션 띄우는 곳
		div 분리되어있어서 form을 여기부터 걸었음... -->
		<div id="p_detailRight" class="clearfix">
			<div id="p_detailInfo">
				<h3>기본정보</h3>
				<ul>
					<li>판매가</li>
					<li><span class="p_bigPrice"><fmt:formatNumber value="${vo.saleprice }" pattern="#,###"/>원 ~ </span></li>
					<li>정상가</li>
					<li><span class="p_smallPrice"><fmt:formatNumber value="${vo.pprice }" pattern="#,###"/>원 </span></li>
					<li>배송가능지역</li>
					<li>전국</li>
					<li>배송방법</li>
					<li>직배송</li>
					<li>배송비</li>
					<li>30,000원(추가비용 상세페이지 참고)</li>
				</ul>
			</div>
			<div id="p_detailOption">
				<h3>상품옵션</h3>
				<c:forEach var="name" items="${optName }">
					<span class="p_optTitle">${name.optname }</span>
					<select name="optname" class="p_optname">
					<option value="" selected disabled hidden>==필수옵션선택==</option>
						<c:forEach var="val" items="${optValue }">
							<c:if test="${val.optname==name.optname }">
								<option value="${val.optno }">${val.optvalue }
									<c:if test="${val.optprice!=0 }">(<c:if test="${fn:substring(val.optprice,0,1)!='-' }">+</c:if>${val.optprice })</c:if>
								</option>
							</c:if>
						</c:forEach>
					</select><br/>
				</c:forEach>
				<c:if test="${fn:length(optName)==0}">
					<br/><br/>해당 상품은 옵션이 존재하지 않습니다.
				</c:if>
			</div>
		</div>
		<!-- 옵션 선택 시 띄울 공간 -->
		<form name="optionDiv" id="optionDiv">
		<div id="p_detailSelect" class="clearfix">
			<div id="p_detailSelect_Div" class="clearfix">
				
			</div>
			<div id="p_totalDiv">
				총 상품금액 <span id="p_totalprice">0 원</span><br/>
				<button type="button" onclick="javascript:dibsInsert(${vo.pno})" class="clientSubBtn">찜하기</button>
				<button type="button" onclick="javascript:cartInsert(${vo.pno})" class="clientSubBtn">장바구니</button>
				<button type="button" onclick="javascript:orderInsert(${vo.pno})" class="clientMainBtn">바로구매</button>
			</div>
			<span id="p_detailMenu_up"></span>
		</div>
		</form>
	</div>
	<div id="p_detailMenu">
		<ul>
			<li>상품상세</li>
			<li><a href="#p_reviewMenu_up">상품후기</a></li>
			<li><a href="#p_pqnaMenu_up">상품문의</a></li>
			<li><a href="#p_deliveryMenu_up">배송안내</a></li>
		</ul>
	</div>
	<div id="p_detailView">
		<img src="<%=request.getContextPath() %>/img/tree_detail3.jpg"/><br/>
		<img src="<%=request.getContextPath() %>/img/info_detail2.jpg"/>
		<img src="<%=request.getContextPath() %>/img/info_detail3.jpg"/><br/>
		<img src="<%=request.getContextPath() %>/img/tree_detail.jpg"/><br/>
		<div>
			<h2>상품상세</h2><br/>
			${vo.description }
		</div>
		<img src="<%=request.getContextPath() %>/upload/${vo.img1}"/>
		<c:if test="${vo.img2!=null && vo.img2!='' }">
			<img src="<%=request.getContextPath() %>/upload/${vo.img2}"/>
		</c:if>
		<img src="<%=request.getContextPath() %>/img/detail3.jpg"/>
		<h2>상품필수정보</h2>
		<h3>전자상거래 등에서의 상품정보제공 고시에 따라 작성되었습니다.</h3>
		<ul>
			<li>품명 및 모델명</li>
			<li>${vo.pname }</li>
			<li>색상</li>
			<li class="wordcut">
				<div class="p_colorDiv" class="clearfix">
					<c:forEach var="opt" items="${opt }">
						<c:if test="${opt.rgbvalue!=null && vo.pno==opt.pno }">
							<div>${opt.optvalue }&nbsp|&nbsp </div>
						</c:if>
					</c:forEach>
				</div>
			</li>
			<li>구성품</li>
			<li>컨텐츠 참조</li>
			<li>제조자, 수입품의 경우 수입자를 함께 표기 (병행수입 대체 가능)</li>
			<li>&nbsp</li>
			<li>제조국 (구성품 별 제조국이 다른 경우 각 구성품의 제조국)</li>
			<li>대한민국</li>
			<li>크기</li>
			<li>컨텐츠 참조</li>
			<li>배송/설치 비용</li>
			<li>컨텐츠 참조</li>
			<li>품질보증기준</li>
			<li>본 제품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 보상받으실 수 있습니다.</li>
			<li>AS 책임자와 전화번호</li>
			<li>&nbsp</li>
		</ul>
	</div>
	<span id="p_reviewMenu_up"></span>
	<div id="p_reviewMenu">
		<ul>
			<li><a href="#p_detailMenu_up">상품상세</a></li>
			<li>상품후기</li>
			<li><a href="#p_pqnaMenu_up">상품문의</a></li>
			<li><a href="#p_deliveryMenu_up">배송안내</a></li>
		</ul>
	</div>
	<div id="p_review" class="clearfix">
		<h1>상품후기</h1>
		<h3>실제 사용하신 경험담을 글과 사진으로 남겨주시면 해당 상품 구매를 고민하시는 많은 분들께 도움이 됩니다.</h3>
		<hr/>
		<c:forEach var="lst" items="${qnaList }">
		<div>
			<div class="p_review_leftDiv">
				<img src="<%=request.getContextPath() %>/img/sublogo.jpg"/>
			</div>
			<div class="p_review_rightDiv">
				<p>${lst.username } (${lst.userid }) | ${lst.reviewdate }</p>
				<c:choose>
					<c:when test="${lst.grade==1 }">
						<p><span class="gradestar">★</span><span class="elsestar">★★★★</span></p><br/>
					</c:when>
					<c:when test="${lst.grade==2 }">
						<p><span class="gradestar">★★</span><span class="elsestar">★★★</span></p><br/>
					</c:when>
					<c:when test="${lst.grade==3 }">
						<p><span class="gradestar">★★★</span><span class="elsestar">★★</span></p><br/>
					</c:when>
					<c:when test="${lst.grade==4 }">
						<p><span class="gradestar">★★★★</span><span class="elsestar">★</span></p><br/>
					</c:when>
					<c:otherwise>
						<p><span class="gradestar">★★★★★</span></p><br/>
					</c:otherwise>
				</c:choose>
				<p>${lst.reviewcontent }</p>
			</div>
		</div>
		<hr/>
		</c:forEach>
		<c:if test="${fn:length(qnaList)==0}">
			<span class="p_noContentSpan">아직 등록된 리뷰가 없습니다.</span><br/>
			<a href="purchaseList" id="p_reviewInsertBtn" class="clientSubBtn">리뷰등록하러가기</a>
		</c:if>
		<c:if test="${fn:length(qnaList)!=0}">	
			<div class="pagingDiv">
				 <ul class="paging" class="clearfix">
	            	<c:if test="${pageVO2.pageNum>1 }">
	                	<li style="border-bottom:none;"><a class="pagingLR_a" href="productView?pageNum2=${pageVO2.pageNum-1}&pno=${vo.pno }#p_reviewMenu_up">＜</a></li>
	                </c:if>
	                <c:forEach var="p" begin="${pageVO2.startPageNum }" step="1" end="${pageVO2.startPageNum + pageVO2.onePageNum-1 }">
	                	<c:if test="${p<=pageVO2.totalPage }">
		                	<c:if test="${p==pageVO2.pageNum }">
		                		<li style="border-bottom:3px solid rgb(93,121,115);"><a href="productView?pageNum2=${p}&pno=${vo.pno }#p_reviewMenu_up">${p }</a></li>
		                	</c:if>
		                	<c:if test="${p!=pageVO2.pageNum }">
		                		<li><a href="productView?pageNum2=${p}&pno=${vo.pno }#p_reviewMenu_up">${p }</a></li>
		                	</c:if>
	                	</c:if>
	                </c:forEach>
	                <c:if test="${pageVO2.pageNum<pageVO2.totalPage }">
	                	<li style="border-bottom:none;"><a class="pagingLR_a" href="productView?pageNum2=${pageVO2.pageNum+1}&pno=${vo.pno }#p_reviewMenu_up">＞</a></li>
	                </c:if>
	            </ul>
            </div>
		</c:if>
	</div>
	<span id="p_pqnaMenu_up"></span>
	<div id="p_pqnaMenu">
		<ul>
			<li><a href="#p_detailMenu_up">상품상세</a></li>
			<li><a href="#p_reviewMenu_up">상품후기</a></li>
			<li>상품문의</li>
			<li><a href="#p_deliveryMenu_up">배송안내</a></li>
		</ul>
	</div>
	<div id="p_pqna" class="clearfix">
		<h1>상품문의</h1>
		<h3>해당 상품에 대한 문의만 답변이 가능하며 답변완료까지 1~5일이 소요될 수 있습니다.<br/>
		주문, 결제, 배송, 반품/교환 문의는 1:1문의를 이용해주세요.</h3>
		<a href="qnaList"><button type="button" class="clientSubBtn">1:1문의 바로가기</button></a><br/>
		<c:if test="${fn:length(pqnalst)==0}">
			<span class="p_noContentSpan">아직 등록된 문의가 없습니다.</span><br/>
		</c:if>
		<hr/>
		<ul id="p_pqnaSecondDiv">
			<c:forEach var="vo" items="${pqnalst }">
			<li><div>
			<c:choose>
				<c:when test="${vo.panswercontent=='답변 대기중 입니다.'}">
					<div class="p_qna_leftDiv">
						<img src="<%=request.getContextPath() %>/img/question.jpg"/>
					</div>
					<div class="p_qna_rightDiv">
						<ul>
							<li>
								답변대기중
								<c:if test="${vo.pqnaopen=='Y' }">
								<img src="<%=request.getContextPath() %>/img/nolock.jpg"/>
								</c:if>
								<c:if test="${vo.pqnaopen=='N' }">
								<img src="<%=request.getContextPath() %>/img/lock.jpg"/>
								</c:if>
								<c:if test="${vo.userid==logId }">
								&nbsp&nbsp&nbsp&nbsp<a href="#s" class="pqnaEditSpan">수정</a> | <a href="javascript:pqnaDelete(${vo.pqnano })">삭제</a>
								</c:if>
							</li>
							<c:choose>
							<c:when test="${vo.pqnaopen=='Y' || vo.userid==logId }">
							<li><a class="p_qna_answer" href="#s">${vo.pqnasubject }</a></li>
							<li>
								<div>
								<p>Q. ${vo.pqnacontent }</p>
								<p>A. ${vo.panswercontent }</p>
								</div>
							</li>
							</c:when>
							<c:otherwise>
							<li><a class="p_qna_answer" href="#s">사용자의 요청에 의해 비공개처리된 글입니다.</a></li>
							<li>
								<div>
								<p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p>
								<p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p>
								</div>
							</li>
							</c:otherwise>
							</c:choose>
						</ul>
						<div class="p_qna_sideDiv">${vo.userid } | ${vo.pqnadate }</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="p_qna_leftDiv">
						<img src="<%=request.getContextPath() %>/img/done.jpg"/>
					</div>
					<div class="p_qna_rightDiv">
						<ul>
							<li>
								답변완료
								<c:if test="${vo.pqnaopen=='Y' }">
								<img src="<%=request.getContextPath() %>/img/nolock.jpg"/>
								</c:if>
								<c:if test="${vo.pqnaopen=='N' }">
								<img src="<%=request.getContextPath() %>/img/lock.jpg"/>
								</c:if>
								<c:if test="${vo.userid==logId }">
								&nbsp&nbsp&nbsp&nbsp<a href="#s" class="pqnaEditSpan">수정</a> | <a href="javascript:pqnaDelete(${vo.pqnano })">삭제</a>
								</c:if>
							</li>
							<c:choose>
							<c:when test="${vo.pqnaopen=='Y' || vo.userid==logId }">
							<li><a class="p_qna_answer" href="#s">${vo.pqnasubject }</a></li>
							<li>
								<div>
								<p>Q. ${vo.pqnacontent }</p>
								<p>A. ${vo.panswercontent }</p>
								</div>
							</li>
							</c:when>
							<c:otherwise>
							<li><a class="p_qna_answer" href="#s">사용자의 요청에 의해 비공개처리된 글입니다.</a></li>
							<li>
								<div>
								<p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p>
								<p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p>
								</div>
							</li>
							</c:otherwise>
							</c:choose>
						</ul>
						<div class="p_qna_sideDiv">${vo.userid } | ${vo.pqnadate }</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="p_qna_hidden2">
				<h1>상품문의글 수정</h1>
				<form action="" method="post">
					<p>
					문의글 공개여부선택 : 
					<c:choose>
						<c:when test="${vo.pqnaopen=='Y' }">
							<input type="radio" name="pqnaopen" value="Y" checked="checked">공개
							<input type="radio" name="pqnaopen" value="N">비공개
						</c:when>
						<c:otherwise>
							<input type="radio" name="pqnaopen" value="Y">공개
							<input type="radio" name="pqnaopen" value="N" checked="checked">비공개
						</c:otherwise>
					</c:choose>
					</p>
					<input type="hidden" name="pqnano" value="${vo.pqnano }"/>
					<input type="hidden" name="pno" value="${vo.pno }" />
					<input type="text" name="pqnasubject" value="${vo.pqnasubject }"/><br />
					<textarea name="pqnacontent">${vo.pqnacontent }</textarea><br/>
					<input type="button" value="수정하기" class="clientMainBtn" /><button type="button" class="clientSubBtn" onclick="location.href='javascript:hiddenClose2()'">취소하기</button>
				</form>
			</div>
		</div></li>
		</c:forEach>
		</ul>
		<c:if test="${fn:length(pqnalst)!=0}">
			<div class="pagingDiv">
				<ul class="paging" class="clearfix">
	           	<c:if test="${pageVO.pageNum>1 }">
	               	<li style="border-bottom:none;"><a class="pagingLR_a" href="productView?pageNum=${pageVO.pageNum-1}&pno=${vo.pno }#p_pqnaMenu_up">＜</a></li>
				</c:if>
	            <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
	               	<c:if test="${p<=pageVO.totalPage }">
	                	<c:if test="${p==pageVO.pageNum }">
	                		<li style="border-bottom:3px solid rgb(93,121,115);"><a href="productView?pageNum=${p}&pno=${vo.pno }#p_pqnaMenu_up">${p }</a></li>
	                	</c:if>
		               	<c:if test="${p!=pageVO.pageNum }">
		               		<li><a href="productView?pageNum=${p}&pno=${vo.pno }#p_pqnaMenu_up">${p }</a></li>
		               	</c:if>
	               	</c:if>
				</c:forEach>
	               <c:if test="${pageVO.pageNum<pageVO.totalPage }">
						<li style="border-bottom:none;"><a class="pagingLR_a" href="productView?pageNum=${pageVO.pageNum+1}&pno=${vo.pno }#p_pqnaMenu_up">＞</a></li>
	               </c:if>
				</ul>
			</div>
		</c:if>
		<a href="javascript:hiddenOpen()"><button type="button" class="clientMainBtn">상품문의글 작성</button></a><br/>
		<div id="p_qna_hidden">
			<h1>상품문의글 작성</h1>
			<form action="javascript:pqnaInsert()" method="post" id="p_qna_hiddenFrm">
				<p>
				문의글 공개여부선택 : 
				<input type="radio" name="pqnaopen" value="Y" checked="checked">공개
				<input type="radio" name="pqnaopen" value="N">비공개
				</p>
				<input type="hidden" name="pno" value="${vo.pno }" />
				<input type="text" name="pqnasubject" id="pqnasubject" placeholder="제목을 입력하세요"/><br />
				<textarea name="pqnacontent" id="pqnacontent" placeholder="문의내용을 입력하세요"></textarea><br/>
				<input type="submit" value="등록하기" class="clientMainBtn" /><button type="button" class="clientSubBtn" onclick="location.href='javascript:hiddenClose()'">취소하기</button>
			</form>
		</div>
	</div>
	
	<span id="p_deliveryMenu_up"></span>
	<div id="p_deliveryMenu">
		<ul>
			<li><a href="#p_detailMenu_up">상품상세</a></li>
			<li><a href="#p_reviewMenu_up">상품후기</a></li>
			<li><a href="#p_pqnaMenu_up">상품문의</a></li>
			<li>배송안내</li>
		</ul>
	</div>
	<div id="p_delivery">
		<img src="<%=request.getContextPath() %>/img/detail2.jpg"/>
		<h2>Arbor 반품/교환 안내</h2>
		<h3>고객센터로 연락주신 후 반품상품을 발송해 주시기 바랍니다.</h3>
		<ul>
			<li>판매자 지정 택배사</li>
			<li>우체국택배</li>
			<li>반품배송비</li>
			<li>100,000원 (교환배송비 200,000원), 최초 배송비 무료인 경우 130,000원</li>
			<li>보내실 곳</li>
			<li>Footer정해지면 추가등록 예정 (우:12345)</li>
			<li>반품/교환 요청 가능 기간(사유충족시)</li>
			<li>단순 변심은 상품 수령 후 7일 이내 (반품배송비는 구매자 부담) / 상품 하자의 경우 수령 후 3개월 이내 (배송비 무료)</li>
			<li>반품/교환 불가능 사유</li>
			<li>1. 요청 가능 기간이 지난 경우<br/>
			2. 구매자의 책임 있는 사유로 상품이 멸실, 훼손된 경우 (상품 내용 확인을 위한 포장 훼손 제외)<br/>
			3. 구매자 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br/>
			4. 시간의 경과에 의하여 재판매가 곤란한 정도로 상품 등의 가치가 현저히 감소한 경우<br/>
			5. 고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작 상품의 경우<br/>
			 (판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가능하다는 사실을 서면동의 받은 경우)<br/>
			6. 복제가 가능한 상품 등의 포장을 훼손한 경우</li>
		</ul>
	</div>
</div>
<div id="p_fixedTop" >
	<a href="#" id="p_fixedHeader"><img src="<%=request.getContextPath() %>/img/top.png"/></a>
</div>
<script>
	$(function(){
		<!-- 총금액 넣을 변수 -->
		var totalPrice = 0;
		<!-- 상품문의 제목만 보이게 세팅 -->
		$(".p_qna_answer").parent().next().css('display', 'none');
		<!-- 상품문의 제목 클릭시 답변 보이게 세팅 -->
		$(document).on('click', '.p_qna_answer', function(){
			var click = $(this).parent().next();
			console.log("display?"+click.css('display'))
			if(click.css('display')=='block') {
				click.css('display', 'none');
				click.css('height', '0px');
			} else {
				click.css('display', 'block');
				click.css('height', '130px');
			}
		});
		<!-- 옵션이 없는 상품인 경우 Div 하나 먼저 등록해두기 -->
		if(${optName.size()}==0) {
			totalPrice = ${vo.saleprice};
			
			var tag = "<ul class='p_detailSelect_ul'><li>${vo.pname}</li>";
			tag += "<li><button class='optMinus'>-</button><span class='p_selectNum'>1</span><button class='optPlus'>+</button></li>";
			tag += "<li class='p_bigPrice'>"+totalPrice.toLocaleString()+" 원<input type='hidden' name='price' value='"+totalPrice+"'/></li>";
			tag += "<li></li></ul>";
			
			$("#p_detailSelect_Div").append(tag);
			$("#p_totalprice").text(totalPrice.toLocaleString()+" 원");
		}
		
		<!-- 지정된 상품 x 누르면 한 줄 지우면서 총금액 재계산 -->
		$(document).on('click', '.cancelimg', function(){
			var selectPrice = $(this).parent().prev().children().val();
			totalPrice -= selectPrice;
			$("#p_totalprice").text(totalPrice.toLocaleString()+" 원");
			$(this).parent().parent().remove();
		});
		<!-- 셀렉트 박스 변동시 밑에 선택옵션 추가하기 -->
		$(document).on('change', 'select[name=optname]', ()=>{
			var cnt = 0;
			var optnoStr = [];
			$("select[name=optname] option:selected").each(function(idx, select){
				if($(select).val()!=null && $(select).val()!='') {
					cnt++;
				}
			});
			if(cnt==${optName.size()}) {
				$("select[name=optname] option:selected").each(function(idx, select){
					optnoStr.push($(select).val());
				});
				$.ajax({
					url : 'productOptionView',
					dataType : 'json',
					type: "POST",
					data : { 
						optno : optnoStr,
					},
					success : function(result){
						var $result = $(result);
						var price = ${vo.saleprice }
						var tag = "<ul class='p_detailSelect_ul'><li>${vo.pname} (&nbsp&nbsp";
						$result.each(function(idx, val) {
							tag +=val.optname+" : "+val.optvalue+"&nbsp&nbsp";
							price += val.optprice;
						});
						tag += ") <input type='hidden' name='pno' value='${vo.pno }'/></li>";
						tag += "<li><button class='optMinus'>-</button><span class='p_selectNum'>1</span><button class='optPlus'>+</button></li>";
						tag += "<li class='p_bigPrice'>"+price.toLocaleString()+"원<input type='hidden' name='price' value='"+price+"'/></li>";
						tag += "<li><img src='./img/cancel.png' style='cursor:pointer;' class='cancelimg'/></li></ul>";
						
						var txt2 = "";
						$result.each(function(idx, val) {
							txt2 = val.optname+" : "+val.optvalue ;
						});	
						$(".p_detailSelect_ul").each(function(idx, ul){
							var txt = $(ul).children().eq(0).text();
							var txtStart = txt.indexOf("(");
							var txtEnd = txt.indexOf(")")-3;
							var txtOpt = txt.substr(txtStart+3, txtEnd-txtStart);
							
							if(txtOpt.indexOf(txt2)>-1) {
								alert("중복 옵션이 존재합니다. 다시 확인해주세요");
								tag = "";
								totalPrice -= price;
								return false;
							}
						});
						
						totalPrice += price;
						
						$("#p_detailSelect_Div").append(tag);
						$("#p_totalprice").text(totalPrice.toLocaleString()+" 원");
						$("select[name=optname]").each(function(idx, select){
							$(select).val("");
						});
					}, error : function(error){
						console.log("AJAX ERROR!!"+error);
					}
				});
				return true;
			} else {
				return false;
			}
			return true;
		});
		
		<!-- 옵션 수량 변경하기 -->
		$(document).on('click', '.optMinus', function(){
			var quantity = $(this).next().text()*1;
			if(quantity==1) {
				alert("수량은 0이 될 수 없습니다.");
				return false;
			} else {
				
				var selectPrice = $(this).parent().next().children().val();
				
				quantity -= 1; // 수량
				totalPrice -= selectPrice; // 상품 전체 총금액
				quanprice = selectPrice*quantity; // 해당 옵션에 수량곱해진금액
				
				$(this).next().text(quantity);
				$(this).parent().next().html(quanprice.toLocaleString()+" 원<input type='hidden' name='price' value='"+selectPrice+"'/>");
				$("#p_totalprice").text(totalPrice.toLocaleString()+" 원");
			}
			return false;
		});
		
		$(document).on('click', '.optPlus', function(){
			var selectPrice = $(this).parent().next().children().val();
			var quantity = $(this).prev().text()*1;
			
			quantity += 1; // 수량
			totalPrice += selectPrice*1; // 상품 전체 총금액
			quanprice = selectPrice*quantity; // 해당 옵션에 수량곱해진금액
			
			$(this).prev().text(quantity);
			$(this).parent().next().html(quanprice.toLocaleString()+" 원<input type='hidden' name='price' value='"+selectPrice+"'/>");
			$("#p_totalprice").text(totalPrice.toLocaleString()+" 원");
			
			return false;
		});
		
		$(document).on('click', '.p_qna_hidden2 button[type=button]', function(){
			$("#p_pqna").css('overflow', 'auto');
			$(".p_qna_hidden2").hide();
		});
		
		$(document).on('click', '.p_qna_hidden2 input[type=button]', function(){
			var data = $(this).parent().serialize();
			$.ajax({
				url : 'pqnaUpdate',
				data : data,
				type : 'POST',
				success : (result)=>{
					if(result>0) {
						alert("정상적으로 처리되었습니다.");
						$(".p_qna_hidden2").hide();
						
						$.ajax({
							url : "pqnaView",
							data : "pno=${vo.pno}",
							success : function(result) {
								var tag = "";
								var $result = $(result);
								$result.each((idx, val)=>{
									tag += "<li><div>"
									if(val.panswercontent=='답변 대기중 입니다.'){
										tag += "<div class='p_qna_leftDiv'><img src='./img/question.jpg'/>";
										tag += "</div><div class='p_qna_rightDiv'><ul>";
										tag += "<li>답변대기중";
										if (val.pqnaopen=='Y' || val.userid=='${logId}') {
											if(val.userid=='${logId}'){
												tag += "<img src='./img/lock.jpg'/>";
												tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
											} else {
												tag += "<img src='./img/nolock.jpg'/>";
											}
											tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
											tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
										} else {
											tag += "<img src='./img/lock.jpg'/>";
											tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
											tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
										}
										tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
									} else {
										tag += "<div class='p_qna_leftDiv'><img src='./img/done.jpg'/></div>";
										tag += "<div class='p_qna_rightDiv'><ul><li>답변완료";
										if (val.pqnaopen=='Y' || val.userid=='${logId}') {
											if(val.userid=='${logId}'){
												tag += "<img src='./img/lock.jpg'/>";
												tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
											} else {
												tag += "<img src='./img/nolock.jpg'/>";
											}
											tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
											tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
										} else {
											tag += "<img src='./img/lock.jpg'/>";
											tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
											tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
										}
										tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
									}
									tag += "<div class='p_qna_hidden2'><h1>상품문의글 수정</h1><form method='post'>";
									tag += "<p>	문의글 공개여부선택 : ";
										if(val.pqnaopen=='Y') {
											tag += "<input type='radio' name='pqnaopen' value='Y' checked='checked'>공개";
											tag += "<input type='radio' name='pqnaopen' value='N'>비공개";
										} else {
											tag += "<input type='radio' name='pqnaopen' value='Y'>공개";
											tag += "<input type='radio' name='pqnaopen' value='N' checked='checked'>비공개";
										}
									tag += "</p><input type='hidden' name='pqnano' value='"+val.pqnano+"'/><input type='hidden' name='pno' value='"+val.pno+"'/>";
									tag += "<input type='text' name='pqnasubject' value='"+val.pqnasubject+"'/><br /><textarea name='pqnacontent'>"+val.pqnacontent+"</textarea><br/>";
									tag += "<input type='button' value='수정하기' class='clientMainBtn'/><button type='button' class='clientSubBtn'>취소하기</button>";
									tag += "</form></div>";
									tag += "</div></li>";
								});
								
								$("#p_pqnaSecondDiv").html(tag);
							}, error : function(e) {
								
							}
						});
					}
				}, error : (e)=>{
					location.href="login";
				}
			});
		});
		
		$(document).on('click', '.pqnaEditSpan', function(){
			$("#p_pqna").css('overflow', 'visible');
			$(this).parent().parent().parent().next().show();
		});
	});
	
	<!-- 장바구니 클릭시 -->
	function cartInsert(pno) {
		var optnameArr = [];
		var priceArr = [];
		var quantityArr = [];
		var pno = pno;
		var cnt = 0;
		$(".p_detailSelect_ul").each(function(idx, ul){
			var txt = $(ul).children().eq(0).text();
			var txtStart = txt.indexOf("(");
			var txtEnd = txt.indexOf(")")-3;
			var optname = txt.substr(txtStart+3, txtEnd-txtStart);
			optnameArr.push(optname);
			quantityArr.push($(ul).children().eq(1).children('.p_selectNum').text());
			priceArr.push($(ul).children().eq(2).children().val());
		});
		$.ajax({
			url : 'cartInsert',
			dataType : 'json',
			type: "POST",
			data : { 
				optnameArr : optnameArr,
				priceArr : priceArr,
				quantityArr : quantityArr,
				pno : pno
			}, success : function(result) {
				console.log(result);
				if(result>0) {
					if(confirm("장바구니에 등록되었습니다. 장바구니로 이동하시겠습니까?")) {
						location.href="cartList";
					} else {
						location.href="productView?pno=${vo.pno}";
					}
				}
			}, error : function(e) {
				if(${logName==null}) {
					location.href="login";
				} else {
					alert("선택하신 상품이 없습니다");
				}
			}
		});
	}
	
	<!-- 찜하기 클릭시 -->
	function dibsInsert(pno) {
		var optnameArr = [];
		var priceArr = [];
		var quantityArr = [];
		var pno = pno;
		var cnt = 0;
		$(".p_detailSelect_ul").each(function(idx, ul){
			var txt = $(ul).children().eq(0).text();
			var txtStart = txt.indexOf("(");
			var txtEnd = txt.indexOf(")")-3;
			var optname = txt.substr(txtStart+3, txtEnd-txtStart);
			optnameArr.push(optname);
			quantityArr.push($(ul).children().eq(1).children('.p_selectNum').text());
			priceArr.push($(ul).children().eq(2).children().val());
		});
		$.ajax({
			url : 'dibsInsert',
			dataType : 'json',
			type: "POST",
			data : {
				optnameArr : optnameArr,
				priceArr : priceArr,
				quantityArr : quantityArr,
				pno : pno
			}, success : function(result) {
				if(result>0) {
					if(confirm("찜목록에 등록되었습니다. 찜목록으로 이동하시겠습니까?")) {
						location.href="dibsList";
					} else {
						location.href="productView?pno=${vo.pno}";
					}
				} else {
					if(confirm("찜목록에 동일한 상품이 존재합니다. 찜목록으로 이동하시겠습니까?")) {
						location.href="dibsList";
					} else {
						location.href="productView?pno=${vo.pno}";
					}
				}
			}, error : function(e) {
				if(${logName==null}) {
					location.href="login";
				} else {
					alert("선택하신 상품이 없습니다");
				}
			}
		});
	}
	
	<!-- 바로구매 클릭시 -->
	function orderInsert(pno) {
		if(${logName==null || logName==''}) {
			location.href="login";
		}
		
		var optname = [];
		var price = [];
		var quantity = [];
		
		$(".p_detailSelect_ul").each(function(idx, ul){
			var txt = $(ul).children().eq(0).text();
			var txtStart = txt.indexOf("(");
			var txtEnd = txt.indexOf(")")-3;
			optname.push(txt.substr(txtStart+3, txtEnd-txtStart));
			price.push($(ul).children().eq(2).children().val());
			quantity.push($(ul).children().eq(1).children('.p_selectNum').text());
		});
		
		var form = document.createElement('form');
		var optnameArr = document.createElement('input');
		optnameArr.setAttribute('type', 'hidden');
		optnameArr.setAttribute('name', 'optnameArr');
		optnameArr.setAttribute('value', optname);
		var priceArr = document.createElement('input');
		priceArr.setAttribute('type', 'hidden');
		priceArr.setAttribute('name', 'priceArr');
		priceArr.setAttribute('value', price);
		var quantityArr = document.createElement('input');
		quantityArr.setAttribute('type', 'hidden');
		quantityArr.setAttribute('name', 'quantityArr');
		quantityArr.setAttribute('value', quantity);
		var pnoStr = document.createElement('input');
		pnoStr.setAttribute('type', 'hidden');
		pnoStr.setAttribute('name', 'pnoStr');
		pnoStr.setAttribute('value', pno);
		form.appendChild(optnameArr);
		form.appendChild(priceArr);
		form.appendChild(quantityArr);
		form.appendChild(pnoStr);
		form.setAttribute('method', 'post');
		form.setAttribute('action', "order");
		document.body.appendChild(form);
		form.submit();
	}
	
	<!-- 상품문의 글 등록하기 -->
	function pqnaInsert() {
		var data = $("#p_qna_hiddenFrm").serialize();
		$.ajax({
			url : 'pqnaInsert',
			data : data,
			type : 'POST',
			success : (result)=>{
				if(result>0) {
					alert("정상적으로 처리되었습니다.");
					$("#p_qna_hidden").hide();
					
					$.ajax({
						url : "pqnaView",
						data : "pno=${vo.pno}",
						success : function(result) {
							var tag = "";
							var $result = $(result);
							$result.each((idx, val)=>{
								tag += "<li><div>"
								if(val.panswercontent=='답변 대기중 입니다.'){
									tag += "<div class='p_qna_leftDiv'><img src='./img/question.jpg'/>";
									tag += "</div><div class='p_qna_rightDiv'><ul>";
									tag += "<li>답변대기중";
									if (val.pqnaopen=='Y' || val.userid=='${logId}') {
										if(val.userid=='${logId}'){
											tag += "<img src='./img/lock.jpg'/>";
											tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
										} else {
											tag += "<img src='./img/nolock.jpg'/>";
										}
										tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
										tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
									} else {
										tag += "<img src='./img/lock.jpg'/>";
										tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
										tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
									}
									tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
								} else {
									tag += "<div class='p_qna_leftDiv'><img src='./img/done.jpg'/></div>";
									tag += "<div class='p_qna_rightDiv'><ul><li>답변완료";
									if (val.pqnaopen=='Y' || val.userid=='${logId}') {
										if(val.userid=='${logId}'){
											tag += "<img src='./img/lock.jpg'/>";
											tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
										} else {
											tag += "<img src='./img/nolock.jpg'/>";
										}
										tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
										tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
									} else {
										tag += "<img src='./img/lock.jpg'/>";
										tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
										tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
									}
									tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
								}
								tag += "<div class='p_qna_hidden2'><h1>상품문의글 수정</h1><form method='post'>";
								tag += "<p>	문의글 공개여부선택 : ";
									if(val.pqnaopen=='Y') {
										tag += "<input type='radio' name='pqnaopen' value='Y' checked='checked'>공개";
										tag += "<input type='radio' name='pqnaopen' value='N'>비공개";
									} else {
										tag += "<input type='radio' name='pqnaopen' value='Y'>공개";
										tag += "<input type='radio' name='pqnaopen' value='N' checked='checked'>비공개";
									}
								tag += "</p><input type='hidden' name='pqnano' value='"+val.pqnano+"'/><input type='hidden' name='pno' value='"+val.pno+"'/>";
								tag += "<input type='text' name='pqnasubject' value='"+val.pqnasubject+"'/><br /><textarea name='pqnacontent'>"+val.pqnacontent+"</textarea><br/>";
								tag += "<input type='button' value='수정하기' class='clientMainBtn'/><button type='button' class='clientSubBtn'>취소하기</button>";
								tag += "</form></div>";
								tag += "</div></li>";
							});
							
							$("#p_pqnaSecondDiv").html(tag);
						}, error : function(e) {
							
						}
					});
				}
			}, error : (e)=>{
				location.href="login";
			}
		});
	}
	
	function pqnaDelete(pqnano) {
		if(confirm("문의글을 삭제하시겠습니까?")) {
			$.ajax({
				url : 'pqnaDelete',
				data : 'pqnano='+pqnano,
				type : 'POST',
				success : (result)=>{
					if(result>0) {
						alert("정상적으로 처리되었습니다.");
						
						$.ajax({
							url : "pqnaView",
							data : "pno=${vo.pno}",
							success : function(result) {
								var tag = "";
								var $result = $(result);
								$result.each((idx, val)=>{
									tag += "<li><div>"
									if(val.panswercontent=='답변 대기중 입니다.'){
										tag += "<div class='p_qna_leftDiv'><img src='./img/question.jpg'/>";
										tag += "</div><div class='p_qna_rightDiv'><ul>";
										tag += "<li>답변대기중";
										if (val.pqnaopen=='Y' || val.userid=='${logId}') {
											if(val.userid=='${logId}'){
												tag += "<img src='./img/lock.jpg'/>";
												tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
											} else {
												tag += "<img src='./img/nolock.jpg'/>";
											}
											tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
											tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
										} else {
											tag += "<img src='./img/lock.jpg'/>";
											tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
											tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
										}
										tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
									} else {
										tag += "<div class='p_qna_leftDiv'><img src='./img/done.jpg'/></div>";
										tag += "<div class='p_qna_rightDiv'><ul><li>답변완료";
										if (val.pqnaopen=='Y' || val.userid=='${logId}') {
											if(val.userid=='${logId}'){
												tag += "<img src='./img/lock.jpg'/>";
												tag += "&nbsp&nbsp&nbsp&nbsp<a href='#s' class='pqnaEditSpan'>수정</a> | <a href='javascript:pqnaDelete("+val.pqnano+")'>삭제</a>";
											} else {
												tag += "<img src='./img/nolock.jpg'/>";
											}
											tag += "</li><li><a class='p_qna_answer' href='#s'>"+val.pqnasubject+"</a></li>";
											tag += "<li style='display:none;'><div><p>Q. "+val.pqnacontent+"</p><p>A. "+val.panswercontent+"</p></div></li>"
										} else {
											tag += "<img src='./img/lock.jpg'/>";
											tag += "</li><li><a class='p_qna_answer' href='#s'>사용자의 요청에 의해 비공개처리된 글입니다.</a></li>";
											tag += "<li style='display:none;'><div><p>Q. 사용자의 요청에 의해 비공개처리된 글입니다.</p><p>A. 사용자의 요청에 의해 비공개처리된 글입니다.</p></div></li>";
										}
										tag += "</ul><div class='p_qna_sideDiv'>"+val.userid+" | "+val.pqnadate+"</div></div>";
									}
									tag += "<div class='p_qna_hidden2'><h1>상품문의글 수정</h1><form method='post'>";
									tag += "<p>	문의글 공개여부선택 : ";
										if(val.pqnaopen=='Y') {
											tag += "<input type='radio' name='pqnaopen' value='Y' checked='checked'>공개";
											tag += "<input type='radio' name='pqnaopen' value='N'>비공개";
										} else {
											tag += "<input type='radio' name='pqnaopen' value='Y'>공개";
											tag += "<input type='radio' name='pqnaopen' value='N' checked='checked'>비공개";
										}
									tag += "</p><input type='hidden' name='pqnano' value='"+val.pqnano+"'/><input type='hidden' name='pno' value='"+val.pno+"'/>";
									tag += "<input type='text' name='pqnasubject' value='"+val.pqnasubject+"'/><br /><textarea name='pqnacontent'>"+val.pqnacontent+"</textarea><br/>";
									tag += "<input type='button' value='수정하기' class='clientMainBtn'/><button type='button' class='clientSubBtn'>취소하기</button>";
									tag += "</form></div>";
									tag += "</div></li>";
								});
								
								$("#p_pqnaSecondDiv").html(tag);
							}, error : function(e) {
								
							}
						});
					}
				}, error : (e)=>{
					location.href="login";
				}
			});
		}
	}
	
</script>