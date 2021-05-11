package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arbor.home.service.DibsServiceImp;
import com.arbor.home.vo.DibsVO;

@Controller
public class DibsController {
	@Inject
	DibsServiceImp dibsService;
	
	@RequestMapping("/dibsList")
	public String dibsList() {
		return "client/dibs/dibsList";
	}
	
	@RequestMapping(value="/dibsInsert", method=RequestMethod.POST)
	@ResponseBody
	public int dibsInsert(
			@RequestParam(value="optnameArr[]", required=true) String[] optnameArr,
			@RequestParam(value="priceArr[]", required=true) String[] priceArr,
			@RequestParam(value="quantityArr[]", required=true) String[] quantityArr,
			@RequestParam(value="pno", required=true) String pnoStr,
			HttpServletRequest req,
			HttpSession ses
			) {
		int result = 0;
		for(int i=0; i<priceArr.length; i++) {
			DibsVO vo = new DibsVO();
			vo.setUserid((String)ses.getAttribute("logId"));
			if(optnameArr==null) {
				vo.setOptionvalue(null);
			} else {
				vo.setOptionvalue(optnameArr[i]);
			}
			vo.setPno(Integer.parseInt(pnoStr));
			vo.setPrice(Integer.parseInt(priceArr[i]));
			vo.setQuantity(Integer.parseInt(quantityArr[i]));
			int res = dibsService.dibsInsert(vo);
			if(res>0) {
				result++;
			}
		}
		return result;
	}
	
}
