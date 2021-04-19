<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w1400_container font_ng">
	<h1 id="detailTitle">소파</h1>
	<hr />
	<div id="detail">
		<!-- 모델명, 이미지 띄울 곳 -->
		<div id="detailImg">
			<h2>BMA-1150-LC</h2>
			<img src="<%=request.getContextPath() %>/img/sofa2.jpg"/>
		</div>
		<!-- 이미지 옆에 기본정보, 옵션 띄우는 곳
		div 분리되어있어서 form을 여기부터 걸었음... -->
		<form>
		<div id="detailRight">
			<div id="detailInfo">
				<h3>기본정보</h3>
				<ul>
					<li>판매가</li>
					<li><span class="bigPrice">600,000원 ~</span></li>
					<li>정상가</li>
					<li><span class="smallPrice">900,000원 ~</span></li>
					<li>배송가능지역</li>
					<li>전국</li>
					<li>배송방법</li>
					<li>직배송</li>
					<li>배송비</li>
					<li>30,000원(추가비용 상세페이지 참고)</li>
				</ul>
			</div>
			<div id="detailOption">
				<h3>상품옵션</h3>
				<span class="optTitle">색상</span>
				<select name="optname" class="optname">
					<option value="네이비">네이비</option>
					<option value="그레이">그레이</option>
					<option value="아이보리">아이보리</option>
				</select><br/>
				<span class="optTitle">스툴포함여부</span>
				<select name="optname" class="optname">
					<option value="포함">포함(+80,000)</option>
					<option value="포함안함">포함안함</option>
				</select>
			</div>
		</div>
		<!-- 옵션 선택 시 띄울 공간 -->
		<div id="detailSelect">
			<ul>
				<li>색상 : 네이비</li>
				<li>
					<button>+</button>
					<span class="selectNum">1</span>
					<button>-</button>
				</li>
				<li class="bigPrice">600,000원</li>
				<li><img src="<%=request.getContextPath() %>/img/cancel.png"/></li>
			</ul>
			<ul>
				<li>스툴포함여부 : 포함(+80,000)</li>
				<li>
					<button>+</button>
					<span class="selectNum">1</span>
					<button>-</button>
				</li>
				<li class="bigPrice">80,000원</li>
				<li><img src="<%=request.getContextPath() %>/img/cancel.png"/></li>
			</ul>
			<div>
				총 상품금액 <span id="totalprice">680,000원</span><br/>
				<input type="submit" value="찜하기" formaction="/cart" />
				<input type="submit" value="장바구니" formaction="/cart" />
				<input type="submit" value="바로구매" formaction="/order" />
			</div>
		</div>
		</form>
	</div>
	<div id="detailMenu">
		<ul>
			<li>상품상세</li>
			<li>상품후기</li>
			<li>상품문의</li>
			<li>배송안내</li>
		</ul>
	</div>
	<div id="detailView">
		<h2>상품필수정보</h2>
		<h3>전자상거래 등에서의 상품정보제공 고시에 따라 작성되었습니다.</h3>
		<ul>
			<li>품명 및 모델명</li>
			<li>BMA-1150-LC</li>
			<li>색상</li>
			<li>컨텐츠 참조</li>
			<li>구성품</li>
			<li>컨텐츠 참조</li>
			<li>주요 소재</li>
			<li>인조가죽</li>
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
		<img src="<%=request.getContextPath() %>/img/detail3.jpg"/>
	</div>
</div>