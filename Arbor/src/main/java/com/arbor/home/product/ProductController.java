package com.arbor.home.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping("/productList")
	public String productList() {
		return "product/productList";
	}

	@RequestMapping("/productInsert")
	public String productInsert() {
		return "product/productInsert";
	}
	
	@RequestMapping("/productView")
	public String productView() {
		return "product/productView";
	}

}
