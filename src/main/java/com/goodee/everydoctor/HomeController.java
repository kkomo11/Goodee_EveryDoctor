package com.goodee.everydoctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() throws Exception {
		return "index";
	}
	@GetMapping("/temp/chatbot3")
	public void chatbot3()throws Exception{
		
	}
}
