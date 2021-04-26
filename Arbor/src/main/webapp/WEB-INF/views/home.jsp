<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	const trigger = new ScrollTrigger.default({
		trigger:{
			once: true, //한번만 나타남
			offset: {
					element: {
						x:0,
						y:(trigger, rect, direction) => {
							return 0.5 //몇%나왔을때 나타나는지
					}
				},
			}
			
		}
	});
	trigger.add('[trigger-up]');
	trigger.add('[trigger-left]');
	trigger.add('[trigger-down]');
	trigger.add('[trigger-right]');
});

$(function(){
	var slides = document.querySelector('.slides'),
		slide = document.querySelectorAll('.slides li'),
		currentIdx =0,	//현재인덱스
		slideCount = slide.length, //슬라이드의 갯수
		prevBtn = document.querySelector('.prev'),
		nextBtn = document.querySelector('.next');
		slideWidth = 400,
		slideMargin = 30,
	
	slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin +'px';//슬라이드의 넓이
	
	function moveSlide(num){
		slides.style.left = -num * 430 +'px';
		currentIdx = num;
	}
	
	//버튼이벤트
	nextBtn.addEventListener('click',function(){
		console.log(currentIdx);
		if(currentIdx < slideCount - 4){
			moveSlide(currentIdx + 1);
			if(currentIdx>0){
				prevBtn.style.display = 'block';
			}
			if(currentIdx==slideCount-4){
				nextBtn.style.display = 'none';
			}
		}
	});
	prevBtn.addEventListener('click',function(){
		if(currentIdx >0){
			moveSlide(currentIdx - 1);
			if(currentIdx==0){
				prevBtn.style.display = 'none';
			}
			if(currentIdx==slideCount-5){
				nextBtn.style.display = 'block';
			}
		}
	});
		
});
	
</script>
<div class="d_main">
	<div id="d_topimg">
		<div>
			<img src="<%=request.getContextPath()%>/img/testfuniture.jpg">
		</div>
		<div>
			<img src="<%=request.getContextPath()%>/img/testfuniture2.jpg">
		</div>
	</div>
	<!-- 인기상품 -->
	<div id="d_list" class="clearfix w1400_container" trigger-up>
		<div>실시간 인기상품</div>
		<div>
			<ul>
				<li><a href="productView"><img
						src="<%=request.getContextPath()%>/img/sofa1.png" /></a><br />
					<div class="color" class="clearfix">
						<div></div>
						<div></div>
						<div></div>
					</div> <br />
					<p class="listdetail1">소파가 1+1인가봐용</p>
					<p class="listdetail2">600,000원</p>
					<p class="listdetail3">480,000원</p></li>
				<li><a href="productView"><img
						src="<%=request.getContextPath()%>/img/sofa2.jpg" /></a><br />
					<div class="color" class="clearfix">
						<div></div>
						<div></div>
						<div></div>
					</div> <br />
					<p class="listdetail1">2인용은 너무 작으니까 3인용</p>
					<p class="listdetail2">500,000원</p>
					<p class="listdetail3">420,000원</p></li>
				<li><a href="productView"><img
						src="<%=request.getContextPath()%>/img/sofa3.jpg" /></a><br />
					<div class="color" class="clearfix">
						<div></div>
						<div></div>
						<div></div>
					</div> <br />
					<p class="listdetail1">푹신하게 생겼네 스툴도있어</p>
					<p class="listdetail2">900,000원</p>
					<p class="listdetail3">720,000원</p></li>
				<li><a href="productView"><img
						src="<%=request.getContextPath()%>/img/sofa4.png" /></a><br />
					<div class="color" class="clearfix">
						<div></div>
						<div></div>
						<div></div>
					</div> <br />
					<p class="listdetail1">자취생은 집이 좁으니까 2인용소파</p>
					<p class="listdetail2">350,000원</p>
					<p class="listdetail3">230,000원</p></li>
			</ul>
		</div>
	</div>
	<!-- 박스 -->
	<div id="d_box" class="w1400_container">
		<div class="d_box_div1" trigger-left>
			<img src="<%=request.getContextPath()%>/img/boxtest1.jpg">
		</div>
		<div class="d_box_div2" trigger-down>
			<img src="<%=request.getContextPath()%>/img/boxtest2.jpg">
		</div>
		<div class="d_box_div3" trigger-down>
			<img src="<%=request.getContextPath()%>/img/boxtest3.jpg">
		</div>
		<div class="d_box_div4" trigger-up>
			<img src="<%=request.getContextPath()%>/img/boxtest4.jpg">
		</div>
		<div class="d_box_div5" trigger-right>
			<img src="<%=request.getContextPath()%>/img/boxtest1.jpg">
		</div>
	</div>
	<!-- 두번째리스트 -->
	<!-- 인기상품 -->
	<div id="d_list" class="clearfix w1400_container" trigger-up>
		<div>실시간 인기상품</div>
		<diwasv>
		<ul>
			<li><a href="productView"><img
					src="<%=request.getContextPath()%>/img/sofa1.png" /></a><br />
				<div class="color" class="clearfix">
					<div></div>
					<div></div>
					<div></div>
				</div> <br />
				<p class="listdetail1">소파가 1+1인가봐용</p>
				<p class="listdetail2">600,000원</p>
				<p class="listdetail3">480,000원</p></li>
			<li><a href="productView"><img
					src="<%=request.getContextPath()%>/img/sofa2.jpg" /></a><br />
				<div class="color" class="clearfix">
					<div></div>
					<div></div>
					<div></div>
				</div> <br />
				<p class="listdetail1">2인용은 너무 작으니까 3인용</p>
				<p class="listdetail2">500,000원</p>
				<p class="listdetail3">420,000원</p></li>
			<li><a href="productView"><img
					src="<%=request.getContextPath()%>/img/sofa3.jpg" /></a><br />
				<div class="color" class="clearfix">
					<div></div>
					<div></div>
					<div></div>
				</div> <br />
				<p class="listdetail1">푹신하게 생겼네 스툴도있어</p>
				<p class="listdetail2">900,000원</p>
				<p class="listdetail3">720,000원</p></li>
			<li><a href="productView"><img
					src="<%=request.getContextPath()%>/img/sofa4.png" /></a><br />
				<div class="color" class="clearfix">
					<div></div>
					<div></div>
					<div></div>
				</div> <br />
				<p class="listdetail1">자취생은 집이 좁으니까 2인용소파</p>
				<p class="listdetail2">350,000원</p>
				<p class="listdetail3">230,000원</p></li>
		</ul>
	</div>
	<!-- 슬라이드 -->
	<div class="slideBox" trigger-up>
		<div class="controlls">
			<span class="prev">◀</span>
			<span class="next">▶</span>
		</div>
		<div class="slide_wraper">
			<div class="slides">
				<ul>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대1.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대2.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대3.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대4.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대5.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대6.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대7.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/슬라이드침대8.PNG"></li>
				</ul>
			</div>
			<!-- "slides" -->
		</div>
		<!--slide_wraper -->
	</div>
	<!--slideBox -->
	
	<!-- 동영상  -->
	<div class="videoBox" trigger-up>
		<div class="d_video">
			<video width="100%" height="800" autoplay loop muted preload="auto">
  				<source src="<%=request.getContextPath()%>/img/lookbook.mp4" type="video/mp4">
			</video>
		</div>
		<div id="lookbook">
			<p>Arbor Look Book</p>
			<button>GET INSFIRED</button>
		</div>
	</div>
	<!-- videoBox -->
</div>
<!-- d_main -->



