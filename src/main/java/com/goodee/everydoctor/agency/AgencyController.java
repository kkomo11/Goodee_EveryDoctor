package com.goodee.everydoctor.agency;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/agency/*")
public class AgencyController {
	
	@GetMapping("regist")
	public void inputAgency(@ModelAttribute AgencyVO agencyVO)throws Exception{
		
	}

}
