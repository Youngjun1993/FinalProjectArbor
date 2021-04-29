package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.TimeSaleServiceImp;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.TimeSaleVO;

@Controller
public class TimeSaleController {
	@Inject
	TimeSaleServiceImp timeSaleService;

	@RequestMapping("/timeSaleInsert")
	public String eventInsert() {
		return "admin/timeSale/timeSaleInsert";
	}
	
	@RequestMapping(value="/pInfoSearch", method=RequestMethod.POST)
	@ResponseBody
	public ProductVO pInfoSearch(int pNo) {
		ProductVO vo = timeSaleService.pInfoSearch(pNo);
		return vo;
	}
	
	@RequestMapping(value="/timeSaleInsertOk", method=RequestMethod.POST)
	public ModelAndView timeSaleInsertOk(TimeSaleVO vo) {
		ModelAndView mav = new ModelAndView();
		if(timeSaleService.timeSaleInsert(vo)>0) {
			mav.addObject("vo", timeSaleService.timeSaleSelect());
			mav.setViewName("admin/timeSale/timeSaleView");
		}else {
			mav.setViewName("redirect:timeSaleInsert");
		}
		return mav;
	}
	
	@RequestMapping("/timeSaleView")
	public ModelAndView timeSaleView() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", timeSaleService.timeSaleSelect());
		mav.setViewName("admin/timeSale/timeSaleView");
		return mav;
	}
	
	@RequestMapping("/timeSaleEdit")
	public ModelAndView timeSaleEdit(int saleNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", timeSaleService.timeSaleEditRecord(saleNo));
		mav.setViewName("admin/timeSale/timeSaleEdit");
		return mav;
	}
	
	@RequestMapping(value="/timeSaleEditOk", method=RequestMethod.POST)
	public ModelAndView timeSaleEditOk(TimeSaleVO vo){
		ModelAndView mav = new ModelAndView();
		System.out.println("saleNo->"+vo.getSaleNo());
		if(timeSaleService.timeSaleEdit(vo)>0) {
			mav.addObject("vo", timeSaleService.timeSaleSelect());
			mav.setViewName("redirect:timeSaleView");
		}else {
			System.out.println("vo.getSaleNo()->"+vo.getSaleNo());
			mav.addObject("saleNo", vo.getSaleNo());
			mav.setViewName("redirect:timeSaleEdit");
		}
		return mav;
	}
	
	@RequestMapping("/timeSaleDelete")
	public ModelAndView timeSaleDelete(int saleNo) {
		ModelAndView mav = new ModelAndView();
		if(timeSaleService.timeSaleDelete(saleNo)>0) {
			//mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.setViewName("redirect:timeSaleView");
		}else {
			mav.setViewName("redirect:timeSaleView");			
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
