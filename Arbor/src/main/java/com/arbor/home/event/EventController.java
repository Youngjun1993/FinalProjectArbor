package com.arbor.home.event;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	@Autowired
	SqlSession sqlSession;
	
	/* client */
	@RequestMapping("/event")
	public ModelAndView eventPage() {
		EventDAOImp dao = sqlSession.getMapper(EventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.eventList());
		mav.addObject("endList", dao.closeEvent());
		mav.setViewName("client/event/event");
		return mav;
	}
	@RequestMapping("/eventView")
	public String eventView() {
		return "client/event/eventView";
	}
	
	
	//////////////////////////////////////////////////////////
	/* admin */
	@RequestMapping("/eventList")
	public ModelAndView eventList(){
		EventDAOImp dao = sqlSession.getMapper(EventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.eventList());
		mav.setViewName("admin/event/eventList");
		return mav;
		
	}
	@RequestMapping("/eventInsert")
	public String eventInsert() {
		return "admin/event/eventInsert";
	}
	@RequestMapping(value="/eventInsertOk", method=RequestMethod.POST)
	public ModelAndView eventInsertOk(EventVO vo, HttpServletRequest req,
			@RequestParam("img1") MultipartFile eventimg1,
			@RequestParam("img2") MultipartFile eventimg2) {				
		//파일 저장위치
		String path = req.getSession().getServletContext().getRealPath("/upload");
		String orgName1 = eventimg1.getOriginalFilename();
		String orgName2 = eventimg2.getOriginalFilename();
		
		//////////////////////////////////
		System.out.println("*** 이벤트 등록 정보 ***");
		System.out.println(vo.getEventSubject());
		System.out.println(vo.getEventContent());
		System.out.println(vo.getEventStart());
		System.out.println(vo.getEventEnd());
		System.out.println(orgName1);
		System.out.println(orgName2);
		System.out.println("파일 저장 위치 : "+path);
		//////////////////////////////////

		//파일 업로드
		try {
			if(orgName1!=null && !orgName1.equals("")) {
				eventimg1.transferTo(new File(path, orgName1));
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			if(orgName2!=null && !orgName2.equals("")) {
				eventimg2.transferTo(new File(path, orgName2));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//DB 처리
		vo.setEventImg1(orgName1);
		vo.setEventImg2(orgName2);
		System.out.println("첨부파일 1-->"+vo.getEventImg1());
		System.out.println("첨부파일 2-->"+vo.getEventImg2());
				
		EventDAOImp dao = sqlSession.getMapper(EventDAOImp.class);
		
		ModelAndView mav = new ModelAndView();
		if(dao.eventInsert(vo)>0) {
			System.out.println("이벤트 등록 성공 !");
			//mav.setViewName("redirect:eventList");
		}else {
			if(orgName1!=null) {
				System.out.println("이벤트 등록 실패 (첨부1)");
				//mav.setViewName("redirect:eventInsert");
				File f = new File(path, orgName1);
				f.delete();
			}
			if(orgName2!=null) {
				System.out.println("이벤트 등록 실패 (첨부2)");
				File f = new File(path, orgName2);
				f.delete();
			}
		}
		return mav;
	}
	@RequestMapping("/eventContent")
	public ModelAndView eventContentView(int no) {
		EventDAOImp dao = sqlSession.getMapper(EventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", dao.eventSelect(no));
		mav.setViewName("admin/event/eventContent");
		return mav;
	}
	
	
	

}
