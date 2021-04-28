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
	
	<!-- summerNote -->
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
	
	// mainCate, subCate 셀렉트 박스 변환
	$("#maincate").change(function() {
		var url="subCateList";
		var param = "mainno="+$(this).val();
		$.ajax({
			url : url,
			data : param,
			success : function(result) {
				var $result = $(result);
				var tag="";
				$result.each(function(idx, val){
					tag += "<option value='"+val.subno+"'>"+val.subname+"</option>";
				});
				$("#subcate").html(tag);
			}, error : function(e) {
			
			}
		});
	});
	
	// 파일 이미지 div에 띄우기
	$("#img1").on('change', function(){
         readURL(this);
    });
    $("#img2").on('change', function(){
         readURL(this);
    });
	
    function readURL(input) {
	      if (input.files && input.files[0]) {
	         var reader = new FileReader();
	
	         reader.onload = function (e) {
	            $('#imgPrint').children().attr('src', e.target.result);
	         }
	
	         reader.readAsDataURL(input.files[0]);
	      }
	};
	
	// product Insert 유효성검사
	$("#centerfrm>form").on('submit', function(){
		if($("#pname").val()=='' || $("#pname").val()==null) {
			alert("상품명은 필수 입력 항목입니다.");
			return false;
		} else if($("#stock").val()=='' || $("#stock").val()==null){
			alert("재고량(입고량)은 필수 입력 항목입니다.");
			return false;
		} else if($("#pprice").val()=='' || $("#pprice").val()==null){
			alert("상품 가격은 필수 입력 항목입니다.");
			return false;
		} else if ($("#img1").val()=='' || $("#img1").val()==null){
			alert("상품 목록에 표시될 파일이므로, 이미지파일 최소 한개는 첨부해주셔야 합니다.");
			return false;
		} else if ($(".optionList>input[name=optname]).val()=='' || $(".optionList>input[name=optname]).val()==null) {
			alert("옵션명은 필수 입력항목으로, 추가옵션이 없는경우 삭제해주세요");
			return false;
		}
		return true;
	});
	
	/* 옵션 추가 및 삭제 */
	$(document).on("click",".plus", function(){
		
		var tag = "<div class='optionList'>";	
		tag += " <input type='text' name='optname' placeholder='옵션명을 입력하세요'/>";
		tag += " <input type='text' name='optvalue' placeholder='옵션값을 입력하세요' />";
		tag += " <input type='color' name='rgbvalue' style='width:50px; vertical-align: middle;'/>";
		tag += " <input type='text' name='optprice' placeholder='추가가격(-가능, 0가능)'/>";
		tag += " <img src='./img/plus.png' class='plus'/>";
		tag += " <img src='./img/minus.png' class='minus'/>";
		tag += "</div>";
		
		$(this).next().after(tag);
	});
	
	$(document).on("click",".minus", function(){
		$(this).parent().remove();
	});
	
	/* productEdit - 파일삭제 */
	$("#insertImg b").on('click', ()=>{
		$(this).parent().css('display', 'none');
		$(this).parent().next().attr('name', 'delFile');
		$(this).parent().next().next().attr('type', 'file');
	});
	
	
	// Datepicker
	$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
	$("#startDate").datepicker({
		changeMonth: true, 
	    changeYear: true,
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dateFormat: "yy-mm-dd",
	    maxDate: 0, // 오늘일자 이후 선택불가 설정
	    onClose : function(selectedDate){
	    	// 시작일 datepicker가 닫히면 종료일 datepick는 시작일 이전 선택불가하게 설정
	    	$("#endDate").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#endDate").datepicker({ 
	    changeYear: true,
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dateFormat: "yy-mm-dd",
	    maxDate: 0, // 오늘일자 이후 선택불가 설정
	    onClose : function(selectedDate){
	    	// 종료일 datepicker가 닫히면 시작일 datepick는 종료일 이후 선택불가하게 설정
	    	$("#startDate").datepicker("option", "maxDate", selectedDate);
	    }
	});
});
