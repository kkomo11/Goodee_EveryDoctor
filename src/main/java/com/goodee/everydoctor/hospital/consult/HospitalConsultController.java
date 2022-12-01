package com.goodee.everydoctor.hospital.consult;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital/consult/*")
public class HospitalConsultController {

	@GetMapping("write")
	public String loadHospitalConsult() throws Exception {
		return "hospital/hospitalConsultWrite";
	}
}
