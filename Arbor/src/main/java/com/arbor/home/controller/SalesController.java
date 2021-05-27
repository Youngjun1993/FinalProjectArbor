package com.arbor.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.SalesServiceImp;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SalesVO;

@Controller
public class SalesController {
	@Inject
	SalesServiceImp salesService;
	
	@RequestMapping("/salesManagement")
	public ModelAndView SalesManagement(SalesVO salesVo, PageSearchVO pageVo, HttpServletRequest req) {		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr!=null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}	
		pageVo.setTotalRecord(salesService.totalRecord(salesVo).size());
		
		pageVo.setSales_from(salesVo.getSales_from());
		pageVo.setSales_to(salesVo.getSales_to());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesList", salesService.getDailySales(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/sales/dailySales");
		return mav;
	}
	
	@RequestMapping("/dailySalesDetail")
	@ResponseBody
	public List<SalesVO> salesDetailPopup(String orderdate){
		System.out.println("orderDate->"+orderdate);
		
		List<SalesVO> list = salesService.salesDetailInfo(orderdate);
		System.out.println("list.size()->"+list.size());
				
		return list;
	}
	
	@RequestMapping("/salesChart")
	public String SalesChart() {
		return ("admin/sales/salesChart");
	}
	
	@RequestMapping("/getGraphData")
	@ResponseBody
	public List<SalesVO> getSalesGraph(SalesVO salesVo){
		List<SalesVO> list = new ArrayList<SalesVO>();
		System.out.println("terms()->"+salesVo.getTerms());
		if(salesVo.getTerms().equals("monthly")) {
			System.out.println("월별그래프실행");
			list = salesService.getMonthlyChartData(salesVo);			
		}else if(salesVo.getTerms().equals("daily")) {
			System.out.println("일별그래프실행");
			list = salesService.getDailyChartData(salesVo);						
		}
		return list;
	}

	@RequestMapping("/getPieChartData")
	@ResponseBody
	public List<SalesVO> getSalesPieChart(SalesVO salesVo){
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesService.getDailyPieChartData(salesVo);						
		/*	if(salesVo.getTerms().equals("monthly")) {
				System.out.println("월별파이차트실행");
				list = salesService.getMonthlyPieChartData(salesVo);			
			}else if(salesVo.getTerms().equals("daily")) {
				System.out.println("일별파이차트그래프실행");
				list = salesService.getDailyPieChartData(salesVo);						
			}*/
		return list;
	}
		
	@RequestMapping("/getDailyMainCatePieChart")
	@ResponseBody
	public List<SalesVO> getDailyMainCatePieChart(SalesVO salesVo){
		List<SalesVO> list = new ArrayList<SalesVO>();
		System.out.println("terms()->"+salesVo.getTerms());
		list = salesService.getDailyMainCatePieChart(salesVo);						
		/*if(salesVo.getTerms().equals("monthly")) {
			System.out.println("월별파이차트실행");
		//	list = salesService.getMonthlyPieChartData(salesVo);			
		}else if(salesVo.getTerms().equals("daily")) {
			System.out.println("일별파이차트그래프실행");
		}*/
		return list;
	}
	
}
