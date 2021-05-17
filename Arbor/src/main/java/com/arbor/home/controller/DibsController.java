package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.DibsServiceImp;
import com.arbor.home.vo.DibsVO;
import com.arbor.home.vo.PageSearchVO;

@Controller
public class DibsController {
	@Inject
	DibsServiceImp dibsService;
	
	@RequestMapping("/dibsList")
	public ModelAndView dibsList(HttpSession ses, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			pageVo.setUserid(userid);
			pageVo.setTotalRecord(dibsService.totalRecord(pageVo));
			mav.addObject("list", dibsService.onePageRecordSelect(pageVo));
			mav.addObject("optList", dibsService.dibsList(userid));
			mav.addObject("pageVO", pageVo);
			mav.setViewName("client/dibs/dibsList");
		}
		return mav;
	}
	
	@RequestMapping(value="/dibsInsert", method= RequestMethod.POST)
	@ResponseBody
	public int dibsInsert(@Nullable
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
			if(optnameArr.length==0) {
				vo.setOptionvalue("");
			} else {
				vo.setOptionvalue(optnameArr[i]);
			}
			vo.setPno(Integer.parseInt(pnoStr));
			vo.setPrice(Integer.parseInt(priceArr[i]));
			vo.setQuantity(Integer.parseInt(quantityArr[i]));
			int resul = dibsService.dibsMiniList(vo);
System.out.println("찾아져?"+resul);
			if(resul>0) {
				result = 0;
				break;
			} else {
				int res = dibsService.dibsInsert(vo);
				if(res>0) {
					result++;
				}
			}
		}
		return result;
	}
	
}
