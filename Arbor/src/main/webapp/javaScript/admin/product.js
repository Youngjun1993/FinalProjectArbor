$(function(){
	
	$(".pTitle").next().next().hide();
	
	$(".pTitle").next().click(function(){
		$(this).parent().next().next().css('display', 'none');
		$(this).next().show();
		$(this).hide();
	});
	
	$(".pTitle").next().next().click(function(){
		$(this).parent().next().next().css('display', 'block');
		$(this).hide();
		$(this).prev().show();
	});
	
	$("#description").summernote({
		height : 300, // 높이
		minHeight : 300, // 최소높이
		maxHeight : 300, // 최대높이
		focus : false, // 에디터 로딩 후 포커스 여부
		lang : "ko-KR", // 한글설정
		placeholder : '제품 상세설명 부분입니다.',
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
	
});

function optionAdd() {
	var tag = "";
		
	tag += " <input type='text' name='optname' placeholder='옵션명을 입력하세요'/>";
	tag += " <input type='text' name='optvalue' placeholder='옵션값을 입력하세요' />";
	tag += " <input type='color' name='rgbvalue'/>";
	tag += " <input type='text' name='optprice' placeholder='추가가격(-가능, 0가능)'/>";
	tag += " <button type='button' onclick='javascript:optionAdd()'>+</button>";
	
	$("#optionTbl").append(tag);
}