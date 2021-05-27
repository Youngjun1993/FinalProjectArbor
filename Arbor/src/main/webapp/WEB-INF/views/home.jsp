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
		
		
		
		$("#topFont").delay(1500).one("click",function(){
			$(this).animate({
				opacity: '1',
				top: '50%'
			},'slow');
			$('body').css('overflow','auto');
		});

		
	$("#d_homeleft").trigger("click");
	$("#d_homeright").trigger("click");
	$("#topFont").trigger("click");
	});
});

//LOOKBOOK 이벤트
function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(window).height();
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('.d_lookbook').css({'width':'calc(100vw - (100vw - 100%))','height':maskHeight});
	//애니메이션 효과 - 
	$('.d_lookbook').fadeIn(2000);
	//
	$(".d_lookbook").css({"background":"url(./img/lookbook_back3.jpg)"});    
	//윈도우 같은 거 띄운다.
	
	
	//창위치
 	$('.d_lookbook').css({
		"top":(($(window).height()-$('.d_lookbook').outerHeight())/2+$(window).scrollTop())+"px",
	
		}); 
	}	
$(document).ready(function(){
	//검은 막 띄우기
	$('.videoBox').click(function(e){
		e.preventDefault();
		wrapWindowByMask();
		$('.window').fadeIn(4000);
		$('body').css('overflow','hidden');
	
	});
	//닫기 버튼을 눌렀을 때
	
	//검은 막을 눌렀을 때
	$('.d_lbclose').click(function () {
	$('.d_lookbook').hide();
	$('body').css('overflow','auto');
	});
});

$(function(){
	$("#flipbook").turn({
	    width: 1330,
	    height: 670,
	    
	});
	
	$(".d_lbleftBtn").click(function(){
		$("#flipbook").turn("previous");
	});
	
	$(".d_lbrightBtn").click(function(){
		$("#flipbook").turn("next");
	});
	
});


//=============================================
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
<!-- 홈 문이벤트 -->
<div id="d_homeleft" class="d_mainhome">
	<img src="<%=request.getContextPath()%>/img/main2left.jpg">
</div>
<div id="d_homeright" class="d_mainhome">
	<img src="<%=request.getContextPath()%>/img/main2right.jpg">
