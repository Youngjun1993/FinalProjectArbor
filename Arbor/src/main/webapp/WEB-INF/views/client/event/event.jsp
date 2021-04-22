<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/client/event.css" type="text/css"/>
<script>
	$(function(){
		$(".j_tab_label").click(function(){
			var title = $(this).text();
			console.log(title);
			$(".j_eventMenu").text(title);
		});		
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_eventMenu">
		<span>TIME SALE</span>
	</div>
	<div class="j_tab-wrap">
		<input type="radio" name="tabs" class="j_tabs" id="j_tab1">
		<label for="j_tab1" class="j_tab_label">TIME SALE</label>

		<input type="radio" name="tabs" class="j_tabs" id="j_tab2" checked>
		<label for="j_tab2" class="j_tab_label">진행중인 이벤트</label>

		<input type="radio" name="tabs" class="j_tabs" id="j_tab3">
		<label for="j_tab3" class="j_tab_label">지난 이벤트</label>
		
		<!-- 타임세일 -->
		<div class="j_tab-content" id="j_tab1_content">타임세일
		
		</div>
		
		<!-- 진행중인 이벤트 -->
		<div class="j_tab-content" id="j_tab2_content">
			<div class="clearfix j_search">
				<form method="post" action="">
					<select id="j_searchKey">
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" id="j_searchWord" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>
			</div>
			<div>
				<ul class="clearfix" id="j_eventList">
					<c:forEach var="vo" items="${list }">
					<li>
						<a href="eventView">
							<img src="<%=request.getContextPath() %>/upload/${vo.eventImg1}"><br/>
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
					<li class="j_subejct">${vo.eventSubject }</li>
					<li>${vo.eventStart } ~ ${vo.eventEnd }</li>
				</c:forEach>
			</ul>
			<div class="clearfix j_search">
				<form method="post" action="">
					<select id="j_searchKey">
						<option value="subejct">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" id="j_searchWord" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>			
			</div>
		
		</div>
	</div>
</div>
</body>
</html>