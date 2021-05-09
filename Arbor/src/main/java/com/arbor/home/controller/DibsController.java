package com.arbor.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arbor.home.service.DibsServiceImp;

@Controller
public class DibsController {
	@Inject
	DibsServiceImp dibsSevice;
	
	@RequestMapping("/dibsList")
	public String dibsList() {
		return "client/dibs/dibsList";
	}
	
}
