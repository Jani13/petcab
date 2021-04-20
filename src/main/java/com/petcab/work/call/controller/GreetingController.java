package com.petcab.work.call.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;

public class GreetingController {
	@Autowired
	private SimpMessagingTemplate template;

	@Autowired
	public GreetingController(SimpMessagingTemplate template) {
		this.template = template;
	}

	//    @RequestMapping(value="/greetings", method=(RequestMethod.POST))
	//    public void greet(String greeting) {
	//        String text = greeting;
	//        this.template.convertAndSend("/topic/greetings", text);
	//    }

	@MessageMapping("/hello")
	@SendTo("/topic/greeting")
	public String handle(String greeting) {

		System.out.println(greeting);

		return greeting;
	}
}
