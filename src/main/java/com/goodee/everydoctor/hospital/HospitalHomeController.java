package com.goodee.everydoctor.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HospitalHomeController {

	@Autowired
	private HospitalHomeService hospitalHomeService;
	
	@GetMapping("/hospital/home")
	public ModelAndView home(ModelAndView mv) throws Exception {
		
		List<HospitalSectionVO> sectionList = hospitalHomeService.findHospitalSection();
		List<HospitalCategoryVO> categoryList = hospitalHomeService.findHospitalCategory();
		mv.addObject("sectionList", sectionList);
		mv.addObject("categoryList", categoryList);
		mv.setViewName("hospital/hospitalMain");
		return mv;
	}
}
