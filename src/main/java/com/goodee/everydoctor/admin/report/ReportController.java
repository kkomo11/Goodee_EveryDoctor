package com.goodee.everydoctor.admin.report;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/report/*")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	//신고 등록 페이지
	@GetMapping("write")
	public void inputReport(@ModelAttribute ReportVO reportVO)throws Exception{
		
	}
	
	//신고 등록
	@PostMapping("write")
	public ModelAndView inputReport(@Valid ReportVO reportVO, BindingResult bindingResult, ModelAndView mv)throws Exception{
		if(bindingResult.hasErrors()) {
			log.info("======== 검증 Error 발생 ========");
			mv.setViewName("./write");
			return mv;
		}
		
		int result = reportService.inputReport(reportVO);
		mv.setViewName("redirect:write");
		return mv;
	}
	
	//신고 답변 등록
	@PostMapping("answer")
	public String inputReportAnswer(ReportAnswerVO reportAnswerVO)throws Exception{
		int result = reportService.inputReportAnswer(reportAnswerVO);
		return "redirect:/admin/admin/reportList";
	}
	
	//신고 디테일 불러오기
	@GetMapping("detail")
	@ResponseBody
	public ReportVO findReportDetail(ReportVO reportVO)throws Exception{
		return reportService.findReportDetail(reportVO);
	}
	

}
