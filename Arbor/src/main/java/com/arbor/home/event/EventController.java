package com.arbor.home.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	/* client */
	@RequestMapping("/event")
	public String eventPage() {
		return "client/event/event";
	}
	@RequestMapping("/eventView")
	public String eventView() {
		return "client/event/eventView";
	}
	
	
	//////////////////////////////////////////////////////////
	/* admin */
	@RequestMapping("/eventInsert")
	public String eventInsert() {
		return "admin/event/eventInsert";
	}
	
	

}
