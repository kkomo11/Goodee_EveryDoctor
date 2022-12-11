package com.goodee.everydoctor.hospital.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalHomeService;
import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Controller
@RequestMapping("/hospital/diagnosis/*")
public class HospitalDiagnosisController {
	
	@Autowired
	private HospitalHomeService hospitalHomeService;

	@GetMapping("reservation")
	public ModelAndView loadHospitalDiagnosis(ModelAndView modelAndView, HospitalDiagnosisVO diagnosisVO) throws Exception {
		List<HospitalSectionVO> sectionList = hospitalHomeService.findHospitalSection();
		modelAndView.setViewName("hospital/diagnosis");
		modelAndView.addObject("diagnosisVO", diagnosisVO);
		modelAndView.addObject("sectionList", sectionList);
		return modelAndView;
	}
	
	@PostMapping("reservation")
	public String inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO, FileVO fileVO) throws Exception {
		
		
		
		return "redirect:/user/mydiaglist";
	}
}
