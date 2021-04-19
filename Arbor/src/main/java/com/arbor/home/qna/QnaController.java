package com.arbor.home.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
