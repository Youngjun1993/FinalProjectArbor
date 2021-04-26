<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<script>
	$(function(){
		//EVENT 메뉴 내에서 탭 클릭시 view 변경
		$(".j_tabLbl").click(function(){
			var title = $(this).text();
			$(".j_eventMenu").text(title);
		});		
		//header-EVENT 서브메뉴 클릭시 이벤트 탭 이동
		var title = "${title}";
		if(title=="timesale"){
			$("#j_tab1").prop("checked",true);
		}
		else if(title=="nowEvent"){
			$("#j_tab2").prop("checked",true);
		}		
		else if(title=="endEvent"){
			$("#j_tab3").prop("checked",true);
		}
		var chkr = $(".j_tab-wrap [name='tabs']:checked").next().text();
		$(".j_eventMenu").text(chkr);
		
		
		$(".searchFrm").submit(function(){
			if("#j_searchWordNow").val()==""){
				alert("검색어를 입력하세요.");
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
		<div class="j_tab-content" id="j_tab1_content">타임세일
		
		</div>
		
		<!-- 진행중인 이벤트 -->
		<div class="j_tab-content" id="j_tab2_content">
			<div class="clearfix j_search">
				<form method="post" class="searchFrm" action="event?title=nowEvent">
					<select id="j_searchKey" name="searchKey">
						<option value="eventSubject">제목</option>
						<option value="eventContent">내용</option>
					</select>
					<input type="text" name="searchWord" id="j_searchWordNow" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>
			</div>
			<div>
				<ul class="clearfix" id="j_eventList">
					<c:forEach var="vo" items="${list }">
					<li>
						<a href="eventContent?eventNo=${vo.eventNo }">
							<img src="./upload/${vo.eventImg1}"><br/>
							<strong>${vo.eventSubject }</strong>
						</a>
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
						<option value="eventSubejct">제목</option>
						<option value="eventContent">내용</option>
					</select>
					<input type="text" name="searchWord" id="j_searchWordEnd" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>			
			</div>
		
		</div>
	</div>
</div>
</body>
</html>