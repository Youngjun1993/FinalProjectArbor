<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/productInsert.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/productSearch.js"></script>
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
</head>
<body>
	<div class="w1400_container font_ng">
		<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
		<div id="centerfrm">
			<p id="pageTitle"><span>자주하는질문</span></p>
			<div id="insertInfo">
				<div id="faqWrite">
					<form method="post">
						<p><span class=pTitle>FAQ관리</span>
							<img src="<%=request.getContextPath() %>/img/downpage.png"/>
							<img src="<%=request.getContextPath() %>/img/uppage.png"/>
						</p><br/>
						<span id="selectCateSpan">카테고리</span>
						<select name="faqcate">
							<option value="" selected disabled hidden>==카테고리==</option>
							<option value="결제관련">결제관련</option>
							<option value="교환반품">교환반품</option>
							<option value="배송문의">배송문의</option>
						</select><br/>
						<input type="hidden" name="pno" value="${ans.pno }" />
						<input type="hidden" name="pqnano" value="${ans.pqnano }" />
						<span>제목</span><input type="text" name="pqnasubject" value="${ans.pqnasubject }"/><br/>
						<span>내용</span><textarea name="pqnacontent">${ans.pqnacontent }</textarea>
						<input type="submit" value="글등록" formaction="" class="adminMainBtn"><input type="reset" value="다시쓰기" class="adminSubBtn"/>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>