<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/product.css" type="text/css"/>
<div class="w1400_container font_ng">
	<div id="sidefrm">사이드메뉴</div>
	<div id="centerfrm">
		<h1>상품 등록</h1>
		<form method="post" action="">
		<div id="insertInfo">
			<p>
				<span class=pTitle>상품 정보</span>
				<img src="<%=request.getContextPath() %>/img/downpage.png"/>
				<img src="<%=request.getContextPath() %>/img/downpage.png"/>
			</p><br/>
			<div>
				<span class="pContent">카테고리</span>
				<select name="maincate" id="maincate">
					<option value="거실">거실</option>
					<option value="침실">침실</option>
					<option value="드레스룸">드레스룸</option>
					<option value="Etc">Etc</option>
				</select>
				<select name="subcate" id="subcate">
					<option value="소파">소파</option>
					<option value="테이블">테이블</option>
					<option value="수납장">수납장</option>
				</select>
				<br/>
				<span class="pContent">상품명</span> <input type="text" name="pname" id="pname" />
				<span class="pContent">재고량</span> <input type="text" name="stock" id="stock" /><br/>
				<span class="pContent">상품가격</span> <input type="text" name="pprice" id="pprice" />
				<span class="pContent">할인가격</span> <input type="text" name="saleprice" id="saleprice" />
			</div>
		</div>
		<br/><br/>
		<div id="insertImg">
			<p><span class=pTitle>이미지 및 상세설명</span><img src="<%=request.getContextPath() %>/img/downpage.png"/></p><br/>
			<div>
				<h3>이미지</h3><br/>
				<input type="file" name="img1" id="img1" /><br/>
				<p>* 이미지 크기는 10MB, 1200PX이하로 등록</p>
				<div id="imgPrint">이미지 표시할 곳</div>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<h3>상세설명</h3><br/>
				<textarea name="description" id="description"></textarea>
				<script>CKEDITOR.replace("description");</script>
			</div>
			<br/>
		</div>
		<br/><br/>
		<div id="insertOption">
			<p><span class=pTitle>옵션선택 입력</span><img src="<%=request.getContextPath() %>/img/downpage.png"/></p><br/>
			<div>
				
			</div>
		</div>
		<p id="lastP"><input type="submit" value="저장"/><input type="reset" value="다시쓰기" /></p>
		</form>
	</div>
</div>