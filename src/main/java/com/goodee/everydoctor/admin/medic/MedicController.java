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

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/medic/*")
public class MedicController {
	
	@Autowired
	private MedicService medicService;
	
	@Autowired
	private AgencyService agencyService;
	
	//종사자 추가 등록
	@GetMapping("regist")
	public ModelAndView inputMedic()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AgencyVO> list = agencyService.findAgencyList();
		mv.addObject("list", list);
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
