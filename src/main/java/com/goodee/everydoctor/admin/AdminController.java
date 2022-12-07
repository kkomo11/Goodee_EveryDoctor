package com.goodee.everydoctor.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.report.ReportService;
import com.goodee.everydoctor.admin.report.ReportVO;
import com.goodee.everydoctor.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/admin/*")
public class AdminController {
	
	@Autowired
	private ReportService reportService;
	
	@GetMapping("reportList")
	public ModelAndView findReportList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReportVO> reportList = reportService.findReportList(pager);
		mv.addObject("list", reportList);
		mv.addObject("pager", pager);
		mv.setViewName("/admin/admin/reportList");
		return mv;
	}

}
