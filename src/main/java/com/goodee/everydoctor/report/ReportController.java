package com.goodee.everydoctor.report;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/report/*")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@GetMapping("write")
	public void inputReport(@ModelAttribute ReportVO reportVO)throws Exception{
		
	}
	
	@PostMapping("write")
	public ModelAndView setReport(@Valid ReportVO reportVO, BindingResult bindingResult, ModelAndView mv)throws Exception{
		if(bindingResult.hasErrors()) {
			log.info("======== 검증 Error 발생 ========");
			mv.setViewName("report/write");
			return mv;
		}
		
		int result = reportService.inputReport(reportVO);
		mv.setViewName("redirect:write");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView findReportList(ReportVO reportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}

}
