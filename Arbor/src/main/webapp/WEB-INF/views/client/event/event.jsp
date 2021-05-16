<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<script src="<%=request.getContextPath() %>/javaScript/client/event.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<script>
	$(function(){
		var sEndDate = new Array();
		timeSaleAjax();
		
		//EVENT 메뉴 내에서 탭 클릭시 view 변경
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
		
		
		//==================== TIME SALE ====================
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
		
		
		//===================================================
		
		//EVENT 게시물 검색
		$(".searchFrm").submit(function(){
			if(!$(".j_searchWord").val()){
				alert("검색어를 입력하세요.");
				$(".j_searchWord").focus();
				return false;
			}
		});
		return true;
		
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
		<div class="j_tab-content" id="j_tab1_content">
			<div>
				<div id="timer"></div>
				<div id="timeSaleContent">
					<ul id="timeSaleSlider"></ul>
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
<%-- 		<ul class="paging clearfix">
				<c:if test="${pageVO.pageNum>1 }">
					<li style="border-bottom:none;"><a class="pagingLR_a" href="event?title=endEvent&pageNum=${pageVO.pageNum-1 }">＜</a></li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
					<c:if test="${p<=pageVO.totalPage }">
						<c:if test="${p==pageVO.pageNum }">
							<li style="border-bottom:3px solid rgb(93,121,115);"><a href="event?title=endEvent&pageNum=${p }">${p }</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum }">
							<li><a href="event?title=endEvent&pageNum=${p }">${p }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${pageVO.pageNum<pageVO.totalPage }">
					<li style="border-bottom:none;"><a class="pagingLR_a" href="event?title=endEvent&pageNum=${pageVO.pageNum+1 }">＞</a></li>
				</c:if>
			</ul> --%>
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
<%-- 		<ul class="paging clearfix">
				<c:if test="${pageVO.pageNum>1 }">
					<li style="border-bottom:none;"><a class="pagingLR_a" href="event?title=endEvent&pageNum=${pageVO.pageNum-1 }">＜</a></li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
					<c:if test="${p<=pageVO.totalPage }">
						<c:if test="${p==pageVO.pageNum }">
							<li style="border-bottom:3px solid rgb(93,121,115);"><a href="event?title=endEvent&pageNum=${p }">${p }</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum }">
							<li><a href="event?title=endEvent&pageNum=${p }">${p }</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${pageVO.pageNum<pageVO.totalPage }">
					<li style="border-bottom:none;"><a class="pagingLR_a" href="event?title=endEvent&pageNum=${pageVO.pageNum+1 }">＞</a></li>
				</c:if>
			</ul> --%>
		</div>
	</div>
</div>
</body>
</html>


