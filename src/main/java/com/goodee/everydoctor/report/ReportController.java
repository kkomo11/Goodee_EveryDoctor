package com.goodee.everydoctor.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/report/*")
public class ReportController {
	
	@GetMapping("write")
	public void report()throws Exception{
		
	}

}
