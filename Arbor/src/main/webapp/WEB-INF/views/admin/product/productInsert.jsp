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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/summernote/lang/summernote-ko-KR.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/product.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<script>
</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>상품 등록</span></p>
			<form method="post" action="productInsertOk" enctype="multipart/form-data" autocomplete="off">
			<div id="insertInfo">
				<p><span class=pTitle>상품 정보</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<span class="pContent">카테고리</span>
					<select name="mainno" id="maincate">
						<c:forEach var="mainCate" items="${mainCate }">
							<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
								<option value=${mainCate.mainno }>${mainCate.mainname }</option>
							</c:if>
						</c:forEach>
					</select>
					<select name="subno" id="subcate">
						<c:forEach var="subCate" items="${subCate }">
							<option value=${subCate.subno }>${subCate.subname }</option>
						</c:forEach>
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
				<p><span class=pTitle>이미지 및 상세설명</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<h3>이미지등록</h3><br/>
					<p id="p_insertImgDiv">* 목록에 띄워질 메인이미지 선택</p>
					<input type="file" name="imgName1" id="img1" /><br/>
					<p>* 마우스 이동에 따라 변환될 서브 이미지 선택</p>
					<input type="file" name="imgName2" id="img2" /><br/>
					<div id="imgPrint"><img src="<%=request.getContextPath() %>/img/noimg.png"/></div>
					<h3>상세설명</h3><br/>
					<textarea name="description" id="description"></textarea>
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
					<div class="optionList">
						<input type="text" name="optname" placeholder="옵션명을 입력하세요"/>
						<input type="text" name="optvalue" placeholder="옵션값을 입력하세요"/>
						<input type='color' name='rgbvalue'/>
						<input type="text" name="optprice" placeholder="추가 가격(-가능, 0가능)"/>
						<img src="<%=request.getContextPath() %>/img/plus.png" class="plus"/>
						<img src="<%=request.getContextPath() %>/img/minus.png" class="minus"/>
					</div>
				</div>
			</div>
			<p id="lastP"><input type="submit" value="저장" class="adminMainBtn"/><input type="reset" value="다시쓰기" class="adminSubBtn"/></p>
			</form>
		</div>
	</div>
</body>
</html>