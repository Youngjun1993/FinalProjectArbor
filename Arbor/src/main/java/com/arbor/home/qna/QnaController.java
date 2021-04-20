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
	
	@RequestMapping("/qnaList")
	public ModelAndView qnaList() {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.allList());
		mav.setViewName("client/qna/qnaList");
		return mav;
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "client/qna/qnaWrite";
	}
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
	public String qnaView(int qnano, Model model) {
		QnaDAOimp dao = sqlSession.getMapper(QnaDAOimp.class);
		QnaVO vo = dao.qnaSelect(qnano);
		model.addAttribute("vo",vo);
		
		return "client/qna/qnaView";
	}
}
