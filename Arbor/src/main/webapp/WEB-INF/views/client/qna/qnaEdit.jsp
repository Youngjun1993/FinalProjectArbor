<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		<!-- summerNote -->
		$("#qnacontent").summernote({
			height : 300, // 높이
			minHeight : 300, // 최소높이
			maxHeight : 300, // 최대높이
			focus : false, // 에디터 로딩 후 포커스 여부
			lang : "ko-KR", // 한글설정
			callbacks : {
				onImageUpload : function(files) {
					<!-- 써머노트에서 지원하는 callback 함수 / 이미지를 업로드할 때 onImageUpload -->
					uploadSummernoteImageFile(files[0], this);
				},
				onPaste : function(e) {
					<!-- 솔직히 여기부분 이해못함 (네이버 블로그 참조해뜸..) -->
					var clipboardData = e.originalEvent.clipboardData;
					if(clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if(item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			},
			toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['insert',['picture','link']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : 'POST',
			url : 'uploadSummernoteImageFile',
			contentType : false,
			processData : false,
			success : function(data) {
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
</script>
<div id="y_qnaWrite_Wrap" class="w1400_container clearfix"> 
       <div id="y_leftMenu">
           <ul>
	           <li class="y_title_fs25">My Page</li>
	           <li><a href="purchaseList">구매내역</a></li>
	           <li><a href="memberEdit">회원정보수정</a></li>
	           <li><a href="reviewList">리뷰관리</a></li>
	           <li><a href="qnaList">1:1문의</a></li>
	           <li><a href="couponList">쿠폰내역</a></li>
	           <li><a href="pointList">적립금내역</a></li>
	           <li><a href="memberDel">회원탈퇴</a></li>
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