</div>
<!-- LOOKBOOK -->
<div class="d_lookbook">
	<div class="d_bookimg">
		<img src="<%=request.getContextPath()%>/img/arbor_book2.png"></div>
	<div>
	
	</div>
	<div class="d_lbleftBtn">
			&#10094&#10094
	</div>
	<div class="d_lbrightBtn">
			&#10095&#10095
	</div>
	<div class="window">
		<div id="flipbook">
		    <div class="d_bookpage d_bookmainImg">
		    	<img src="<%=request.getContextPath()%>/img/lookbook_main.jpg">
		    </div>
		    <div class="d_bookpage">
		    	<div class="d_bookcontent d_videofit">
		    		<video id="vid1" width="100%" height="100%" autoplay loop muted preload="auto">
  						<source src="<%=request.getContextPath()%>/img/bookimg1.mp4" type="video/mp4">
					</video>
					<script> document.getElementById('vid1').play(); </script>
		    	</div>
		    	<div class="d_booktext">
		    	<h1>아르보르는 정직하게 그리고 다르게 만듭니다.</h1>
		    	<h1>WE MAKE QUALITY</h1>
		    	<h3>
		    		최고의 소재만을 사용하여<br>
		    		고객에게 항상 신뢰받는 브랜드로 남을 수 있도록<br>
		    		최선을 다하겠습니다.
		    	</h3>
		    	</div>
		    </div>
		    
		    
		    
		    <div class="d_bookpage d_bookmargin"> 
		    	<div class="d_booksmall d_book1 d_videofit">
		    		<video id="vid2" width="100%" height="100%" autoplay loop muted preload="auto">
 						<source src="<%=request.getContextPath()%>/img/bookimg2.mp4" type="video/mp4">
					</video>
					<script> document.getElementById('vid2').play(); </script>
		    		<%-- <img src="<%=request.getContextPath()%>/img/lookbooktree.jpg"> --%>
		    	</div>
		    	<div class="d_booksmall2 d_book2">
		    		<h3>
		    			아르보르가 사용하는<br>
		    			모든 소재는 시험인증기관의<br>
		    			테스트를 완료하였습니다.
		    		</h3>
		    	</div>
		    	<div class="d_booksmall2 d_book3">
		    		<h3>
		    			브랜드 R&D센터를 운영하며,<br>
		    			상품을 직접 기획하고 있습니다.<br>
		    			장인으로 이루어진 소파 제작팀이<br>
		    			고객의 주문 후 하나하나 제작합니다.
		    		</h3>
		    	</div>
		    	<div class="d_booksmall d_book4 d_videofit">
		    		<video id="vid3" width="100%" height="100%" autoplay loop muted preload="auto">
  						<source src="<%=request.getContextPath()%>/img/bookimg3.mp4" type="video/mp4">
					</video>
					<script> document.getElementById('vid3').play(); </script>
		    	</div> 
		    </div>
		  	<!--룩북 상품시작 -->
		    <div class="d_bookpage">
		    	<div class="d_bookstart1">
		    		<p>Arbor's Product</p>
		    	</div>
		    	<div class="d_bookstart2 d_videofit">
		    		<video id="vid4" width="100%" height="100%" autoplay loop muted preload="auto">
  						<source src="<%=request.getContextPath()%>/img/booksell1.mp4" type="video/mp4">
					</video>
					<script> document.getElementById('vid4').play(); </script>
		    	</div>
		    </div>
		    <!-- 상품1 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain2">
		   			<a href="productView?pno=53"><img src="<%=request.getContextPath()%>/upload/a23.jpg"></a>
		    	</div>
		    	<div class="d_booksub2">
		    		<p>상품명: 브리엔침대</p>
		    	</div>
		    </div>
		    <!-- 상품2 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain">
		    		<a href="productView?pno=79"><img src="<%=request.getContextPath()%>/upload/a73.PNG"></a>
		    	</div>
		    	<div class="d_booksub">
		    		<p>상품명: 토핑체어</p>
		    	</div>
		    </div>
		    <!-- 상품3 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain2">
		    		<a href="productView?pno=97"><img src="<%=request.getContextPath()%>/upload/a07.jpg"></a>
		    	</div>
		    	<div class="d_booksub2">
		    		<p>상품명: 헤르짐머 뷘트 3인 소파</p>
		    	</div>
		    </div>
		    <!-- 상품4 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain">
		    		<a href="productView?pno=30"><img src="<%=request.getContextPath()%>/upload/jerry_TVStand_1.jpg"></a>
		    	</div>
		    	<div class="d_booksub">
		    		<p>상품명: Jerry TV Stand</p>
		    	</div>
		    </div>
		    <!-- 상품5 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain2">
		    		<a href="productView?pno=75"><img src="<%=request.getContextPath()%>/upload/a67.PNG"></a>
		    	</div>
		    	<div class="d_booksub2">
		    		<p>상품명: 도노 세라믹 6인 식탁</p>
		    	</div>
		    </div>
		    <!-- 상품6 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain">
		    		<a href="productView?pno=43"><img src="<%=request.getContextPath()%>/upload/a7.jpg"></a>
		    	</div>
		    	<div class="d_booksub">
		    		<p>상품명: 링키플러스 슬라이딩 옷장</p>
		    	</div>
		    </div>
		    <!-- 상품7 -->
		    <div class="d_bookpage">
		    	<div class="d_bookmain2">
		    		<a href="productView?pno=37"><img src="<%=request.getContextPath()%>/upload/black1-1.png"></a>
		    	</div>
		    	<div class="d_booksub2">
		    		<p>상품명: ARBOR 블랙 러버 협탁</p>
		    	</div>
		    </div>
		    <!--룩북 이벤트 시작 -->
		    <div class="d_bookpage">
		    	<div class="d_eventstart1">
		    		<p>Arbor's EVENT</p>
		    	</div>
		    	<div class="d_eventstart2 d_videofit">
		    		<video id="vid5" width="100%" height="100%" autoplay loop muted preload="auto">
  						<source src="<%=request.getContextPath()%>/img/bookevent1.mp4" type="video/mp4">
					</video>
					<script> document.getElementById('vid5').play(); </script>
		    	</div>
		    </div>
		    <!-- 이벤트1 -->
		    <div class="d_bookpage">
		    	<div class="d_eventmain2">
		    		<a href="eventContent?eventNo=51"><img src="<%=request.getContextPath()%>/upload/pinkevent1.jpg"></a>
		    	</div>
		    	<div class="d_eventsub2">
		    		<p>설렘을 담은 신혼가구 기획전</p>
		    	</div>
		    </div>
		    <!-- 이벤트2 -->
		    <div class="d_bookpage">
		    	<div class="d_eventmain">
		    		<a href="eventContent?eventNo=41"><img src="<%=request.getContextPath()%>/upload/event_bubu.png"></a>
		    	</div>
		    	<div class="d_eventsub">
		    		<p></p>
		    	</div>
		    </div>
		    <!-- 이벤트3 -->
		    <div class="d_bookpage">
		    	<div class="d_eventmain2">
		    		<a href="eventContent?eventNo=35"><img src="<%=request.getContextPath()%>/upload/event_bubu (2).png"></a>
		    	</div>
		    	<div class="d_eventsub2">
		    		<p>신혼가구 컬렉션</p>
		    	</div>
		    </div>
		</div>
	</div>
	<div class="d_lbclose"><img src="<%=request.getContextPath()%>/img/d_close5.png"></div>
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
			<img class="prev" src="<%=request.getContextPath()%>/imqg/prev2.png">
			<img class="next" src="<%=request.getContextPath()%>/img/next2.png">
		</div>
		<div class="slide_wraper">
			<div class="slides">
				<ul>
					<c:forEach var="top" items="${top }">
						<li><a href="productView?pno=${top.pno }"><img src="<%=request.getContextPath()%>/upload/${top.img1}"></a></li>
					</c:forEach>
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
			<img src="<%=request.getContextPath()%>/img/boxtest5.jpg">
		</div>
	</div>
	<!-- 두번째리스트 -->
	<!-- 인기상품 -->
	<div class="slideBox2" trigger-up>
		<p>Arbor's 신상품</p>
		<div class="controlls2">
			<img class="prev2" src="<%=request.getContextPath()%>/img/prev2.png">
			<img class="next2" src="<%=request.getContextPath()%>/img/next2.png">
		</div>
		<div class="slide_wraper2">
			<div class="slides2">
				<ul>
					<c:forEach var="newlst" items="${newlst }">
						<li><a href="productView?pno=${newlst.pno }"><img src="<%=request.getContextPath()%>/upload/${newlst.img1 }"></a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- "slides" -->
		</div>
		<!--slide_wraper -->
	</div>
	<!--slideBox -->
	
	
	<!-- 동영상 LOOKBOOK -->
	<div class="videoBox" trigger-up>
		<div class="d_video">
			<video width="100%" height="800px" autoplay loop muted preload="auto">
  				<source src="<%=request.getContextPath()%>/img/lookbook.mp4" type="video/mp4">
			</video>
		</div>
		<div id="lookbook">
			<p>Arbor's LOOKBOOK</p>
			<button>GET INSPIRED</button>
		</div>
	</div>
	<!-- videoBox -->
	
	<!-- 링크~ -->
	<div class="d_linkBox">
		<ul>
			<li>
				<a href="productList?mainno=1&subno=1">
					<div class="screen" trigger-left>
						<div class="s_top">Arbor's Sofa</div>
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
				<a href="productList?mainno=2&subno=5">
					<div class="screen" trigger-up>
						<div class="s_top">Arbor's Bed</div>
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
				<a href="productTotalList">
					<div class="screen" trigger-right >
						<div class="s_top">Arbor's Product</div>
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
		<iframe src="//lightwidget.com/widgets/d486832fe27d530e953547bd5663ede1.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>
	</div>
</div>
<!-- d_main -->


