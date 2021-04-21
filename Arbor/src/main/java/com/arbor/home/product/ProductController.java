package com.arbor.home.product;

import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.mainCate.MainCateVO;
import com.arbor.home.subCate.SubCateVO;
import com.google.gson.JsonObject;

@Controller
public class ProductController {
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String uploadCkeditor(HttpServletRequest req, HttpServletResponse res,
			MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject json = new JsonObject();
		PrintWriter pw = null;
		OutputStream os = null;
		MultipartFile file = multiFile.getFile("upload");
		return "";
	}
	
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
	
	@RequestMapping(value="/productInsertOk", method=RequestMethod.POST)
	public ModelAndView productInsertOk(
			ProductVO pvo,
			MainCateVO mvo,
			SubCateVO svo,
			@RequestParam(value="optname",required=true) String[] optNameArr,
			@RequestParam(value="optvalue",required=true) String[] optValueArr,
			@RequestParam(value="optprice",required=true) String[] optPriceArr,
			HttpServletRequest req
			) {
		ModelAndView mav = new ModelAndView();
		for(int i=0; i<optNameArr.length; i++) {
			System.out.println("option"+i);
			System.out.println(optNameArr[i]+","+optValueArr[i]+","+optPriceArr[i]);
		}
		System.out.println("메인카테="+mvo.getMainname()+","+" 서브카테="+svo.getSubname());
		System.out.println("상품명="+pvo.getPname());
		
		
		mav.setViewName("/productInsert");
		return mav;
	}

}
