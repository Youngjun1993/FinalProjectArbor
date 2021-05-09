$(function(){
	
	//datepicker 옵션 설정
	$.datepicker.setDefaults({
		dateFormat: "yy-mm-dd",
		dayNamesMin: ['일','월','화','수','목','금','토'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		yearSuffix: "년",
		showOtherMonths: true,		//빈 공간에 앞뒤월의 날짜 표시
		showMonthAfterYear:true,	//년+월
		changeYear: true,			//콤보박스 연도 선택 가능
		changeMonth: true,			//콤보박스 월 선택 가능
		minDate: 0,					//금일 이전 선택 불가
		showOn: "both",				//both:버튼을 누르거나 input을 클릭하면 달력 표시	
       	//buttonImage: "../../../img/calendar2.png",
       	//buttonImageOnly: true
       	buttonText: '달력선택'
	});
	$("#j_eventStart").datepicker({
		onClose : function(selectedDate){
	    	$("#j_eventEnd").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#j_eventEnd").datepicker({
		onClose : function(selectedDate){
	    	$("#j_eventStart").datepicker("option", "maxDate", selectedDate);
	    }
	});

	//summernote
	$("#j_eventContent").summernote({
		height: 300,
		minHeight: 300,
		maxHeight: 300,
		focus: false,
		lang: "ko-KR",
		callbacks: {
			onImageUpload: function(files){
				uploadSummernoteImageFile(files[0], this);
			},
			onPaste: function(e){
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
			['fontname', ['fontname']],
			['fontsize', ['fontsize']],
			['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			['color', ['forecolor', 'color']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['insert', ['picture', 'link']]
		],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
	
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data: data,
			type: 'POST',
			url: 'uploadSummernoteImageFile',
			contentType: false,
			processData: false,
			success: function(data) {
				console.log(data);
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
});
