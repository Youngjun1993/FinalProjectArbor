package com.arbor.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.CpnService;
import com.arbor.home.service.CpnServiceImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class CouponController {
	@Inject
	CpnServiceImp cpnService;
	
	@RequestMapping("/couponAdList")
	public ModelAndView couponAdList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVo.setTotalRecord(cpnService.totalRecord(pageVo));
		
		mav.addObject("maincate",cpnService.cpnGetMainCate());
		mav.addObject("list", cpnService.cpnAdList(pageVo));
		mav.addObject("pageVO", pageVo);
		
		mav.setViewName("admin/coupon/couponAdList");
		return mav;
	}
	@RequestMapping(value = "/couponAdInsert", method=RequestMethod.POST)
	@ResponseBody
	public int couponAdInsert(CouponVO vo) {
		int result = 0;
		
		String cpnnameArr[] = vo.getCpnname().split(",");
		String applyArr[] = vo.getApply().split(",");
		String salerateArr[] = vo.getSalerate().split(",");
		String cpnstartArr[] = vo.getCpnstart().split(",");
		String cpnendArr[] = vo.getCpnend().split(",");
		for(int i=0; i<cpnnameArr.length; i++) {
			CouponVO cpnVo = new CouponVO();
			
			cpnVo.setCpnname(cpnnameArr[i]);
			if(applyArr[i].equals("") || applyArr[i] ==null) {
				cpnVo.setApply("-");
			}else {
				cpnVo.setApply(applyArr[i]);
			}
			
			if(salerateArr[i].equals("") || salerateArr[i] ==null) {
				cpnVo.setSalerate("0");
				cpnVo.setSalerateInt("0");
			}else {
				cpnVo.setSalerate(salerateArr[i]);
				cpnVo.setSalerateInt(salerateArr[i]);
			}
			cpnVo.setCpnstart(cpnstartArr[i]);
			cpnVo.setCpnend(cpnendArr[i]);
			
			result = cpnService.cpnAdInsert(cpnVo);
		}
		return result;
	}
	
	@RequestMapping(value="/cpnSelectCate", method=RequestMethod.POST)
	@ResponseBody
	public List<CouponVO> cpnSelectCate(int mainno){
		return cpnService.cpnGetSubCate(mainno);
	}
	@RequestMapping(value="/cpnAdEdit", method=RequestMethod.POST)
	public ModelAndView cpnAdEdit(CouponVO vo) {
		ModelAndView mav = new ModelAndView();
		cpnService.cpnAdUpdate(vo);
		
		mav.setViewName("redirect:couponAdList");
		
		return mav;
	}
	@RequestMapping("/cpnAdDelete")
	public ModelAndView cpnAdDelete(int cpnadno) {
		ModelAndView mav = new ModelAndView();
		
		cpnService.cpnAdDelete(cpnadno);
		mav.setViewName("redirect:couponAdList");
		return mav;
	}
	@RequestMapping("/cpnAllDel")
	public ModelAndView cpnAllDel() {
		ModelAndView mav = new ModelAndView();
		cpnService.cpnAllDelete();
		mav.setViewName("redirect:couponAdList");
		return mav;
	}
}
