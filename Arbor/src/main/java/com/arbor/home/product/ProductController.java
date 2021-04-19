package com.arbor.home.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping("/productList")
	public String productList() {
		return "client/product/productList";
	}
	
	@RequestMapping("/productView")
	public String productView() {
		return "client/product/productView";
	}

	@RequestMapping("/productInsert")
	public String productInsert() {
		return "admin/product/productInsert";
	}
	
	

}
