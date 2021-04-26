package com.arbor.home.product;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.mainCate.MainCateVO;
import com.arbor.home.optionTbl.OptionVO;
import com.arbor.home.subCate.SubCateVO;
import com.google.gson.JsonObject;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	// View - 상품목록
	@RequestMapping("/productList")
	public String productList() {
		return "client/product/productList";
	}
	
	// View - 상품상세페이지
	@RequestMapping("/productView")
	public String productView() {
		return "client/product/productView";
	}
	
	// Admin - 상품등록페이지로 넘어감
	@RequestMapping("/productInsert")
	public ModelAndView productInsert() {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		
		mav.addObject("subCate", dao.subCateList(1));
		mav.addObject("mainCate", dao.mainCateList());
		mav.setViewName("admin/product/productInsert");
		return mav;
	}

	// Admin - 상품등록
	@RequestMapping(value="/productInsertOk", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView productInsertOk(
			ProductVO pvo,
			@RequestParam(value="optname",required=true) String[] optNameArr,
			@RequestParam(value="optvalue",required=true) String[] optValueArr,
			@RequestParam(value="rgbvalue",required=true) String[] rgbValueArr,
			@RequestParam(value="optprice",required=true) String[] optPriceArr,
			@RequestParam("imgName1") MultipartFile image1,
			@RequestParam("imgName2") MultipartFile image2,
			HttpServletRequest req
			) {
		// 트랜잭션 설정함
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		// 처음 등록시 등록된 재고량 = 총재고량이 되므로 세팅함
		pvo.setAllstock(pvo.getStock());
		 
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		
		// 저장할 경로 위치 설정 (upload 폴더에 넣을거임)
		String path = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println(path);
		// 파일 업로드
		String imgName1 = image1.getOriginalFilename();
		String imgName2 = image2.getOriginalFilename();
		// 실제 파일 업로드시키기 (img1)
		int p=1;
		if(imgName1!=null && !imgName1.equals("")) {
			File f = new File(path, imgName1);
			while(f.exists()) {
				/* 있으면 true, 없으면 false 반환되므로 true일때 filename rename */
				int point = imgName1.lastIndexOf(".");
				String name = imgName1.substring(0, point);
				String extName = imgName1.substring(point+1);
				
				f = new File(path, name+"_"+(p++)+"."+extName);
			}
			try {
				if(imgName1!=null && !imgName1.equals("")) {
					image1.transferTo(f);
				}
			} catch(Exception e) {
				System.out.println("productInsert > imageFile 등록 에러 !!!!");
			}
			
			// insert파일명 vo에 setting
			pvo.setImg1(f.getName());
		}
		// img2에 업로드
		int j=1;
		if(imgName2!=null && !imgName2.equals("")) {
			File f2 = new File(path, imgName2);
			while(f2.exists()) {
				/* 있으면 true, 없으면 false 반환되므로 true일때 filename rename */
				int point = imgName2.lastIndexOf(".");
				String name = imgName2.substring(0, point);
				String extName = imgName2.substring(point+1);
				
				f2 = new File(path, name+"_"+(j++)+"."+extName);
			}
			try {
				if(imgName2!=null && !imgName2.equals("")) {
					image2.transferTo(f2);
				}
			} catch(Exception e) {
				System.out.println("productInsert > imageFile2 등록 에러 !!!!");
			}
			
			// insert파일명 vo에 setting
			pvo.setImg2(f2.getName());
		}
		// insert시작
		try {
			// insert
			int pInsert = dao.productInsert(pvo);
			if (pInsert>0) {
				// 등록 성공
			} else {
				// 등록 실패
				System.out.println("productInsert 에러발생!!!");
				File f = new File(path, imgName1);
				f.delete();
				File del2 = new File(path, pvo.getImg2());
				del2.delete();
				mav.setViewName("redirect:productInsert");
			}
			for(int i=0; i<optNameArr.length; i++) {
				OptionVO vo = new OptionVO();
				vo.setPno(dao.pnoSelect(pvo.getSubno(), pvo.getPname()));
				vo.setOptname(optNameArr[i]);
				vo.setOptvalue(optValueArr[i]);
				// rgb코드는 색상 구분일 때만 받아옴
				if(optNameArr[i].equals("색상")) {
					vo.setRgbvalue(rgbValueArr[i]);
				} else {
					vo.setRgbvalue("");
				}
				// 가격추가 없을시 0원으로 표기
				if(optPriceArr[i].equals("") || optPriceArr[i]==null) {
						vo.setOptprice(0);
					} else {
						vo.setOptprice(Integer.parseInt(optPriceArr[i]));
					}
				dao.optionInsert(vo);
			}
			transactionManager.commit(status);
			mav.setViewName("redirect:productList");
		} catch(Exception e) {
			System.out.println("ProductController > productInsertOk에서 에러 발생!");
			e.printStackTrace();
			// 실행 중 에러발생하면 데이터 rollback 파일 삭제
			transactionManager.rollback(status);
			mav.setViewName("redirect:productInsert");
		}
		return mav;
	}
	
	// 대분류에 따른 서브카테고리 가져오기
	@RequestMapping("/subCateList")
	@ResponseBody
	public List<SubCateVO> subCateList(int mainno) {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		return dao.subCateList(mainno);
	}
	
	// Admin - 상품관리 첫페이지 (목록, 검색, 수정)
	@RequestMapping("/productSearch")
	public ModelAndView productSearch() {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("subCate", dao.subCateList(1));
		mav.addObject("mainCate", dao.mainCateList());
		mav.setViewName("/admin/product/productSearch");
		return mav;
	}
	
	// SummerNote upload
	@RequestMapping("/uploadSummernoteImageFile")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest req
			) {
		
		JsonObject jsonObject = new JsonObject();
		
		// 저장할 경로 위치 설정 (웹루트로 업로드하면 빌드하고 재배포시 이미지가 사라짐 외부 경로에 잡아준다.)
		String path = req.getSession().getServletContext().getRealPath("/summernote");
		// 파일명 구하기
		String orgName = multipartFile.getOriginalFilename();
		
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
