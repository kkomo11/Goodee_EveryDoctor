package com.goodee.everydoctor.admin.medic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.agency.AgencyService;
import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.hospital.HospitalHomeService;
import com.goodee.everydoctor.hospital.HospitalSectionVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/medic/*")
public class MedicController {
	
	@Autowired
	private MedicService medicService;
	
	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private HospitalHomeService hospitalHomeService;
	
	//종사자 추가 등록
	@GetMapping("regist")
	public ModelAndView inputMedic()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AgencyVO> hospitalList = agencyService.findHospitalList();
		List<AgencyVO> petHospitalList = agencyService.findPetHospitalList();
		List<AgencyVO> pharmacyList = agencyService.findPharmacyList();
		List<AgencyVO> petHotelList = agencyService.findPetHotelList();
		List<HospitalSectionVO> petSectionList = agencyService.findPetHospitalSection();
		List<HospitalSectionVO> hospitalSectionList = hospitalHomeService.findHospitalSection();
		mv.addObject("hospitalList", hospitalList);
		mv.addObject("petHospitalList", petHospitalList);
		mv.addObject("pharmacyList", pharmacyList);
		mv.addObject("petHotelList", petHotelList);
		mv.addObject("petSectionList", petSectionList);
		mv.addObject("hospitalSectionList", hospitalSectionList);
		mv.setViewName("admin/medic/regist");
		return mv;
	}
	
	//종사자 추가 등록
	@PostMapping("regist")
	public String inputMedic(MedicVO medicVO, AgencyVO agencyVO)throws Exception{
		int result = medicService.inputMedic(medicVO);
		return "redirect:regist";
	}

}
