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
	
	/* client */
	@RequestMapping("/getTimeSale")
	@ResponseBody
	public TimeSaleVO getTimeSale() {
		TimeSaleVO vo = timeSaleService.getTimeSale();
		return vo;
	}
	
	//////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////	
	
	/* admin */
	@RequestMapping("/timeSaleList")
	public ModelAndView timeSaleList(TimeSaleVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", timeSaleService.timeSaleAllSelect(vo));
		mav.setViewName("admin/timeSale/timeSaleList");
		return mav;
	}

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
			mav.setViewName("redirect:timeSaleList");
		}else {
			mav.setViewName("redirect:timeSaleInsert");
		}
		return mav;
	}
	
	@RequestMapping("/timeSaleView")
	public ModelAndView timeSaleView(int saleNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", timeSaleService.timeSaleSelect(saleNo));
		mav.setViewName("admin/timeSale/timeSaleView");
		return mav;
	}
	
	@RequestMapping("/timeSaleEdit")
	public ModelAndView timeSaleEdit(int saleNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", timeSaleService.timeSaleSelect(saleNo));
		mav.setViewName("admin/timeSale/timeSaleEdit");
		return mav;
	}
	
	@RequestMapping(value="/timeSaleEditOk", method=RequestMethod.POST)
	public ModelAndView timeSaleEditOk(TimeSaleVO vo){
		ModelAndView mav = new ModelAndView();
		System.out.println("saleNo->"+vo.getSaleNo());
		mav.addObject("saleNo", vo.getSaleNo());
		if(timeSaleService.timeSaleEdit(vo)>0) {
			mav.setViewName("redirect:timeSaleView");
		}else {
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
