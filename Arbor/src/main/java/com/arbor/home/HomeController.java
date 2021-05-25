package com.arbor.home;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.arbor.home.service.HomeServiceImp;
import com.arbor.home.vo.MainCateVO;



@Controller
public class HomeController {
	@Inject
	HomeServiceImp homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession ses) {
		
		ses.setAttribute("mainList", homeService.mainList());
		ses.setAttribute("subList", homeService.subList());
		ses.setMaxInactiveInterval(-1);
		ModelAndView mav = new ModelAndView();
		//메인메뉴
		mav.addObject("mainList", homeService.mainList());
		List<MainCateVO> vo = homeService.mainList();
		System.out.println(vo);
		//서브메뉴
		mav.addObject("subList", homeService.subList());
		
		mav.setViewName("home");//
		return mav;
	}
	
	@RequestMapping("/arbor_TAC")
	public String arbor_TAC() {
			return "client/footer/arbor_TAC";
	}
	
	@RequestMapping("/arbor_PP")
	public String arbor_PP() {
			return "client/footer/arbor_PP";
	}
	
	@RequestMapping("/arbor_Use")
	public String arbor_Use() {
			return "client/footer/arbor_Use";
	}
	
}
