<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>arbor > event</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/event.css" type="text/css"/>
<script>
	$(function(){
		$(".tab_label").click(function(){
			var title = $(this).text();
			console.log(title);
			$(".eventTitle").text(title);
		});
	});

</script>
</head>
<body>
<div class="w1400_container">
	<div class="eventTitle">
		<span>이벤트 타이틀</span>
	</div>
	<div class="tab-wrap">
		<input type="radio" name="tabs" id="tab1">
		<label for="tab1" class="tab_label">TIME SALE</label>

		<input type="radio" name="tabs" id="tab2">
		<label for="tab2" class="tab_label">진행중인 이벤트</label>

		<input type="radio" name="tabs" id="tab3" checked>
		<label for="tab3" class="tab_label">지난 이벤트</label>
		
		<!-- 타임세일 -->
		<div class="tab-content" id="tab1_content">타임세일
		
		</div>
		
		<!-- 진행중인 이벤트 -->
		<div class="tab-content" id="tab2_content">
			<div class="clearfix search">
				<form method="post" action="">
					<select id="searchKey">
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" id="searchWord" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>
			</div>
			<div>
				<ul class="clearfix eventList">
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
		<div class="tab-content" id="tab3_content">
			<ul class="clearfix">
				<li>번호</li>
				<li>이벤트 항목</li>
				<li>이벤트 기간</li>
				
				<li>3</li>
				<li>지난 이벤트3</li>
				<li>2021/01/01~2021/01/31</li>
				<li>2</li>
				<li>지난 이벤트2</li>
				<li>2021/01/01~2021/01/31</li>
				<li>1</li>
				<li>지난 이벤트1</li>
				<li>2021/01/01~2021/01/31</li>
			</ul>
			<div class="clearfix search">
				<form method="post" action="">
					<select id="searchKey">
						<option value="subejct">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" id="searchWord" placeholder="검색어 입력"/>
					<input type="submit" value="검색"/>
				</form>			
			</div>
		
		</div>
	</div>
</div>
</body>
</html>