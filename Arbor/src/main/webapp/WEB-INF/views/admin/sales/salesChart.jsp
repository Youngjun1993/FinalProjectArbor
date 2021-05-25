<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/memberAdminMenu.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/sales.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/orderAdmin.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="<%=request.getContextPath() %>/javaScript/admin/adminMenu.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- apexcharts -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.2.1/chart.min.js"></script> -->
<script>
	$(function(){
		
		//datepicker 옵션 설정
		$.datepicker.setDefaults({
			dateFormat: "yy-mm-dd",
			dayNamesMin: ['일','월','화','수','목','금','토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearSuffix: "년",
			showOtherMonths: true,		//빈 공간에 앞뒤월의 날짜 표시
			showMonthAfterYear:true,	//년+월
			changeYear: true,			//콤보박스 연도 선택 가능
			changeMonth: true,			//콤보박스 월 선택 가능
			showOn: "focus"				//both:버튼을 누르거나 input을 클릭하면 달력 표시
		});
		$("#sales_from").datepicker({
			onClose : function(selectedDate){
		    	$("#sales_to").datepicker("option", "minDate", selectedDate);
		    }
		});
		$("#sales_to").datepicker({
			onClose : function(selectedDate){
		    	$("#sales_from").datepicker("option", "maxDate", selectedDate);
		    }
		});
		var chart, piechart;
		//매출 검색기간 유효성 검사
		$('#salesChartSearchBtn').click(function(){
			if($('#sales_from').val()=='' || $('#sales_from').val==null){
				alert("검색기간을 확인해주세요.");
				return false;
			}
			if($('#sales_to').val()=='' || $('#sales_to').val==null){
				alert("검색기간을 확인해주세요.");
				return false;
			}
			
			var orderDate = [];
			var salesPrice = [];
			var orderCnt = [];
			var ttlOrderCnt = [];
			var cateOrderCnt = [];
			var cateName = [];
			var data = $('#j_salesChartFrm').serialize();
			//매출 그래프(월별, 일별 금액 및 주문건수)
			$.ajax({
				url: "getGraphData",
				type: 'POST',
				data: data,
				success: function(data){
					if (chart != null){
						chart.destroy();
					}
					for (key in data){
						orderDate.push(data[key].orderdate)
						salesPrice.push(data[key].totalsales);
						orderCnt.push(data[key].ordercnt);						
					};
					var options = {
					  series: [{
					  name: '주문금액',
					  type: 'column',
					  data: salesPrice
					}, {
					  name: '주문건수',
					  type: 'line',
					  data: orderCnt
					}],
					  chart: {
					  height: 350,
					  type: 'line',
					},
					stroke: {
					  width: [0, 4]
					},
					title: {
					  text: 'Arbor 월별 매출 그래프'
					},
					dataLabels: {
					  enabled: true,
					  enabledOnSeries: [1]
					},
					labels: orderDate,
					xaxis: {
					  type: 'datetime'
					},
					yaxis: [{
					  title: {
					    text: '주문금액',
					  },
					
					}, {
					  opposite: true,
					  title: {
					    text: '주문건수'
					  }
					}]
					};
					chart = new ApexCharts(document.querySelector("#byMonthly"), options);
					chart.render();
				}, error: function(error){
					alert("그래프 그리기 에러->"+error);
				}			
			});
			//상품별 판매량 파이차트
			/* $.ajax({
				url: "getPieChartData",
				type: 'POST',
				data: data,
				success: function(data){
					if (chart != null){
						chart.destroy();
					}
					for (key in data){
						orderDate.push(data[key].orderdate)
						salesPrice.push(data[key].totalsales);
						orderCnt.push(data[key].ordercnt);						
					};
					var options = {
			          series: [44, 55, 13, 33],
			          chart: {
			            width: 380,
			          	type: 'donut',
			        },
			        dataLabels: {
			          enabled: false
			        },
			        responsive: [{
			          breakpoint: 480,
			          options: {	
			            chart: {
			              width: 200
			            },
			            legend: {
			              show: false
			            }
			          }
			        }],
			        legend: {
			          position: 'right',
			          offsetY: 0,
			          height: 230,
			        }
			        };

			        var piechart = new ApexCharts(document.querySelector("#pieChart"), options);
			        piechart.render();
				}
			}); */
		});	
	});	
		
		
		/* ======================================================================================= */
		/* var options = {
          series: [44, 55, 13, 33],
          chart: {
          width: 380,
          type: 'donut',
        },
        dataLabels: {
          enabled: false
        },
        responsive: [{
          breakpoint: 480,
          options: {	
            chart: {
              width: 200
            },
            legend: {
              show: false
            }
          }
        }],
        legend: {
          position: 'right',
          offsetY: 0,
          height: 230,
        }
        };

        var chart = new ApexCharts(document.querySelector("#pieChart"), options);
        chart.render(); */
      
		
		
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<!-- 관리자메뉴 -->
	<%@include file="/WEB-INF/inc/adminMenu.jspf"%>
	<div class="j_centerFrm" id="orderManagement">
		<p class="j_adminMemu"><span>매출관리</span></p>
		<div class="salesTitle">
			<a href="salesManagement"><i class="fas fa-search-dollar" title="매출통계"></i></a>&nbsp;
			<a href="salesChart"><i class="fas fa-chart-bar" title="매출그래프" style="color: rgb(191,43,53);"></i></a>
		</div>
		<!-- <p class="j_adSubTitle"><span>매출 그래프</span></p> -->
		<div>
			<form id="j_salesChartFrm" action="salesChart">
				<table class="salesDateSearch">
					<colgroup>
						<col width="240px"><col width="auto">
					</colgroup>
					<tr>
						<td>검색기간</td>
						<td>
							<input type="text" name="sales_from" id="sales_from"/>
							 ~ <input type="text" name="sales_to" id="sales_to"/>
							<input type="button" class="adminSubBtn" id="salesChartSearchBtn" value="검색"/>
							<input type="radio" name="terms" value="monthly"/>월별
							<input type="radio" name="terms" value="daily"/>일별
						</td>
					</tr>
				</table>
			</form>
			<div id="byMonthly">
				
			</div>
			<div id="pieChart">
				
			</div>
		</div>
	</div>
</div>
</body>
</html>