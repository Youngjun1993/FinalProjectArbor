<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/productInsert.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/lang/summernote-ko-KR.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/product.js"></script>
<script>

</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<div id="sidefrm">사이드메뉴</div>
		<div id="centerfrmEdit">
			<h1>상품 수정</h1>
			<form method="post" action="productEditOk" enctype="multipart/form-data" autocomplete="off">
			<div id="insertInfo">
				<p><span class=pTitle>상품 정보</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<span class="pContent">카테고리</span>
					<select name="mainno" id="maincate">
						<c:forEach var="mainCate" items="${mainCate }">
							<c:if test="${vo.mainno==mainCate.mainno }">
								<option value=${mainCate.mainno } selected>${mainCate.mainname }</option>
							</c:if>
							<c:if test="${vo.mainno!=mainCate.mainno }">
								<option value=${mainCate.mainno }>${mainCate.mainname }</option>
							</c:if>
						</c:forEach>
					</select>
					<select name="subno" id="subcate">
						<c:forEach var="subCate" items="${subCate }">
							<c:if test="${vo.subno==subCate.subno }">
								<option value=${subCate.subno } selected>${subCate.subname }</option>
							</c:if>
							<c:if test="${vo.subno!=subCate.subno }">
								<option value=${subCate.subno }>${subCate.subname }</option>
							</c:if>
						</c:forEach>
					</select>
					<br/>
					<input type="hidden" name="pno" value="${vo.pno }"/>
					<span class="pContent">상품명</span> <input type="text" name="pname" id="pname" value="${vo.pname }"/>
					<span class="pContent">추가입고량</span> <input type="text" name="allstock" id="allstock" value=0 /><br/>
					<input type="hidden" name="stock" value="${vo.stock }"/>
					<span class="pContent">상품가격</span> <input type="text" name="pprice" id="pprice" value="${vo.pprice }"/>
					<span class="pContent">할인가격</span> <input type="text" name="saleprice" id="saleprice" value="${vo.saleprice }"/>
				</div>
			</div>
			<br/><br/>
			<div id="insertImg">
				<p><span class=pTitle>이미지 및 상세설명</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div id="editImg">
					<h3>이미지</h3><br/>
					<div>
						<div>${vo.img1 } <img src="<%=request.getContextPath() %>/img/cancel.png" class="imgEdit"/></div>
						<input type="hidden" name="" value="${vo.img1 }" />
						<input type="hidden" name="filename" />
					</div>
					<br/>
					<c:if test="${vo.img2!='' && vo.img2!=null }">
					<!-- 두번째 파일 있을 때 -->
						<div>
							<div>${vo.img2 } <img src="<%=request.getContextPath() %>/img/cancel.png" class="imgEdit"/></div>
							<input type="hidden" name="" value="${vo.img2 }" />
							<input type="hidden" name="filename"/>
						</div>
					</c:if>
					<c:if test="${vo.img2=='' || vo.img2==null}">
					<!-- 두번째 파일 없을 때 -->
						<input type="file" name="img2"/>
					</c:if>
					<br/>
					<p>* 첫번째 이미지는 목록에 띄워질 메인이미지<br/><span id="secondP">두번째 이미지는 서브이미지 입니다.</span></p>
					<div id="imgPrint"><img src="<%=request.getContextPath() %>/img/noimg.png"/></div>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h3>상세설명</h3><br/>
					<textarea name="description" id="description">${vo.description }</textarea>
				</div>
				<br/>
			</div>
			<br/><br/>
			<div id="insertOption">
				<p><span class="pTitle">옵션선택 입력</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div id="optionTbl">
					<div>
						<b>* 이미지를 참조하여 정확한 값을 입력해주세요 *<br/>
						색상 옵션명에 대한 값을 입력시에만, 색상값을 선택해주세요.</b>
						<br/><br/>
						<img src="<%=request.getContextPath() %>/img/option.png"/>
					</div>
					<c:forEach var="opt" items="${optList }">
						<div class="optionList">
							<input type="text" name="optname" value="${opt.optname }"/>
							<input type="text" name="optvalue" value="${opt.optvalue }"/>
							<input type='color' name='rgbvalue' value="${opt.rgbvalue }"/>
							<input type="text" name="optprice" value="${opt.optprice }"/>
							<input type="hidden" name="optno" value="${opt.optno }"/>
							<input type="hidden" name="deleteno" value=""/>
							<img src="<%=request.getContextPath() %>/img/plus.png" class="plus"/>
							<img src="<%=request.getContextPath() %>/img/minus.png" class="minus"/>
						</div>
					</c:forEach>
				</div>
			</div>
			<p id="lastP"><input type="submit" value="수정완료"/><input type="reset" value="다시쓰기" /></p>
			</form>
		</div>
	</div>
</body>
</html>