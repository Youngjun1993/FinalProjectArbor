package com.arbor.home.product;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			@RequestParam("img1") MultipartFile img1,
			@RequestParam("img2") MultipartFile img2,
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
	
	@RequestMapping("/uploadSummernoteImageFile")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest req
			) {
		
		JsonObject jsonObject = new JsonObject();
		
		// 저장할 경로 위치 설정 (웹루트로 업로드하면 빌드하고 재배포시 이미지가 사라짐 외부 경로에 잡아준다.)
		String path = req.getSession().getServletContext().getRealPath("/summernote");
		System.out.println(path);
		// 파일명 구하기
		String orgName = multipartFile.getOriginalFilename();
		//파일 확장자 (.의 index구해서 substring한다)
		String extension = orgName.substring(orgName.lastIndexOf("."));
		
		// transferTo : 실제 업로드 발생
		try {
			if(orgName!=null && !orgName.equals("")) {
				multipartFile.transferTo(new File(path, orgName));
				// 업로드 시키기 (path경로에 orgName을 업로드 시킨다)
				jsonObject.addProperty("url", "/home/summernote/"+orgName);
				jsonObject.addProperty("responseCode", "success");
			}
		} catch(Exception e) {
			System.out.println("ProductController > summernote upload 에서 에러 발생!!!");
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}

}
