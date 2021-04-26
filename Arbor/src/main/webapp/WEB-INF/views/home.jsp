<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
</script>
<div id="d_topimg">
	<div>
		<img src="<%=request.getContextPath() %>/img/testfuniture.jpg">
	</div>
	<div>
		<img src="<%=request.getContextPath() %>/img/testfuniture2.jpg">
	</div>
</div>
<div id="d_main" class="w1400_container">
	<div class="clearfix" trigger-up>
		<ul id="leftTitle" class="clearfix">
			<li>실시간 인기상품</li>
		</ul>
		
	</div>
	<div id="d_list" trigger-up>
		<hr/>
		<ul>
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa1.png"/></a><br/>
			<div class="color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="listdetail1">소파가 1+1인가봐용</p>
			<p class="listdetail2">600,000원</p>
			<p class="listdetail3">480,000원</p>
			</li>
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa2.jpg"/></a><br/>
			<div class="color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="listdetail1">2인용은 너무 작으니까 3인용</p>
			<p class="listdetail2">500,000원</p>
			<p class="listdetail3">420,000원</p>
			</li>
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa3.jpg"/></a><br/>
			<div class="color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="listdetail1">푹신하게 생겼네 스툴도있어</p>
			<p class="listdetail2">900,000원</p>
			<p class="listdetail3">720,000원</p>
			</li>
			<li>
			<a href="productView"><img src="<%=request.getContextPath()%>/img/sofa4.png"/></a><br/>
			<div class="color" class="clearfix">
				<div></div>
				<div></div>
				<div></div>
			</div><br/>
			<p class="listdetail1">자취생은 집이 좁으니까 2인용소파</p>
			<p class="listdetail2">350,000원</p>
			<p class="listdetail3">230,000원</p>
			</li>
		</ul>
	</div>
	
	<!-- 박스 -->
	<div id="d_box" class="w1400_container">
		<div class="d_box_div1" trigger-left>
			<img src="<%=request.getContextPath() %>/img/boxtest1.jpg">
		</div>
		<div class="d_box_div2" trigger-up>
			<img src="<%=request.getContextPath() %>/img/boxtest2.jpg">
		</div>
		<div class="d_box_div3" trigger-up>
			<img src="<%=request.getContextPath() %>/img/boxtest3.jpg">	
		</div>
		<div class="d_box_div4" trigger-right>
			<img src="<%=request.getContextPath() %>/img/boxtest4.jpg">	
	</div>
	</div>
</div>