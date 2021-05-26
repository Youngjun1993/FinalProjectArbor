<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<%-- <script src="<%=request.getContextPath() %>/javaScript/client/event.js"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.14/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.14/jquery.bxslider.min.js"></script>
<script>
	$(function(){
		var sEndDate = new Array();
		//타임세일 데이터 가져오기
		$.ajax({
			url: 'getTimeSale',
			dataType: 'json',
			async: false,
			success: function(list){
				console.log("list:"+list);
				var tag = "";
				$.each(list, function(idx, vo){
					tag += "<li><a href='productView?pno="+vo.pNo+"'>";
					tag += vo.saleContent;
					tag += '</a></li>';
					sEndDate[idx] = vo.saleEnd;
				});
				console.log("tag:"+tag);
				$("#timeSaleSlider").html(tag);
			},
			error: function(){alert('error');}
		});
		
		runTimer(sEndDate[0]);
		//타임세일 슬라이드
		var mys = $("#timeSaleSlider").bxSlider({
			mode: 'horizontal',
			slideWidth: 800,
			slideHeight: 500,
			auto: true,
			infiniteLoop: true,
			//controls: false,
			//autoControls: false,
			//autoHover: true,
			touchEnabled : false,
			//preventDefaultSwipeY: false,
			//touchEnabled : (navigator.maxTouchPoints > 0),
			//responsive:true,
			
			//nextSelector: '.bx-next-arrow',
		  	//prevSelector: '.bx-prev-arrow',
			//nextText: 'Onward →',
			//prevText: '← Go back',
			
			//onSlideNext:function(){
				//index = mys.getCurrentSlide();
			 	//runTimer(sEndDate[index]);
			//}
		});
		
		//header-EVENT 서브메뉴 클릭시 이벤트 탭 이동
		var title = "${title}";
		if(title=="timeSale"){	//타임세일 tab -> 타임세일 이미지, 시간 불러오기 **
			$("#j_tab1").prop("checked",true);
			console.log("##헤더->타임세일ㄹㄹㄹㄹ")
			runTimer(sEndDate[0]);
			mys.reloadSlider({
				auto: true,
				onSlideNext:function(){
					index = mys.getCurrentSlide();
				 	runTimer(sEndDate[index]);
				}
			});
		}
		else if(title=="nowEvent"){
			$("#j_tab2").prop("checked",true);
		}		
		else if(title=="endEvent"){
			$("#j_tab3").prop("checked",true);
		}
		let chkr = $(".j_tab-wrap [name='tabs']:checked").next().text();
		$(".j_eventMenu").text(chkr);
		
		//EVENT 메뉴 내에서 탭 클릭시 view 변경
		$(document).on("click",".j_tabLbl", function(e){
			var title = $(this).text();
			$(".j_eventMenu").text(title);
			
			if(title=="TIME SALE"){
				location.href="event?title=timeSale";
			}else if(title=="진행중인 이벤트"){
				location.href="event?title=nowEvent";
			}else if(title=="지난 이벤트"){
				location.href="event?title=endEvent";				
			}
		});
		
		//==================== TIME SALE ====================
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
				console.log(_day +','+days);
				var hours = Math.floor((interval % _day) / _hour);
				var minutes = Math.floor((interval % _hour) / _minute);
				var seconds = Math.floor((interval % _minute) / _second);
				$("#timer>ul:first-child li:nth-child(1)").text(days);
				$("#timer>ul:first-child li:nth-child(2)").text(hours);
				$("#timer>ul:first-child li:nth-child(3)").text(minutes);
				$("#timer>ul:first-child li:nth-child(4)").text(seconds);
			}
			timer = setInterval(showCountDown, 500);
		}
		
		//페이징 li만큼 갯수
		var liCnt = $(".paging>li").length;
		$(".paging").css({
			"width" : liCnt*40+"px",
			"margin" : "30px auto"
		});	
		
		//EVENT 게시물 검색
		$(".searchFrm").submit(function(){
			if(!$(".j_searchWord").val()){
				alert("검색어를 입력하세요.");
				$(".j_searchWord").focus();
				return false;
			}
			return true;
		});
	});
	
</script>
</head>
<body>

<div class="w1400_container font_ng" id="j_eventFrm">
	<div class="j_eventMenu">
		<span>TIME SALE</span>
	</div>
	<div class="j_tab-wrap">
		<input type="radio" name="tabs" class="j_tabs" id="j_tab1">
		<label for="j_tab1" class="j_tabLbl">TIME SALE</label>

		<input type="radio" name="tabs" class="j_tabs" id="j_tab2" checked>
		<label for="j_tab2" class="j_tabLbl">진행중인 이벤트</label>

		<input type="radio" name="tabs" class="j_tabs" id="j_tab3">
		<label for="j_tab3" class="j_tabLbl">지난 이벤트</label>
		
		<!-- 타임세일 -->
		<div class="j_tab-content" id="j_tab1_content" style="background-image: url(./img/timesale.jpg);">
			<div>
				<div id="timer" class="clearfix">
					<ul class="clearfix">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
			         <ul class="clearfix">
			             <li>Days</li>
			             <li>Hours</li>
			             <li>Minutes</li>
			             <li>Seconds</li>
			         </ul>				
				</div>
				<div id="timeSaleContent">
					<ul id="timeSaleSlider"></ul>
				</div>
				<div class="outside">
					<p>
						<span id="slider-prev"></span>
						<span id="slider-next"></span>
					</p>
				</div>
			</div>
		</div>
		
		<!-- 진행중인 이벤트 -->
		<div class="j_tab-content" id="j_tab2_content">
			<div class="clearfix j_search">
				<form method="post" class="searchFrm" action="event?title=nowEvent">
					<select id="j_searchKey" name="searchKey">
						<option value="eventSubject">제목</option>
						<option value="eventContent">내용</option>
					</select>
					<input type="text" name="searchWord" class="j_searchWord" placeholder="검색어 입력"/>
					<input type="submit" class="clientMainBtn j_eventBtn" value="검색"/>
				</form>
			</div>
			<div>
				<ul class="clearfix" id="j_eventList">
					<c:forEach var="vo" items="${list }">
					<li>
						<span>
							<a href="eventContent?eventNo=${vo.eventNo }">
								<img src="./upload/${vo.eventImg1}"><br/>
								<strong>${vo.eventSubject }</strong>
							</a>						
						</span>
						<p>${vo.eventStart } ~ ${vo.eventEnd }</p>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<!-- 지난 이벤트 -->
		<div class="j_tab-content" id="j_tab3_content">
			<ul class="clearfix">
				<li>번호</li>
				<li></li>
				<li>이벤트 항목</li>
				<li>이벤트 기간</li>
				
				<c:forEach var="vo" items="${endList }">
					<li>${vo.eventNo }</li>
					<li></li>
					<li class="wordcut j_subejct"><a href="eventContent?eventNo=${vo.eventNo }">${vo.eventSubject }</a></li>
					<li>${vo.eventStart } ~ ${vo.eventEnd }</li>
				</c:forEach>
			</ul>
			<div class="clearfix j_search">
				<form method="post" class="searchFrm" action="event?title=endEvent">
					<select id="j_searchKey" name="searchKey">
						<option value="eventSubject">제목</option>
						<option value="eventContent">내용</option>
					</select>
					<input type="text" name="searchWord" class="j_searchWord" placeholder="검색어 입력"/>
					<input type="submit" class="clientMainBtn j_eventBtn" value="검색"/>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>


