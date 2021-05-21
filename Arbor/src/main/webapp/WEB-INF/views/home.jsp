<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
//
$(function(){
	const trigger = new ScrollTrigger.default({
		trigger:{
			once: true, //한번만 나타남
			offset: {
					element: {
						x:0,
						y:(trigger, frame, direction) => {
							return trigger.visible ? 0 : 0.3 //몇%나왔을때 나타나는지
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
//자동이벤트
$(function(){
	$(document).ready(function(){
		$('#d_homeleft').delay(1000).one("click",function(){
			$(this).animate({
				opacity: '0',
				left: '-50%'
			},1000);
		});
		$('#d_homeright').delay(1000).one("click",function(){
			$(this).animate({
				opacity: '0',
				left: '100%',
				width: '0'
			},1000);
		});
		$("#topFont").one("click",function(){
			$(this).delay(1500).animate({
				opacity: '1',
				top: '50%'
				
			},'slow');
			
		});
	$("#d_homeleft").trigger("click");
	$("#d_homeright").trigger("click");	
	$("#topFont").trigger("click");
	});
});

//첫번째 상품 슬라이드
$(function(){
	var slides = document.querySelector('.slides'),
		slide = document.querySelectorAll('.slides li'),
		currentIdx =0,	//현재인덱스
		slideCount = slide.length, //슬라이드의 갯수
		prevBtn = document.querySelector('.prev'),
		nextBtn = document.querySelector('.next'),
	
		slideWidth = 400,
		slideMargin = 30;
	
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
/////////////
//두번째 상품 슬라이드
$(function(){
	var slides = document.querySelector('.slides2'),
		slide = document.querySelectorAll('.slides2 li'),
		currentIdx =0,	//현재인덱스
		slideCount = slide.length, //슬라이드의 갯수
		prevBtn = document.querySelector('.prev2'),
		nextBtn = document.querySelector('.next2'),
	
		slideWidth = 400,
		slideMargin = 30;
	
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

// 탑슬라이드

$(function(){
	var slide = document.querySelectorAll('#d_top div'),
		slideCount = slide.length, //슬라이드의 갯수
		nextBtn = document.querySelector('.d_next'),
		
		currentIdx=1;	//현재인덱스
		

	function moveSlide(num){
		$('.slide img').css('opacity', 0).css('z-index',0);
		$('.slide').eq(num).children().css('opacity', 1).css('z-index',1);
		currentIdx++;
	}
		
	//setInterval(function(){할일},시간);
 	setInterval(function(){
 		var nextIdx = (currentIdx + 1);
 		if(currentIdx==slideCount){
 			currentIdx = 0;
		}
		moveSlide(currentIdx);
	},4000);
 
});

</script>
<div id="d_homeleft" class="d_mainhome">
	<img src="<%=request.getContextPath()%>/img/main2left.jpg">
</div>
<div id="d_homeright" class="d_mainhome">
	<img src="<%=request.getContextPath()%>/img/main2right.jpg">
</div>
<div class="d_main">
	<div id="topSlide">
		<div id="d_top">
			<div class="slide" id="slide-1">
				<img src="<%=request.getContextPath()%>/img/mainimg1.PNG">
			</div>
			<div class="slide" id="slide-2">
				<img src="<%=request.getContextPath()%>/img/mainimg2.jpg">
			</div>
			<div class="slide" id="slide-3">
				<img src="<%=request.getContextPath()%>/img/mainimg3.jpg">
			</div>
			<div class="slide" id="slide-4">
				<img src="<%=request.getContextPath()%>/img/mainimg4.jpg">
			</div>
			<div class="slide" id="slide-5">
				<img src="<%=request.getContextPath()%>/img/mainimg5.jpg">
			</div>
			<div class="slide" id="slide-6">
				<img src="<%=request.getContextPath()%>/img/mainimg6.jpg">
			</div>
		</div>
		<div id="topFont">
			<p>FEELS LIKE INSPIRE</p>
			<P>Furniture only for you prepared for you</p>
			<button>Collection</button>
		</div>
	</div>
	<!-- 인기상품 -->
	<div class="slideBox" trigger-up>
		<p>Arbor's 인기상품</p>
		<div class="controlls">
			<img class="prev" src="<%=request.getContextPath()%>/img/prev2.png">
			<img class="next" src="<%=request.getContextPath()%>/img/next2.png">
		</div>
		<div class="slide_wraper">
			<div class="slides">
				<ul>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed1.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed2.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed3.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed4.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed5.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed6.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed7.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed8.PNG"></li>
				</ul>
			</div>
			<!-- "slides" -->
		</div>
		<!--slide_wraper -->
	</div>
	<!--slideBox -->
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
	<div class="slideBox2" trigger-up>
		<p>Arbor's 추천상품</p>
		<div class="controlls2">
			<img class="prev2" src="<%=request.getContextPath()%>/img/prev2.png">
			<img class="next2" src="<%=request.getContextPath()%>/img/next2.png">
		</div>
		<div class="slide_wraper2">
			<div class="slides2">
				<ul>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed11.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed12.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed13.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed14.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed15.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed16.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed1.PNG"></li>
					<li><img src="<%=request.getContextPath()%>/img/slide_bed2.PNG"></li>
				</ul>
			</div>
			<!-- "slides" -->
		</div>
		<!--slide_wraper -->
	</div>
	<!--slideBox -->
	
	
	<!-- 동영상  -->
	<div class="videoBox" trigger-up>
		<a href="#"><div class="d_video">
			<video width="100%" height="800" autoplay loop muted preload="auto">
  				<source src="<%=request.getContextPath()%>/img/lookbook.mp4" type="video/mp4">
			</video>
		</div>
		<div id="lookbook">
			<p>Arbor's LOOKBOOK</p>
			<button>GET INSFIRED</button>
		</div>
		</a>
	</div>
	<!-- videoBox -->
	
	<!-- 링크~ -->
	<div class="d_linkBox">
		<ul>
			<li>
				<a href="">
					<div class="screen" trigger-left>
						<div class="s_top">소파를 봅시다</div>
						<div class="s_bottom">소파리스트로 이동</div>
						<div class="s_video">
							<video width="533.33" height="700" autoplay loop muted preload="auto">
	  							<source src="<%=request.getContextPath()%>/img/linkVideo1.mp4" type="video/mp4">
							</video>
						</div>
						<img src="<%=request.getContextPath()%>/img/linkSofa.PNG">
					</div>
				</a>
			</li>
			<li>
				<a href="">
					<div class="screen" trigger-up>
						<div class="s_top">침대를 봅시다</div>
						<div class="s_bottom">침대리스트로 이동</div>
						<div class="s_video">
							<video width="533.33" height="700" autoplay loop muted preload="auto">
	  							<source src="<%=request.getContextPath()%>/img/linkVideo2.mp4" type="video/mp4">
							</video>
						</div>
						<img src="<%=request.getContextPath()%>/img/slide_bed2.PNG">
					</div>
				</a>
			</li>
			<li>
				<a href="">
					<div class="screen" trigger-right >
						<div class="s_top">가구를 봅시다.</div>
						<div class="s_bottom">가구리스트로 이동</div>
						<div class="s_video">
							<video width="533.33" height="700" autoplay loop muted preload="auto">
	  							<source src="<%=request.getContextPath()%>/img/linkVideo3.mp4" type="video/mp4">
							</video>
						</div>
						<img src="<%=request.getContextPath()%>/img/linkF.PNG">
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div id="d_instar" trigger-up>
		<p>Arbor's INSTARGRAM</p>
		<iframe src="//lightwidget.com/widgets/2078de7f99a35149a4d8536a633f791a.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>
	</div>
</div>
<!-- d_main -->



