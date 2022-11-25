package com.goodee.everydoctor.pet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pet/*")
public class PetHomeController {

	@GetMapping("home")
	public String getPetHomePage() throws Exception {
		return "pet/home";
	}
	
}
