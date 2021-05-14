package com.arbor.home.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.arbor.home.service.ProductServiceImp;
import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.PageProductVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.ProductQnaVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;


@Controller
public class ProductController {

	@Inject
	ProductServiceImp productService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	// View - 상품목록
	@RequestMapping("/productList")
	public ModelAndView productList(PageProductVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(productService.productClientTotalRecord(vo));
		int mainno = productService.selectSubno(vo.getSubno());
		vo.setMainno(mainno);
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = productService.productListClient(vo);
		
		mav.addObject("topList", productService.productTopList(vo.getMainno()));
		mav.addObject("list", list);
		mav.addObject("subCate", productService.subCateList(vo.getMainno()));
		mav.addObject("mainname", productService.mainnameSelect(vo.getMainno()));
		mav.addObject("opt", productService.productListRGB(vo.getSubno()));
		mav.addObject("pageVO", vo);
		mav.setViewName("client/product/productList");
		return mav;
	}
	
	// View - 상품상세페이지
	@RequestMapping("/productView")
	public ModelAndView productView(int pno) {
		ModelAndView mav = new ModelAndView();
		ProductVO vo = productService.productSelect(pno);
		mav.addObject("vo", vo);
		mav.addObject("opt", productService.productListRGB(vo.getSubno()));
		mav.addObject("optName", productService.optNameSelect(pno));
		mav.addObject("optValue", productService.optValueSelect(pno));
		mav.addObject("pqnalst", productService.pqnaViewList(pno));
		mav.addObject("qnaList", productService.qnaViewList(pno));
		mav.setViewName("client/product/productView");
		return mav;
	}
	
	// View - 상품상세, 옵션 셀렉트박스 변경시 Div추가
	@RequestMapping(value="/productOptionView", method=RequestMethod.POST)
	@ResponseBody
	public List<OptionVO> productOptionView(
			@RequestParam(value="optno[]",required=true) String[] optno) {
		List<OptionVO> list = new ArrayList<OptionVO>();
		for(int i=0; i<optno.length; i++) {
			int opt = Integer.parseInt(optno[i]);
			list.add(productService.productOptionView(opt));
		}
		return list;
	}
	
