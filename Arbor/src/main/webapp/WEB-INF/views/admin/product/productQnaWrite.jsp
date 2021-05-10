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
			<p id="pageTitle"><span>상담문의답변</span></p>
			<div id="insertInfo">
				<div id="pqnaAnswerOk">
					<form method="post">
						<p><span class=pTitle>질문내용</span>
							<img src="<%=request.getContextPath() %>/img/downpage.png"/>
							<img src="<%=request.getContextPath() %>/img/uppage.png"/>
						</p><br/>
						<span>상품명</span><input type="text" name="pname" value="${ans.pname }" disabled/><br/>
						<span>작성자</span><input type="text" name="userid" value="${ans.userid }" disabled/><br/>
						<input type="hidden" name="pno" value="${ans.pno }" />
						<input type="hidden" name="pqnano" value="${ans.pqnano }" />
						<span>제목</span><input type="text" name="pqnasubject" value="${ans.pqnasubject }" disabled/><br/>
						<span>내용</span><textarea name="pqnacontent" disabled>${ans.pqnacontent }</textarea>
						<p><span class=pTitle>답변하기</span>
							<img src="<%=request.getContextPath() %>/img/downpage.png"/>
							<img src="<%=request.getContextPath() %>/img/uppage.png"/>
						</p><br/>
						<c:if test="${ans.panswercontent==null || ans.panswercontent=='' }">
						<textarea name="panswercontent" placeholder="답변내용을 기재해 주세요"></textarea><br/>
						<input type="submit" value="글삭제" formaction="javascript:pqnaAnswerDelete(${ans.pqnano })" class="adminSubBtn"><input type="submit" value="답변등록" class="adminMainBtn" formaction="pqnaAnswerInsert"/>
						</c:if>
						<c:if test="${ans.panswercontent!=null && ans.panswercontent!='' }">
						<textarea name="panswercontent">${ans.panswercontent }</textarea><br/>
						<input type="submit" value="글삭제" formaction="javascript:pqnaAnswerDelete(${ans.pqnano })" class="adminSubBtn"><input type="submit" value="수정" formaction="pqnaAnswerEdit" class="adminMainBtn">
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>