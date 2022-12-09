package com.goodee.everydoctor.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HospitalHomeController {

	@Autowired
	private HospitalHomeService hospitalHomeService;
	
	@GetMapping("/hospital/home")
	public ModelAndView home(ModelAndView modelAndView) throws Exception {
		
		List<HospitalSectionVO> sectionList = hospitalHomeService.findHospitalSection();
		List<HospitalCategoryVO> categoryList = hospitalHomeService.findHospitalCategory();
		modelAndView.addObject("sectionList", sectionList);
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.setViewName("hospital/hospitalMain");
		return modelAndView;
	}
	
	//남진/제휴 문의 시 전문의 여부 입력 위해 병원 진료 카테고리 목록 가져오기
	@GetMapping("/hospital/home/section")
	@ResponseBody
	public List<HospitalSectionVO> findHospitalSection() throws Exception{
		return hospitalHomeService.findHospitalSection();
	}
}
