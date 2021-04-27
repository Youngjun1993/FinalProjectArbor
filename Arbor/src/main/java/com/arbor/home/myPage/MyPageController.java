package com.arbor.home.myPage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.PageSearchVO;
import com.arbor.home.orderTbl.OrderTblVO;
import com.arbor.home.subOrder.SubOrderVO;

@Controller
public class MyPageController {
	@Autowired
	SqlSession sqlSession;
	
	//마이페이지 구매내역
	@RequestMapping("/purchaseList")
	public ModelAndView purchaseList(HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		MyPageDAOImp dao = sqlSession.getMapper(MyPageDAOImp.class);
		ModelAndView mav = new ModelAndView();
		PageSearchVO pageVo = new PageSearchVO();
		List<OrderTblVO> orderVo = dao.purchaseList(pageVo);
		
		pageVo.setTotalRecord(dao.totalRecord(pageVo));
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		mav.addObject("list", orderVo);
		mav.addObject("pageVO", pageVo);
		
		mav.setViewName("client/myPage/myPageMain");
		return mav;
	}
	//구매내역 상품상페 팝업
	@RequestMapping("/orderPopup")
	@ResponseBody
	public List<OrdsubOrdJoinVO> orderPopup(int orderno) {
		MyPageDAOImp dao = sqlSession.getMapper(MyPageDAOImp.class);
		List<OrdsubOrdJoinVO> list = dao.suborderList(orderno);
		
		return list;
	}
	
}
