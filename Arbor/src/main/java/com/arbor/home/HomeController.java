package com.arbor.home;


import java.util.List;

import javax.inject.Inject;


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
	public ModelAndView home() {
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
	
}
