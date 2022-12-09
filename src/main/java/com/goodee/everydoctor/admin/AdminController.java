package com.goodee.everydoctor.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.medic.MedicVO;
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
	
	@Autowired
	private AdminService adminService;
	
	//신고리스트
	@GetMapping("reportList")
	public ModelAndView findReportList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReportVO> reportList = reportService.findReportList(pager);
		mv.addObject("list", reportList);
		mv.addObject("pager", pager);
		mv.setViewName("/admin/admin/reportList");
		return mv;
	}
	
	@GetMapping("cooperationList")
	public void cooperationList()throws Exception{
		
	}
	
	//제휴신청 리스트 불러오기
	@GetMapping("findCooperationList")
	@ResponseBody
	public Map<String, Object> findCooperationList(Pager pager)throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("list", adminService.findCooperationList(pager));
		return map;
	}

}
