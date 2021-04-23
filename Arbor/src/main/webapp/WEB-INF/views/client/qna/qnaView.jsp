<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function qnaDel(qnano){
		if(confirm("삭제하시겠습니까?")){
			location.href="qnaDel?no=${vo.qnano}"
		}
	}
</script>
<div id="y_qnaView_wrap" class="w1400_container clearfix">
        <div id="y_leftMenu">
            <ul>
                <li class="y_title_fs25">My Page</li>
                <li><a href="#">구매내역</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">리뷰관리</a></li>
                <li><a href="qnaList">1:1문의</a></li>
                <li><a href="#">쿠폰내역</a></li>
                <li><a href="#">적립금내역</a></li>
                <li><a href="#">회원탈퇴</a></li>
            </ul>
        </div>
        <div id="y_qanView_rightcon" class="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A) 보기</p>
            <div>
                <h2>[${vo.qnacate}] ${vo.qnasubject }</h2>
                <div>
                    ${vo.qnacontent }
                </div>
            </div>
            <c:if test="${vo.answercontent == null || vo.answercontent == '' }">
	            <ul class="clearfix">
	                <li><a href="qnaList">목록</a></li>
	                <li><a href="javascript:qnaDel(${vo.qnano })">삭제</a></li>
	                <li><a href="qnaEdit?qnano=${vo.qnano }">수정</a></li>
	            </ul>
            </c:if>
            <c:if test="${vo.answercontent!=null }">
	            <div class="clearfix">
	                <p>답변</p>
	                <p>
	                    답변 등록일시 : ${vo.ansdate }<br/><br/>${vo.answercontent }
	                </p>
	            </div>
	            <div>
            		<a href="qnaList" id="y_qnaListBtn">목록</a>
            	</div>
            </c:if>            
        </div>
    </div>