package com.arbor.home.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.dao.EventDAOImp;
import com.arbor.home.service.EventServiceImp;
import com.arbor.home.vo.EventVO;
import com.google.gson.JsonObject;

@Controller
public class EventController {
	
	@Inject
	EventServiceImp eventService;
	
	/* client */
	@RequestMapping("/event")
	public ModelAndView eventPage(String title, EventVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", eventService.eventList(vo));
		mav.addObject("endList", eventService.closeEvent(vo));
		mav.addObject("title", title);
		mav.setViewName("client/event/event");
		return mav;
	}
	@RequestMapping("/eventContent")
	public ModelAndView eventContent(int eventNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", eventService.eventSelect(eventNo));
		mav.addObject("pnList", eventService.lagLeadSelect(eventNo));

		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		String nowDate = format.format(now);
		mav.addObject("now", now);
		System.out.println("nowDate->"+nowDate);
		
		mav.setViewName("client/event/eventContent");
		return mav;
	}
	
	
	//////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////	
	
	/* admin */
	@RequestMapping("/eventList")
	public ModelAndView eventList(EventVO vo){
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", eventService.eventAllSelect(vo));
		mav.setViewName("admin/event/eventList");
		return mav;
	}

  @RequestMapping("/eventInsert")
	public String eventInsert() {
		return "admin/event/eventInsert";
	}

	@RequestMapping(value="/eventInsertOk", method=RequestMethod.POST)
	public ModelAndView eventInsertOk(EventVO vo, HttpSession session,
			@RequestParam("img1") MultipartFile eventimg1) {				
		//파일 저장위치
		String path = session.getServletContext().getRealPath("/upload");
		String orgName = eventimg1.getOriginalFilename();
		
		//////////////////////////////////
		System.out.println("*** 이벤트 등록 정보 ***");
		System.out.println(vo.getEventSubject());
		System.out.println(vo.getEventContent());
		System.out.println(vo.getEventStart());
		System.out.println(vo.getEventEnd());
		System.out.println(orgName);
		System.out.println("파일 저장 위치 : "+path);
		//////////////////////////////////

		//파일 업로드
		try {
			if(orgName!=null && !orgName.equals("")) {
				eventimg1.transferTo(new File(path, orgName));
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		//DB 처리
		vo.setEventImg1(orgName);
		
		ModelAndView mav = new ModelAndView();
		if(eventService.eventInsert(vo)>0) {
			System.out.println("이벤트 등록 성공 !");
			mav.setViewName("redirect:eventList");
		}else {
			if(orgName!=null) {
				System.out.println("이벤트 등록 실패 (첨부1)");
				mav.setViewName("redirect:eventInsert");
				File f = new File(path, orgName);
				f.delete();
			}
		}
		return mav;
	}
	
	@RequestMapping("/eventView")
	public ModelAndView eventView(int eventNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", eventService.eventSelect(eventNo));
		mav.setViewName("admin/event/eventView");
		return mav;
	}
	
	@RequestMapping("/eventEdit")
	public ModelAndView eventEdit(int eventNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", eventService.eventSelect(eventNo));
		mav.setViewName("admin/event/eventEdit");		
		return mav;
	}
	
	@RequestMapping(value="/eventEditOk", method=RequestMethod.POST)
	public ModelAndView eventEditOk(EventVO vo, HttpSession session, HttpServletRequest req,
			@RequestParam("img1") MultipartFile eventImg1) {

		ModelAndView mav = new ModelAndView();
		String path = session.getServletContext().getRealPath("/upload");
		
		//DB에서 파일명 가져오기
		EventVO fileVO = eventService.getFilename(vo.getEventNo());
		List<String> selFile = new ArrayList<String>();
		selFile.add(fileVO.getEventImg1());
		
		//삭제한 파일
		String delFile = req.getParameter("delFile");
		
		//새로운 파일 업로드
		String newFile = "";
		MultipartFile mf = eventImg1;
		
		System.out.println("====================");
		System.out.println("eventImg1->"+eventImg1.toString());
		System.out.println("mf->"+mf);
		
		if(mf!=null) {
			String orgName = mf.getOriginalFilename();
			System.out.println(orgName);
			if(orgName!=null && !orgName.equals("")) {
				File f = new File(path, orgName);
				int idx=0;
				while(f.exists()){
					int pnt = orgName.lastIndexOf(".");
					String fileName = orgName.substring(0, pnt);
					String extName = orgName.substring(pnt+1);
					
					f = new File(path, fileName+"("+ ++idx +")."+extName);
					System.out.println("======>"+f.getName());
				}
				try {
					mf.transferTo(f);			
				}catch(Exception e) {
					e.printStackTrace();
				}
				newFile = f.getName();
			}
		}
		//DB에서 삭제한 파일명 지우기
		if(delFile!=null) {	//수정 완료
			selFile.remove(delFile);
		}
		//DB에 새로 업로드된 파일명 추가
		vo.setEventImg1(newFile);
		System.out.println("newFile->"+newFile);
		System.out.println("vo->"+vo.toString());
		mav.addObject("eventNo", vo.getEventNo());
		
		if(eventService.eventUpdate(vo)>0) {
			File dFileObj = new File(path, delFile);
			dFileObj.delete();
			mav.setViewName("redirect:eventView");
		}else {	//수정 실패
			File dFileObj = new File(path, newFile);
			dFileObj.delete();
			mav.setViewName("redirect:eventEdit");
		}
		return mav;
	}
	
	@RequestMapping("eventDel")
	public ModelAndView eventDelete(int eventNo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(eventService.eventDelete(eventNo)>0) {
			mav.setViewName("redirect:eventList");
		}else {
			mav.addObject("eventNo", eventNo);
			mav.setViewName("redirect:eventEdit");
		}
		return mav;
	}
	

}
