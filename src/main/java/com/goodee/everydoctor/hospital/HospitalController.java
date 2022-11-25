package com.goodee.everydoctor.hospital;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HospitalController {

	@GetMapping("/hospital")
	public String home() throws Exception {
		return "hospital/hospitalMain";
	}
}
