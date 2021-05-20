package com.arbor.home.controller;

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
	public ModelAndView SalesManagement(SalesVO salesVo, HttpServletRequest req) {
		PageSearchVO pageVo = new PageSearchVO();
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr!=null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}	
		pageVo.setTotalRecord(salesService.totalRecord(salesVo).size());

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
	
}
