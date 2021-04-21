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
<div class="w1400_container">
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
					<li>
						<a href="eventView">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>2021 봄제품 사은품 증정</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>2020 F/W제품 특별 할인 이벤트</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>총액 50만원 이상 무료 배송</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>sns 후기 이벤트@@</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>2021 봄제품 사은품 증정</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>2020 F/W제품 특별 할인 이벤트</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>총액 50만원 이상 무료 배송</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
					<li>
						<a href="">
							<img src="<%=request.getContextPath() %>/img/eventTest.PNG"><br/>
							<strong>sns 후기 이벤트@@</strong>
						</a>
						<p>2021/04/01 ~ 2021/05/01</p>
					</li>
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
				
				<li>3</li>
				<li></li>
				<li class="j_subejct">지난 이벤트3</li>
				<li>2021/01/01~2021/01/31</li>
				<li>2</li>
				<li></li>
				<li class="j_subejct">지난 이벤트2</li>
				<li>2021/01/01~2021/01/31</li>
				<li>1</li>
				<li></li>
				<li class="j_subejct">지난 이벤트1</li>
				<li>2021/01/01~2021/01/31</li>
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