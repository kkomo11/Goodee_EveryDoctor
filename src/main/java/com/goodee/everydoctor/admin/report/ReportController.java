package com.goodee.everydoctor.admin.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/report/*")
public class ReportController {

	@Autowired
	private ReportService reportService;

	//신고 등록
	@PostMapping("write")
	public String inputReport(ReportVO reportVO, String num)throws Exception{
		//		if(bindingResult.hasErrors()) {
		//			log.info("======== 검증 Error 발생 ========");
		//			mv.setViewName("./write");
		//			return mv;
		//		}
		//		String redirectUrl = req.getRequestURL().toString();
		//		log.info("========== RedirectUrl : {}",redirectUrl);
		int result = reportService.inputReport(reportVO);
		log.info("========= NUM: {}", num);
		//		mv.setViewName("redirect:write");
		return "redirect:/consult/detail?consultNum="+num;
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
