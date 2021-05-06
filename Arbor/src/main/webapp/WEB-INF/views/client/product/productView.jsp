<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<form>
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
					<option value="" selected disabled hidden>==선택하세요==</option>
						<c:forEach var="val" items="${optValue }">
							<c:if test="${val.optname==name.optname }">
								<option value="${val.optno }">${val.optvalue }
									<c:if test="${val.optprice!=0 }">(+${val.optprice })</c:if>
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
		<div id="p_detailSelect" class="clearfix">
			<div id="p_detailSelect_Div" class="clearfix">
				<ul class="p_detailSelect_ul">
					<li>${vo.pname } <input type="hidden" name="pno" value="${vo.pno }" /></li>
					<li>
						<button>-</button>
						<span class="p_selectNum">1</span>
						<button>+</button>
					</li>
					<li class="p_bigPrice"><fmt:formatNumber value="${vo.saleprice }" pattern="#,###"/>원</li>
					<li><img src="<%=request.getContextPath() %>/img/cancel.png"/></li>
				</ul>
			</div>
			<div id="p_totalDiv">
				총 상품금액 <span id="p_totalprice"><fmt:formatNumber value="${vo.saleprice }" pattern="#,###"/>원</span><br/>
				<input type="submit" value="찜하기" formaction="/cart" class="clientSubBtn"/>
				<input type="submit" value="장바구니" formaction="/cart" class="clientSubBtn"/>
				<input type="submit" value="바로구매" formaction="/order" class="clientMainBtn"/>
			</div>
		</div>
		</form>
<script>
	$(()=>{
		$("#p_detailOption").on('change', '.p_optname', ()=>{
			console.log(this.val());
			if($(this).val()!=null && $(this).val()!=0) {
				
			}
		});
	});
</script>
		<span id="p_detailMenu_up"></span>
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
	2	</div>
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
			<li>컨텐츠 참조</li>
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
	<div id="p_review">
		<h1>상품후기</h1>
		<h3>실제 사용하신 경험담을 글과 사진으로 남겨주시면 해당 상품 구매를 고민하시는 많은 분들께 도움이 됩니다.</h3>
		<hr/>
		<div>
			<div class="p_review_leftDiv">
				<img src="<%=request.getContextPath() %>/img/sublogo.jpg"/>
			</div>
			<div class="p_review_rightDiv">
				<p>이** (so*********) | 2021-04-21</p>
				<p>★★★★★</p><br/>
				<h3>만족만족</h3><br/>
				<p>후기후기 너모조코 넘모예뿌기 이렇게 옆으로 길게쓰면 덜 비어 보이게 됩 니 다 ~ 어떻습니까 여러분~~~~~~</p>
			</div>
		</div>
		<hr/>
		<div>
			<div class="p_review_leftDiv">
				<img src="<%=request.getContextPath() %>/img/sublogo.jpg"/>
			</div>
			<div class="p_review_rightDiv">
				<p>최** (le****) | 2021-04-20</p>
				<p>★★★★☆</p><br/>
				<h3>만족하긴하는데~</h3><br/>
				<p>후기후기 너모조코 넘모예뿌기<br/>
				근데 쪼꼼 아쉬워서 별한개빼기<br/>
				길어지면 어떻게 되지<br/>
				나랑<br/> 별보러<br/> 가지 않을래~~<br/></p>
			</div>
		</div>
		<hr/>
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
	<div id="p_pqna">
		<h1>상품문의</h1>
		<h3>해당 상품에 대한 문의만 답변이 가능하며 답변완료까지 1~5일이 소요될 수 있습니다.<br/>
		주문, 결제, 배송, 반품/교환 문의는 1:1문의를 이용해주세요.</h3>
		<a href="qnaList"><button type="button" class="clientSubBtn">1:1문의 바로가기</button></a><br/>
		<hr/>
		<div>
			<div class="p_qna_leftDiv">
				<img src="<%=request.getContextPath() %>/img/question.jpg"/>
			</div>
			<div class="p_qna_rightDiv">
				<ul>
					<li>
						답변대기중<img src="<%=request.getContextPath() %>/img/nolock.jpg"/>
					</li>
					<li><a class="p_qna_answer" href="#s">스툴 색상 변경 문의</a></li>
					<li>
						<div>
						<p>Q. 스툴을 두개 주문하면, 두 가지 색상을 각각 제가 지정할 수 있나요?</p>
						<p>답변대기중입니다.</p>
						</div>
					</li>
				</ul>
				<div class="p_qna_sideDiv">sou******** | 2021-04-21</div>
			</div>
		</div>
		<div>
			<div class="p_qna_leftDiv">
				<img src="<%=request.getContextPath() %>/img/done.jpg"/>
			</div>
			<div class="p_qna_rightDiv">
				<ul>
					<li>
						답변완료<img src="<%=request.getContextPath() %>/img/nolock.jpg"/>
					</li>
					<li><a class="p_qna_answer" href="#s">배송 한 달 걸리는게 맞나요?</a></li>
					<li>
						<div>
						<p>Q. 지금 주문하면 한 달 후에 배송 시작이라는데 맞나요?</p>
						<p>A. 해당상품은 주문량이 많아 예상 배송 시작일은 5월 중순 이후입니다. 변동사항이 발생되는 부분은 별도로 연락드리겠습니다. 감사합니다.</p>
						</div>
					</li>
				</ul>
				<div class="p_qna_sideDiv">nda*** | 2021-04-20</div>
			</div>
		</div>
		<div>
			<div class="p_qna_leftDiv">
				<img src="<%=request.getContextPath() %>/img/done.jpg"/>
			</div>
			<div class="p_qna_rightDiv">
				<ul>
					<li>
						답변완료<img src="<%=request.getContextPath() %>/img/lock.jpg"/>
					</li>
					<li>비공개처리된 문의글 입니다.</li>
				</ul>
				<div class="p_qna_sideDiv">hyu******** | 2021-04-19</div>
			</div>
		</div>
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