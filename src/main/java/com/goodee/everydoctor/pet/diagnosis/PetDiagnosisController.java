package com.goodee.everydoctor.pet.diagnosis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pet/diagnosis/*")
public class PetDiagnosisController {

	@GetMapping("reservation")
	public String getDiagnosisReservation() throws Exception {
		return "pet/diagnosis/diagnosisReservation";
	}
	
}
