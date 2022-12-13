package com.goodee.everydoctor.admin.agency;

import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.medic.MedicSectionVO;
import com.goodee.everydoctor.admin.medic.MedicService;
import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.hospital.HospitalHomeService;
import com.goodee.everydoctor.hospital.HospitalSectionVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/agency/*")
public class AgencyController {
	
	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private MedicService medicService;
	
	@Autowired
	private HospitalHomeService hospitalHomeService;
	
	@GetMapping("regist")
	public ModelAndView inputAgency()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HospitalSectionVO> petSectionList = agencyService.findPetHospitalSection();
		List<HospitalSectionVO> hospitalSectionList = hospitalHomeService.findHospitalSection();
		mv.addObject("petSectionList", petSectionList);
		mv.addObject("hospitalSectionList", hospitalSectionList);
		mv.setViewName("/admin/agency/regist");
		return mv;
	}
	
	//기관과 종사자를 한꺼번에 INSERT
	@PostMapping("regist")
	public ModelAndView inputAgency(AgencyVO agencyVO, MedicVO medicVO, AgencyWorkHourVO agencyWorkHourVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		log.info("======== AgencyController 실행 ========");
		//기관 정보 INSERT
		int agencyResult = agencyService.inputAgency(agencyVO);
		log.info("===== agencyResult : {}", agencyResult);
		//기관 AgencyNum 받아오기
		medicVO.setAgencyNum(agencyVO.getAgencyNum());
		//종사자 정보 등록
		int medicResult = medicService.inputMedic(medicVO);
		log.info("===== medicResult : {}", medicResult);
		//기관 운영시간 참조할 agencyNum Set
		agencyWorkHourVO.setAgencyNum(agencyVO.getAgencyNum());
		//기관 운영시간 INSERT
		int agencyWorkHourResult = agencyService.inputAgencyWorkHour(agencyWorkHourVO);
		log.info("===== workHourResult : {}", agencyWorkHourResult);
		
		mv.setViewName("redirect:regist");
		return mv;
	}
	
	@GetMapping("petHospitalSection")
	@ResponseBody
	public List<HospitalSectionVO> findPetHospitalSection()throws Exception{
		return agencyService.findPetHospitalSection();
	}

}
