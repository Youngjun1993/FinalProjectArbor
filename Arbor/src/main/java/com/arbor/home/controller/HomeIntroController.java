package com.arbor.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeIntroController {
	
	//회사소개 페이지 이동
	@RequestMapping("/aboutUs")
	public String dddd() {
		return "client/Intro/aboutUs";
	}
	
}
