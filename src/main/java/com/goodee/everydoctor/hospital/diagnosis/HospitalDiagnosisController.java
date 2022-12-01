package com.goodee.everydoctor.hospital.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.hospital.HospitalHomeService;
import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Controller
@RequestMapping("/hospital/diagnosis/*")
public class HospitalDiagnosisController {
	
	@Autowired
	private HospitalHomeService hospitalHomeService;

	@GetMapping("application")
	public ModelAndView loadHospitalDiagnosis(ModelAndView modelAndView) throws Exception {
		List<HospitalSectionVO> sectionList = hospitalHomeService.findHospitalSection();
		modelAndView.setViewName("hospital/diagnosis");
		modelAndView.addObject("sectionList", sectionList);
		return modelAndView;
	}
}
