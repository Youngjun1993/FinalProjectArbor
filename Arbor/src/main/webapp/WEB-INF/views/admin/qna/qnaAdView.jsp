<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/qna.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function qnaAdDel(qnano){
		if(confirm("삭제하시겠습니까?")){
			location.href="qnaAdDel?no=${vo.qnano}"
		}
	}
	$(function(){
		$("#qnaAdViewFrm").submit(function(){
			if($("#ansercontent").val()==""){
				alert("답변 내용을 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
	<div id="y_qnaView_wrap" class="w1400_container clearfix">
        <div id="y_leftMenu">
        	공통메뉴
        </div>
        <div id="y_qanView_rightcon" class="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A) 삭제/답변등록</p>
            <div>
                <h2>[${vo.qnacate}] ${vo.qnasubject }</h2>
                <div>
                    ${vo.qnacontent }
                </div>
            </div>
            <ul class="clearfix">
                <li><a href="qnaAdList?pageNum=${pageVO.pageNum }<c:if test="${pageVO.qnaSearchWord != null && pageVO.qnaSearchWord != ''}">&qnaSearchKey=${pageVO.qnaSearchKey }&qnaSearchWord=${pageVO.qnaSearchWord }</c:if>">목록</a></li>
                <li><a href="javascript:qnaAdDel(${vo.qnano })">문의글 삭제</a></li>               
            </ul>
            <div class="clearfix">
                <p>답변</p>
                <form id="qnaAdViewFrm" method="post" action="qnaAdUpdate?${editAddr }">
                    <textarea name="answercontent" id="answercontent" cols="30" rows="10">${vo.answercontent }</textarea> 
                    <c:if test="${vo.answercontent==null }"><input type="submit" id="qnaAnserBtn" value="답변등록"/></c:if>
                    <c:if test="${vo.answercontent!=null }"><input type="submit" id="qnaAnserBtn" value="수정등록"/></c:if>
                </form>
            </div>
        </div>
    </div>
</body>
</html>