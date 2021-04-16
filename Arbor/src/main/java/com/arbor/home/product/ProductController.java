package com.arbor.home.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/productInsert")
	public String productInsert() {
		return "product/productInsert";
	}

}
