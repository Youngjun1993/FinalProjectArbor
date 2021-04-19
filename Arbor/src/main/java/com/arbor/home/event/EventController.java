package com.arbor.home.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	@RequestMapping("/event")
	public String eventPage() {
		return "event/event";
	}

}
