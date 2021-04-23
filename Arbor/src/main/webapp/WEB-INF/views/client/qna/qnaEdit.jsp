<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		CKEDITOR.replace('qnacontent'
                , {height: 350
        });
	});
</script>
<div id="y_qnaWrite_Wrap" class="w1400_container clearfix"> 
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
       <div id="y_write_rightcon" class="y_rightcon">
           <p class="y_title_fs25">1:1문의(Q&#38;A) 수정하기</p>
           <form id="y_frm" method="post" action="qnaEditOk">
           	   <input type="hidden" name="qnano" value="${vo.qnano }"/>
               <div>
               	<p>제목 <span class="colorRed">*</span>
                   <p>
                       <select name="qnacate" id="qnacate">
                           <option value="결제관련"<c:if test="${vo.qnacate=='결제관련' }">selected</c:if>>결제관련</option>
                           <option value="배송문의"<c:if test="${vo.qnacate=='배송문의' }">selected</c:if>>배송문의</option>
                           <option value="교환/반품"<c:if test="${vo.qnacate=='교환/반품' }">selected</c:if>>교환/반품</option>
                           <option value="기타"<c:if test="${vo.qnacate=='기타' }">selected</c:if>>기타</option>
                       </select>
                       <input type="text" name="qnasubject" id="qnasubject" value="${vo.qnasubject}" />
                   </p>
                   <p>내용 <span class="colorRed">*</span></p>
                   <p><textarea name="qnacontent" id="qnacontent">${vo.qnacontent}</textarea></p>
               </div>
               <input type="submit" name="y_insertBtn" id="y_insertBtn" value="수정하기" />
           </form>
       </div>
   </div>