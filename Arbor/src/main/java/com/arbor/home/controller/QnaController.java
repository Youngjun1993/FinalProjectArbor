package com.arbor.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.dao.QnaDAOImp;
import com.arbor.home.service.QnaServiceImp;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.QnaVO;

@Controller
public class QnaController {

	@Inject
	QnaServiceImp qnaService;
	
	//아이디 로그인시 sql문 수정해야함 !!(리스트 아이디에 해당되는것만 뿌려주기)
	@RequestMapping("/qnaList")
	public ModelAndView qnaList(HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		
		pageVo.setTotalRecord(qnaService.totalRecord(pageVo));
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", qnaService.allList(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("client/qna/qnaList");
		
		return mav;
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "client/qna/qnaWrite";
	}
	
	//세션 아이디 가져오기 수정해야됨 2021-04-20
	@RequestMapping(value="/qnaWriteOk", method=RequestMethod.POST)
	public ModelAndView qnaWriteOk(QnaVO vo) {
		vo.setUserid("zerojunee");
		
		int cnt = qnaService.qnaInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:qnaList");
		}else {
			mav.setViewName("redirect:qnaWrite");
		}
		
		return mav;
	}
	@RequestMapping("/qnaView")
	public String qnaView(int qnano, HttpServletRequest req) {
		QnaVO vo = qnaService.qnaSelect(qnano);
		
		req.setAttribute("vo",vo);
		
		
		return "client/qna/qnaView";
	}
	@RequestMapping("/qnaEdit")
	public ModelAndView qnaEdit(int qnano) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", qnaService.qnaSelect(qnano));
		mav.setViewName("client/qna/qnaEdit");
		
		return mav;
	}
	//세션 아이디값 가져오기 수정해야됨 2021-04-20
	@RequestMapping("/qnaEditOk")
	public ModelAndView qnaEditOk(QnaVO vo) {
		int cnt = qnaService.qnaUpdate(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnano", vo.getQnano());
		if(cnt>0) {
			mav.setViewName("redirect:qnaView");
		}else {
			mav.setViewName("redirect:qnaEdit");
		}
		return mav;
	}
	@RequestMapping("/qnaDel")
	public ModelAndView qnaDel(int no) {
		
		ModelAndView mav = new ModelAndView();
		if(qnaService.qnaDelete(no)>0) {
			mav.setViewName("redirect:qnaList");
		}else {
			mav.setViewName("redirect:qnaView");
		}
		return mav;
	}
	
	//////////////////// ADMIN //////////////////////////
	//검색추가
	@RequestMapping("/qnaAdList")
	public ModelAndView qnaSearchList(HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVo.setQnaSearchKey(req.getParameter("qnaSearchKey"));
		pageVo.setQnaSearchWord(req.getParameter("qnaSearchWord"));
		
		pageVo.setTotalRecord(qnaService.totalRecord(pageVo));
		
		QnaVO vo = qnaService.qnaAdAnsCount();
		vo.setAnsBtnCheck("N");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("ansBtnCheck", vo.getAnsBtnCheck());
		mav.addObject("countAns", vo.getCountans());
		mav.addObject("list", qnaService.onePageRecordSelect(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/qna/qnaAdList");
		
		return mav;
	}
	//미답변 질문만 보기
	@RequestMapping("/qnaNoAnswerList")
	public ModelAndView qnaNoAnswerList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		pageVo.setTotalRecord(qnaService.noAnswerTotal(pageVo));
		
		QnaVO vo = qnaService.qnaAdAnsCount();
		vo.setAnsBtnCheck("Y");
		mav.addObject("ansBtnCheck", vo.getAnsBtnCheck());
		mav.addObject("countAns", vo.getCountans());
		mav.addObject("list", qnaService.noAnswerSelect(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/qna/qnaAdList");
		
		return mav;
	}
	
	@RequestMapping("/qnaAdView")
	public ModelAndView qnaAdView(int qnano, HttpServletRequest req) {
		PageSearchVO pageVo = new PageSearchVO();
		QnaVO vo = qnaService.qnaSelect(qnano);
		
		pageVo.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		pageVo.setQnaSearchKey(req.getParameter("qnaSearchKey"));
		pageVo.setQnaSearchWord(req.getParameter("qnaSearchWord"));
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("ansBtnCheck", req.getParameter("ansBtnCheck"));
		mav.addObject("vo",vo);
		mav.addObject("pageVO", pageVo);
		
		String editAddr = "qnano="+vo.getQnano()+"&pageNum="+pageVo.getPageNum();
		if(pageVo.getQnaSearchWord() != null && pageVo.getQnaSearchWord().equals("")) {
			editAddr += "&qnaSearchKey="+pageVo.getQnaSearchKey()+"&qnaSearchWord="+pageVo.getQnaSearchWord();
		}
		mav.addObject("editAddr", editAddr);
		
		mav.setViewName("admin/qna/qnaAdView");
		return mav;
	}
	@RequestMapping("/qnaAdUpdate")
	public ModelAndView qnaAdUpdate(int qnano, String answercontent, HttpServletRequest req) {
		
		int cnt = qnaService.qnaAdUpdate(qnano, answercontent);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnano", qnano);
		
		if(cnt>0) {
			mav.setViewName("redirect:qnaAdList");
		}else {
			mav.setViewName("redirect:qnaAdView");
		}
		return mav;
	}
	@RequestMapping("/qnaAdDel")
	public ModelAndView qnaAdDel(int no) {
		
		ModelAndView mav = new ModelAndView();
		if(qnaService.qnaDelete(no)>0) {
			mav.setViewName("redirect:qnaAdList");
		}else {
			mav.setViewName("redirect:qnaAdView");
		}
		return mav;
	}
	
}
