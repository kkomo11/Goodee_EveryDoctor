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

import com.goodee.everydoctor.admin.medic.MedicService;
import com.goodee.everydoctor.admin.medic.MedicVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/agency/*")
public class AgencyController {
	
	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private MedicService medicService;
	
	@GetMapping("regist")
	public void inputAgency()throws Exception{
		
	}
	
	//기관과 종사자를 한꺼번에 INSERT
	@PostMapping("regist")
	public ModelAndView inputAgency(AgencyVO agencyVO, MedicVO medicVO, AgencyWorkHourVO agencyWorkHourVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//기관 정보 INSERT
		int agencyResult = agencyService.inputAgency(agencyVO);
		log.info("agencyResult : {}", agencyResult);
		//기관 AgencyNum 받아오기
		medicVO.setAgencyNum(agencyVO.getAgencyNum());
		//종사자 정보 등록
		int medicResult = medicService.inputMedic(medicVO);
		log.info("medicResult : {}", medicResult);
		//기관 운영시간 참조할 agencyNum Set
		agencyWorkHourVO.setAgencyNum(agencyVO.getAgencyNum());
		//기관 운영시간 INSERT
		int agencyWorkHourResult = agencyService.inputAgencyWorkHour(agencyWorkHourVO);
		log.info("workHourResult : {}", agencyWorkHourResult);
		
		mv.setViewName("redirect:regist");
		return mv;
	}

}
