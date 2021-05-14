$(function(){

	//EVENT 메뉴 내에서 탭 클릭시 view 변경
	var sEndDate = new Array();
	timeSaleAjax();
	
	$(".j_tabLbl").click(function(){
		var title = $(this).text();
		$(".j_eventMenu").text(title);
		
		if(title=="TIME SALE"){
			runSlider();
			runTimer(sEndDate[0]);
		}
	});
	
	//header-EVENT 서브메뉴 클릭시 이벤트 탭 이동
	var title = "${title}";
		if(title=="timeSale"){	//타임세일 tab -> 타임세일 이미지, 시간 불러오기 **
			$("#j_tab1").prop("checked",true);
		}
		else if(title=="nowEvent"){
			$("#j_tab2").prop("checked",true);
		}		
		else if(title=="endEvent"){
			$("#j_tab3").prop("checked",true);
		}
		let chkr = $(".j_tab-wrap [name='tabs']:checked").next().text();
		$(".j_eventMenu").text(chkr);
	//////////////////////////////////////////////////////////	
	
	/*--------------
		TIME SALE
	---------------*/
	//타임세일 데이터 가져오기
	function timeSaleAjax(){
		$.ajax({
				url: 'getTimeSale',
				dataType: 'json',
				success: function(list){
					console.log(list);
					var tag = "";
					$.each(list, function(idx, vo){
						tag += "<li><a href=\"#\">";
						tag += vo.saleContent;
						tag += "</a></li>";
						sEndDate[idx] = vo.saleEnd;
					});
					console.log(tag);
					$("#timeSaleSlider").html(tag);
				}
		});
	}
	
	//타임세일 tab - 타이머 구현
	var timer;
	function runTimer(saleEndDate){
		clearInterval(timer);
		var saleEnd = new Date(saleEndDate);
		var _second = 1000;
		var _minute = _second*60;
		var _hour = _minute*60;
		var _day = _hour*24;
		
		function showCountDown(){
			var now = new Date();
			var interval = saleEnd - now;
			
			if(interval<0){
				clearInterval(timer);
				document.getElementById("timeSaleContent").textContent="해당 이벤트가 종료 되었습니다.";
				return;
			}
			
			//남은 시간 계산
			var days = Math.floor(interval / _day);
			var hours = Math.floor((interval % _day) / _hour);
			var minutes = Math.floor((interval % _hour) / _minute);
			var seconds = Math.floor((interval % _minute) / _second);

			var setTimer = "<span class='d-day'>D-"+days+" </span>";
			setTimer += hours+"시간 ";
			setTimer += minutes+"분 ";
			setTimer += seconds+"초";
			$("#timer").html(setTimer);
		}
		timer = setInterval(showCountDown, 1000);
	}
	
	//타임세일 슬라이드
	function runSlider(){
		var mys = $("#timeSaleSlider").bxSlider({
			mode: 'horizontal',
			slideWidth: 800,
			slideHeight: 500,
			auto: true,
			infiniteLoop: true,
			onSlideBefore:function(){
			//onSlideAfter:function(){
			//onSliderLoad:function(){
				//console.log("@@ 타임세일 슬라이드 실행 @@");
				index = mys.getCurrentSlide();
			 	console.log(index);
			 	console.log(sEndDate[index]);
			 	runTimer(sEndDate[index]);
			}
		});
	};
	
	//페이징 li만큼 갯수
	var liCnt = $(".paging>li").length;
	$(".paging").css({
		"width" : liCnt*40+"px",
		"margin" : "30px auto"
	});	
	//////////////////////////////////////////////////////////
	
	//EVENT 게시물 검색
	$(".searchFrm").submit(function(){
		if($(".j_searchWord").val()==""){
			alert("검색어를 입력하세요.");
			$(".j_searchWord").focus();
			return false;
		}
	});
	return true;
	
});