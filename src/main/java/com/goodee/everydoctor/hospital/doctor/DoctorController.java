package com.goodee.everydoctor.hospital.doctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital/doctor/*")
public class DoctorController {
	
	@GetMapping("detail")
	public String doctorDetail() throws Exception {
		return "hospital/doctorDetail";
	}
}