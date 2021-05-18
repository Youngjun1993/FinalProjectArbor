package com.arbor.home.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.SalesServiceImp;
import com.arbor.home.vo.SalesVO;

@Controller
public class SalesController {
	@Inject
	SalesServiceImp salesService;
	
	@RequestMapping("/salesManagement")
	public ModelAndView SalesManagement(SalesVO salesVo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesList", salesService.getDailySales(salesVo));
		mav.setViewName("admin/sales/dailySales");
		return mav;
	}
	
	@RequestMapping("/dailySalesDetail")
	public List<SalesVO> salesDetailPopup(String orderDate){
		System.out.println("orderDate->"+orderDate);
		
		List<SalesVO> list = salesService.salesDetailInfo(orderDate);
		System.out.println("list.size()->"+list.size());
				
		return list;
	}
	
}
