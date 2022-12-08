package com.goodee.everydoctor.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public String chatGet() {
		return "thymeleaf/chat";
	}
}