	// 상품문의 등록
	@RequestMapping("/pqnaInsert")
	@ResponseBody
	public int pqnaInsert(ProductQnaVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("logId"));
		return productService.pqnaInsert(vo);
	}
	
	// 상품문의 등록 후 목록 다시 불러오기
	@RequestMapping("/pqnaView")
	@ResponseBody
	public List<ProductQnaVO> pqnaView(int pno) {
		return productService.pqnaViewList(pno);
	}
	
	
	/* 관리자 */
	// Admin - 상품관리 첫페이지 (목록, 검색, 수정)
	@RequestMapping("/productSearch")
	public ModelAndView productSearch(PageSearchVO vo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(productService.totalRecord());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subCate", productService.subCateList(1));
		mav.addObject("mainCate", productService.mainCateList());
		mav.addObject("productList", productService.productList(vo));
		mav.addObject("pageVO", vo);
		mav.setViewName("/admin/product/productSearch");
		return mav;
	}
	
	// Admin - 카테고리 관리
	@RequestMapping("/manageCate")
	public ModelAndView manageCate(PageSearchVO vo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(productService.subcate_totalRecord());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subCate", productService.subCateList(1));
		mav.addObject("mainCate", productService.mainCateList());
		mav.addObject("cateList", productService.subCateListAll(vo));
		mav.addObject("pageVO", vo);
		mav.setViewName("admin/product/manageCate");
		
		return mav;
	}
	
	// Admin - 카테고리 등록
	@RequestMapping(value="/insertCate", method=RequestMethod.POST)
	public String insertCate(HttpServletRequest req) {
		String mainnoStr = req.getParameter("mainno");
		
		if(mainnoStr!=null && !mainnoStr.equals("")) {
			// 중분류 등록
			String editWord = req.getParameter("subEdit");
			int mainno = Integer.parseInt(mainnoStr);
			productService.insertSubCate(mainno, editWord);
		} else {
			// 대분류등록
			String editWord = req.getParameter("mainEdit");
			productService.insertMainCate(editWord);
			int mainnum = productService.selectMainno(editWord);
			productService.insertSubCate(mainnum, " ");
		}
		
		return "redirect:manageCate";
	}
	
	// Admin - 카테고리 삭제
	@RequestMapping("/deleteCate")
	@ResponseBody
	public int deleteCate(SubCateVO vo) {
		int cnt = 0;
		int result = productService.deleteSubCate(vo.getSubno());
		cnt += result;
		List<SubCateVO> list = productService.subCateList(vo.getMainno());
		if(list.size()==0) {
			productService.deleteMainCate(vo.getMainno());
		}
		return cnt;
	}
	
	// Admin - 카테고리 삭제
	@RequestMapping(value="/deleteCateMany", method=RequestMethod.POST)
	@ResponseBody
	public int deleteCateMany(
			@RequestParam(value="checked[]", required=true) String subnoArr[]) {
		int cnt = 0;
		for(int i=0; i<subnoArr.length; i++) {
			int subno = Integer.parseInt(subnoArr[i]);
			int mainno = productService.selectSubno(subno);
			int result = productService.deleteSubCate(subno);
			cnt += result;
			List<SubCateVO> list = productService.subCateList(mainno);
			if(list.size()==0) {
				productService.deleteMainCate(mainno);
			}
		}
		return cnt;
	}
	
	// Admin - 카테고리 수정
	@RequestMapping(value="/cateEdit", method=RequestMethod.POST)
	public String updateCate(MainCateVO mvo, SubCateVO svo) {
		productService.updateMainCate(mvo);
		productService.updateSubCate(svo);
		
		return "redirect:manageCate";
	}
	
	// Admin - 상품문의 목록
	@RequestMapping("/pqnaList")
	public ModelAndView pqnaList(PageSearchVO vo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(productService.pqna_totalRecord());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", productService.pqnaList(vo));
		mav.addObject("cnt", productService.pqnaNoAnswerCnt());
		mav.addObject("pageVO", vo);
		mav.setViewName("admin/product/productQna");
		return mav;
	}
	
	// Admin - 상품문의 미답변 목록
	@RequestMapping("/pqnaNoAnswerList")
	public ModelAndView pqnaNoAnswerList(PageSearchVO vo, HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		vo.setTotalRecord(productService.pqnaNoAnswerCnt());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", productService.pqnaNoAnswerList(vo));
		mav.addObject("cnt", productService.pqna_totalRecord());
		mav.addObject("pageVO", vo);
		mav.setViewName("admin/product/productQnaNoAnswer");
		return mav;
	}
	
	// Admin - 상품문의 답변등록 창으로 이동
	@RequestMapping("/pqnaAnswer")
	public ModelAndView pqnaAnswer(int pqnano) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ans", productService.pqnaAnswer(pqnano));
		mav.setViewName("admin/product/productQnaWrite");
		return mav;
	}
	
	// Admin - 상품문의 답변 등록
	@RequestMapping(value="/pqnaAnswerInsert", method=RequestMethod.POST)
	public ModelAndView pqnaAnswerInsert(ProductQnaVO vo) {
		ModelAndView mav = new ModelAndView();
		if(productService.pqnaAnswerInsert(vo)>0) {
			mav.setViewName("redirect:pqnaList");
		} else {
			mav.addObject("pqnano", vo.getPqnano());
			mav.setViewName("redirect:pqnaAnswer");
		}
		
		return mav;
	}
	
	// 상품문의 답변 수정
	@RequestMapping(value="/pqnaAnswerEdit", method=RequestMethod.POST)
	public ModelAndView pqnaAnswerEdit(ProductQnaVO vo) {
		ModelAndView mav = new ModelAndView();
		if(productService.pqnaAnswerInsert(vo)>0) {
			mav.setViewName("redirect:pqnaList");
		} else {
			mav.addObject("pqnano", vo.getPqnano());
			mav.setViewName("redirect:pqnaAnswer");
		}
		
		return mav;
	}
	
	// 상품문의 답변 삭제
	@RequestMapping("/pqnaAnswerDelete")
	public ModelAndView pqnaAnswerDelete(int pqnano) {
		ModelAndView mav = new ModelAndView();
		productService.pqnaAnswerDelete(pqnano);
		mav.setViewName("redirect:pqnaList");
		return mav;
	}
	
	// Admin - 상품등록페이지로 넘어감
	@RequestMapping("/productInsert")
	public ModelAndView productInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("subCate", productService.subCateList(1));
		mav.addObject("mainCate", productService.mainCateList());
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
		
		// 저장할 경로 위치 설정 (upload 폴더에 넣을거임)
		String path = req.getSession().getServletContext().getRealPath("/upload");
		// 파일 업로드
		String imgName1 = image1.getOriginalFilename();
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
		String imgName2 = image2.getOriginalFilename();
		int j=1;
		if(imgName2!=null && !imgName2.equals("")) {
			File f2 = new File(path, imgName2);
			while(f2.exists()) {
				/* 있으면 true, 없으면 false 반환되므로 true일때 filename rename */
				int point2 = imgName2.lastIndexOf(".");
				String name2 = imgName2.substring(0, point2);
				String extName2 = imgName2.substring(point2+1);
				
				f2 = new File(path, name2+"_"+(j++)+"."+extName2);
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
			int pInsert = productService.productInsert(pvo);
			if (pInsert>0) {
				// 등록 성공
			} else {
				// 등록 실패
				System.out.println("productInsert 에러발생!!!");
				File f = new File(path, imgName1);
				f.delete();
				File del2 = new File(path, imgName2);
				del2.delete();
				mav.setViewName("redirect:productInsert");
			}
			for(int i=0; i<optNameArr.length; i++) {
				OptionVO vo = new OptionVO();
				vo.setPno(productService.pnoSelect(pvo.getSubno(), pvo.getPname()));
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
				productService.optionInsert(vo);
			}
			transactionManager.commit(status);
			mav.addObject("mainno", pvo.getMainno());
			mav.addObject("subno", pvo.getSubno());
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
		return productService.subCateList(mainno);
	}
	
	// Admin - 상품 수정
	@RequestMapping("/productEdit")
	public ModelAndView productEdit(int pno) {
		
		ModelAndView mav = new ModelAndView();
		ProductVO vo = productService.productSelect(pno);
		
		mav.addObject("vo", vo);
		mav.addObject("subCate", productService.subCateList(vo.getMainno()));
		mav.addObject("mainCate", productService.mainCateList());
		mav.addObject("optList", productService.optionSelect(pno));
		mav.setViewName("/admin/product/productEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/productEditOk", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView productEditOk(
			ProductVO pvo,
			@RequestParam(value="optno",required=true) String[] optNoArr,
			@RequestParam(value="deleteno",required=true) String[] deleteNoArr,
			@RequestParam(value="optname",required=true) String[] optNameArr,
			@RequestParam(value="optvalue",required=true) String[] optValueArr,
			@RequestParam(value="rgbvalue",required=true) String[] rgbValueArr,
			@RequestParam(value="optprice",required=true) String[] optPriceArr,
			HttpServletRequest req
			) {
		// 트랜잭션객체
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		String path = req.getSession().getServletContext().getRealPath("/upload");
		
		ModelAndView mav = new ModelAndView();
		
		// 변경전 파일명 가져오기
		ProductVO fileVO = productService.productSelect(pvo.getPno());
		
		// 파일 배열에 담기
		List<String> selFile = new ArrayList<String>();
		selFile.add(fileVO.getImg1());
		if (fileVO.getImg2()!=null && !fileVO.getImg2().equals("")) {
			selFile.add(fileVO.getImg2());
		}
		
		// 삭제한 파일 담기
		String delFile[] = req.getParameterValues("delFile");
		// 새로 추가 업로드하기
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> list = mr.getFiles("filename");
		
		List<String> newUpload = new ArrayList<String>();
		if(newUpload!=null && list.size()>0) {
			for(MultipartFile mf : list) {
				if(mf!=null) {
					String orgname = mf.getOriginalFilename(); // 업로드한 파일명
					if(orgname!=null && !orgname.equals("")) {
						
						File ff = new File(path, orgname);
						int i = 0;
						while(ff.exists()) {
							int pnt = orgname.lastIndexOf(".");
							String firstName = orgname.substring(0, pnt);
							String lastName = orgname.substring(pnt+1);
							
							ff = new File(path, firstName+"("+(++i)+")."+lastName);
						}
						
						try {
							mf.transferTo(ff);
						} catch(Exception e) {
							System.out.println("DataController > dataEditOk에서 에러 발생!");
							e.printStackTrace();
						}
						newUpload.add(ff.getName());
					}
				}
			}
		}
		
		// DB선택 파일 목록에서 삭제한 파일명 지우기
		if(delFile!=null) {
			for(String delName : delFile) {
				selFile.remove(delName);
			}
		}
		// DB선택 파일 목록에 새로 업로드된 파일명 추가
		for(String newFile : newUpload) {
			selFile.add(newFile);
		}
		
		pvo.setImg1(selFile.get(0));
		if(selFile.size()>1) {
			pvo.setImg2(selFile.get(1));
		}
		try {
			if(pvo.getAllstock()!=0) {
				pvo.setStock(pvo.getStock()+pvo.getAllstock());
			} else {
				pvo.setStock(pvo.getStock());
				pvo.setAllstock(0);
			}
			int result = productService.productUpdate(pvo);
			if(result>0) {
				// product 수정완료 (삭제파일 지우고 글내용보기로 돌아감)
				if(delFile!=null) {
					for(String dFile : delFile) {
						try {
							File dFileObj = new File(path, dFile);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println("삭제파일 지우던 중 에러 발생!");
							e.printStackTrace();
						}
					}
				}
				// optiontbl 수정하기
				if(optNameArr.length>0) {
					for(int i=0; i<optNameArr.length; i++) {
						OptionVO optvo = new OptionVO();
						optvo.setOptname(optNameArr[i]);
						optvo.setOptvalue(optValueArr[i]);
						optvo.setPno(pvo.getPno());
						// rgb코드는 색상 구분일 때만 받아옴
						if(optNameArr[i].equals("색상")) {
							optvo.setRgbvalue(rgbValueArr[i]);
						} else {
							optvo.setRgbvalue("");
						}
						// 가격추가 없을시 0원으로 표기
						if(optPriceArr[i].equals("") || optPriceArr[i]==null) {
							optvo.setOptprice(0);
						} else {
							optvo.setOptprice(Integer.parseInt(optPriceArr[i]));
						}
						if(optNoArr[i]==null || optNoArr[i].equals("")) {
							// optno가 없으면 새로 추가된 옵션이란 소리임~ (insert)
							productService.optionInsert(optvo);
						} else {
							// optno가 있으면 기존 옵션이란 소리임~ (update)
							optvo.setOptno(Integer.parseInt(optNoArr[i]));
							productService.optionUpdate(optvo);
						}
					}
				}
				// 원래 존재하던 옵션 중 삭제된 옵션 DB에서 지우기
				for(int d=0; d<deleteNoArr.length; d++) {
					if(deleteNoArr[d]!=null && !deleteNoArr[d].equals("")) {
						productService.optionDelete(Integer.parseInt(deleteNoArr[d]));
					}
				}
				mav.addObject("pno", pvo.getPno());
				mav.setViewName("redirect:productView");
			} else {
				// 새로 업로드 된 파일 지우고 글 수정 폼으로 돌아가기
				if(newUpload.size()>0) {
					for(String nFile : newUpload) {
						try {
							File dFileObj = new File(path,nFile);
							dFileObj.delete();
						} catch(Exception e) {
							System.out.println("새업로드파일 지우던중 에러 발생!");
							e.printStackTrace();
						}
					}
				}
				mav.addObject("pno", pvo.getPno());
				mav.setViewName("redirect:productEdit");
			}
			transactionManager.commit(status);	
		} catch(Exception e) {
			transactionManager.rollback(status);
			mav.addObject("pno", pvo.getPno());
			mav.setViewName("redirect:productEdit");
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("/productDelete")
	public String productDelete(int pno, HttpServletRequest req) {
		// 원래 DB 파일명 가져오기
		ProductVO dbFilename = productService.productSelect(pno);
		String path = req.getSession().getServletContext().getRealPath("/upload");
		File f = new File(path, dbFilename.getImg1());
		f.delete();
		if(dbFilename.getImg2()!=null && !dbFilename.getImg2().equals("")) {
			File f2 = new File(path, dbFilename.getImg2());
			f2.delete();
		}
		
		productService.productDelete(pno);
		productService.optionAllDelete(pno);
		return "redirect:productSearch";
	}
	
	@RequestMapping("/productDeleteMany")
	@ResponseBody
	public int productDeleteMany(HttpServletRequest req,
			@RequestParam(value="checked", required=true) String pnoArr[]) {
		int cnt=0;
		for(int i=0; i<pnoArr.length; i++) {
			// 원래 DB 파일명 가져오기
			int pno = Integer.parseInt(pnoArr[i]);
			ProductVO dbFilename = productService.productSelect(pno);
			String path = req.getSession().getServletContext().getRealPath("/upload");
			File f = new File(path, dbFilename.getImg1());
			f.delete();
			if(dbFilename.getImg2()!=null && !dbFilename.getImg2().equals("")) {
				File f2 = new File(path, dbFilename.getImg2());
				f2.delete();
			}
			int result = productService.productDelete(pno);
			cnt += result;
			productService.optionAllDelete(pno);
		}
		
		return cnt;
	}
	
	// SummerNote upload
	@RequestMapping(value="/uploadSummernoteImageFile", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadSummernoteImageFile(
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest req
			) {
		
		// 저장할 경로 위치 설정 (웹루트로 업로드하면 빌드하고 재배포시 이미지가 사라짐 외부 경로에 잡아준다.)
		String path = req.getSession().getServletContext().getRealPath("/summernote");
		System.out.println(path);
		// 파일명 구하기
		String orgName = multipartFile.getOriginalFilename();
		// transferTo : 실제 업로드 발생
		try {
			if(orgName!=null && !orgName.equals("")) {
				multipartFile.transferTo(new File(path, orgName));
				// 업로드 시키기 (path경로에 orgName을 업로드 시킨다)
				
			}
		} catch(Exception e) {
			System.out.println("ProductController > summernote upload 에서 에러 발생!!!");
			e.printStackTrace();
		}
		
		return "/home/summernote/"+orgName;
	}

}