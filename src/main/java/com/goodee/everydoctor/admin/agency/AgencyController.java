package com.goodee.everydoctor.admin.agency;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/agency/*")
public class AgencyController {
	
	@GetMapping("registPage")
	public void inputAgency(@ModelAttribute AgencyVO agencyVO)throws Exception{
		
	}
	
	@PostMapping("registPage")
	public ModelAndView inputAgency(@Valid AgencyVO agencyVO, BindingResult bindingResult)throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}

}
