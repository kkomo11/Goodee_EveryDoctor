package com.goodee.everydoctor.admin.medic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.agency.AgencyVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/medic/*")
public class MedicController {
	
	@GetMapping("regist")
	public void inputMedic()throws Exception{
		
	}
	
	@PostMapping("regist")
	public String inputMedic(MedicVO medicVO, AgencyVO agencyVO)throws Exception{
		
		return "redirect:regist";
	}

}
