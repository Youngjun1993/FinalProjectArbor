package com.arbor.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.CpnService;
import com.arbor.home.service.CpnServiceImp;
import com.arbor.home.vo.CouponVO;

@Controller
public class CouponController {
	@Inject
	CpnServiceImp cpnService;
	
	@RequestMapping("/couponAdList")
	public ModelAndView couponAdList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("maincate",cpnService.cpnGetMainCate());
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
		
		System.out.println("salerate vo="+vo.getSalerate());
		System.out.println("salerate length="+vo.getSalerate());
		System.out.println("salerate="+salerateArr.length);
		
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
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/cpnSelectCate")
	@ResponseBody
	public List<CouponVO> cpnSelectCate(int mainno){
		return cpnService.cpnGetSubCate(mainno);
	}
}
