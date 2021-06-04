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

import com.arbor.home.dao.ProductDAOImp;
import com.arbor.home.mainCate.MainCateVO;
import com.arbor.home.optionTbl.OptionVO;
import com.arbor.home.subCate.SubCateVO;
import com.arbor.home.vo.ProductVO;
import com.google.gson.JsonObject;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	// View - �긽�뭹紐⑸줉
	@RequestMapping("/productList")
	public String productList() {
		return "client/product/productList";
	}
	
	// View - �긽�뭹�긽�꽭�럹�씠吏�
	@RequestMapping("/productView")
	public String productView() {
		return "client/product/productView";
	}
	
	// Admin - �긽�뭹�벑濡앺럹�씠吏�濡� �꽆�뼱媛�
	@RequestMapping("/productInsert")
	public ModelAndView productInsert() {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		
		mav.addObject("subCate", dao.subCateList(1));
		mav.addObject("mainCate", dao.mainCateList());
		mav.setViewName("admin/product/productInsert");
		return mav;
	}

	// Admin - �긽�뭹�벑濡�
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
		// �듃�옖�옲�뀡 �꽕�젙�븿
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		// 泥섏쓬 �벑濡앹떆 �벑濡앸맂 �옱怨좊웾 = 珥앹옱怨좊웾�씠 �릺誘�濡� �꽭�똿�븿
		pvo.setAllstock(pvo.getStock());
		 
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		
		// ���옣�븷 寃쎈줈 �쐞移� �꽕�젙 (upload �뤃�뜑�뿉 �꽔�쓣嫄곗엫)
		String path = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println(path);
		// �뙆�씪 �뾽濡쒕뱶
		String imgName1 = image1.getOriginalFilename();
		String imgName2 = image2.getOriginalFilename();
		// �떎�젣 �뙆�씪 �뾽濡쒕뱶�떆�궎湲� (img1)
		int p=1;
		if(imgName1!=null && !imgName1.equals("")) {
			File f = new File(path, imgName1);
			while(f.exists()) {
				/* �엳�쑝硫� true, �뾾�쑝硫� false 諛섑솚�릺誘�濡� true�씪�븣 filename rename */
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
				System.out.println("productInsert > imageFile �벑濡� �뿉�윭 !!!!");
			}
			
			// insert�뙆�씪紐� vo�뿉 setting
			pvo.setImg1(f.getName());
		}
		// img2�뿉 �뾽濡쒕뱶
		int j=1;
		if(imgName2!=null && !imgName2.equals("")) {
			File f2 = new File(path, imgName2);
			while(f2.exists()) {
				/* �엳�쑝硫� true, �뾾�쑝硫� false 諛섑솚�릺誘�濡� true�씪�븣 filename rename */
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
				System.out.println("productInsert > imageFile2 �벑濡� �뿉�윭 !!!!");
			}
			
			// insert�뙆�씪紐� vo�뿉 setting
			pvo.setImg2(f2.getName());
		}
		// insert�떆�옉
		try {
			// insert
			int pInsert = dao.productInsert(pvo);
			if (pInsert>0) {
				// �벑濡� �꽦怨�
			} else {
				// �벑濡� �떎�뙣
				System.out.println("productInsert �뿉�윭諛쒖깮!!!");
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
				// rgb肄붾뱶�뒗 �깋�긽 援щ텇�씪 �븣留� 諛쏆븘�샂
				if(optNameArr[i].equals("�깋�긽")) {
					vo.setRgbvalue(rgbValueArr[i]);
				} else {
					vo.setRgbvalue("");
				}
				// 媛�寃⑹텛媛� �뾾�쓣�떆 0�썝�쑝濡� �몴湲�
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
			System.out.println("ProductController > productInsertOk�뿉�꽌 �뿉�윭 諛쒖깮!");
			e.printStackTrace();
			// �떎�뻾 以� �뿉�윭諛쒖깮�븯硫� �뜲�씠�꽣 rollback �뙆�씪 �궘�젣
			transactionManager.rollback(status);
			mav.setViewName("redirect:productInsert");
		}
		return mav;
	}
	
	// ��遺꾨쪟�뿉 �뵲瑜� �꽌釉뚯뭅�뀒怨좊━ 媛��졇�삤湲�
	@RequestMapping("/subCateList")
	@ResponseBody
	public List<SubCateVO> subCateList(int mainno) {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		return dao.subCateList(mainno);
	}
	
	// Admin - �긽�뭹愿�由� 泥ロ럹�씠吏� (紐⑸줉, 寃��깋, �닔�젙)
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
		
		// ���옣�븷 寃쎈줈 �쐞移� �꽕�젙 (�쎒猷⑦듃濡� �뾽濡쒕뱶�븯硫� 鍮뚮뱶�븯怨� �옱諛고룷�떆 �씠誘몄�媛� �궗�씪吏� �쇅遺� 寃쎈줈�뿉 �옟�븘以��떎.)
		String path = req.getSession().getServletContext().getRealPath("/summernote");
		// �뙆�씪紐� 援ы븯湲�
		String orgName = multipartFile.getOriginalFilename();
		
		// transferTo : �떎�젣 �뾽濡쒕뱶 諛쒖깮
		try {
			if(orgName!=null && !orgName.equals("")) {
				multipartFile.transferTo(new File(path, orgName));
				// �뾽濡쒕뱶 �떆�궎湲� (path寃쎈줈�뿉 orgName�쓣 �뾽濡쒕뱶 �떆�궓�떎)
				jsonObject.addProperty("url", "/home/summernote/"+orgName);
				jsonObject.addProperty("responseCode", "success");
			}
		} catch(Exception e) {
			System.out.println("ProductController > summernote upload �뿉�꽌 �뿉�윭 諛쒖깮!!!");
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}

}
