package com.arbor.home.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	
	@RequestMapping("/qnaList")
	public String qnaList() {
		return "client/qna/qnaList";
	}
}
