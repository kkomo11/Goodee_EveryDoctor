package com.goodee.everydoctor.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public void setReport()throws Exception{
		
	}
	
	@PostMapping("write")
	public ModelAndView setReport(ReportVO reportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reportService.setReport(reportVO);
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getReportList(ReportVO reportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}

}
