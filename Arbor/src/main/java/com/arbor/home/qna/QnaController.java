package com.arbor.home.qna;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	@Autowired
	SqlSession sqlSession;
	
	//아이디 로그인시 sql문 수정해야함 !!(리스트 아이디에 해당되는것만 뿌려주기)
	@RequestMapping("/qnaList")
	public ModelAndView qnaList(HttpServletRequest req) {
		String pageNumStr = req.getParameter("pageNum");
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		QnaPageSearchVO pageVo = new QnaPageSearchVO();
		
		pageVo.setTotalRecord(dao.totalRecord(pageVo));
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.allList(pageVo));
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
		
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		int cnt = dao.qnaInsert(vo);
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
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		QnaVO vo = dao.qnaSelect(qnano);
		
		req.setAttribute("vo",vo);
		
		
		return "client/qna/qnaView";
	}
	@RequestMapping("/qnaEdit")
	public ModelAndView qnaEdit(int qnano) {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", dao.qnaSelect(qnano));
		mav.setViewName("client/qna/qnaEdit");
		
		return mav;
	}
	//세션 아이디값 가져오기 수정해야됨 2021-04-20
	@RequestMapping("/qnaEditOk")
	public ModelAndView qnaEditOk(QnaVO vo) {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		int cnt = dao.qnaUpdate(vo);
		
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
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		ModelAndView mav = new ModelAndView();
		if(dao.qnaDelete(no)>0) {
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
		QnaPageSearchVO pageVo = new QnaPageSearchVO();
		
		if(pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVo.setQnaSearchKey(req.getParameter("qnaSearchKey"));
		pageVo.setQnaSearchWord(req.getParameter("qnaSearchWord"));
		
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		pageVo.setTotalRecord(dao.totalRecord(pageVo));
		
		QnaVO vo = dao.qnaAdAnsCount();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("countAns", vo.getCountans());
		mav.addObject("list", dao.onePageRecordSelect(pageVo));
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/qna/qnaAdList");
		
		return mav;
	}
	@RequestMapping("/qnaAdView")
	public String qnaAdView(int qnano, HttpServletRequest req) {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		QnaPageSearchVO pageVo = new QnaPageSearchVO();
		QnaVO vo = dao.qnaSelect(qnano);
		
		pageVo.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		pageVo.setQnaSearchKey(req.getParameter("qnaSearchKey"));
		pageVo.setQnaSearchWord(req.getParameter("qnaSearchWord"));
		
		req.setAttribute("vo",vo);
		req.setAttribute("pageVO", pageVo);
		
		String editAddr = "qnano="+vo.getQnano()+"&pageNum="+pageVo.getPageNum();
		if(pageVo.getQnaSearchWord() != null && pageVo.getQnaSearchWord().equals("")) {
			editAddr += "&qnaSearchKey="+pageVo.getQnaSearchKey()+"&qnaSearchWord="+pageVo.getQnaSearchWord();
		}
		req.setAttribute("editAddr", editAddr);
		
		return "admin/qna/qnaAdView";
	}
	@RequestMapping("/qnaAdUpdate")
	public ModelAndView qnaAdUpdate(int qnano, String answercontent, HttpServletRequest req) {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		int cnt = dao.qnaAdUpdate(qnano, answercontent);
		
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
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		ModelAndView mav = new ModelAndView();
		if(dao.qnaDelete(no)>0) {
			mav.setViewName("redirect:qnaAdList");
		}else {
			mav.setViewName("redirect:qnaAdView");
		}
		return mav;
	}
	
}
