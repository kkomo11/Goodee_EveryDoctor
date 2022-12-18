package com.goodee.everydoctor.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.admin.report.ReportService;
import com.goodee.everydoctor.admin.report.ReportVO;
import com.goodee.everydoctor.user.UserVO;
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
	
	//제휴신청 리스트 모달창에 가져올 Detail 내용
	@GetMapping("findCooperationDetail")
	@ResponseBody
	public MedicVO findCooperationDetail(String username)throws Exception{
		return adminService.findCooperationDetail(username);
	}
	
	//관리자 승인 시 종사자 role 의사로 바꾸기
	@PostMapping("modifyRoleDoctor")
	@ResponseBody
	public int inputRoleDoctor(UserVO userVO)throws Exception{
		return adminService.inputRoleDoctor(userVO);
	}
	
	//관리자 승인 시 종사자 role 간호사로 바꾸기
	@PostMapping("modifyRoleNurse")
	@ResponseBody
	public int inputRoleNurse(UserVO userVO)throws Exception{
		return adminService.inputRoleNurse(userVO);
	}
	
	//관리자 승인 시 종사자 role 수의사로 바꾸기
	@PostMapping("modifyRolePetDoc")
	@ResponseBody
	public int inputRolePetDoc(UserVO userVO)throws Exception{
		return adminService.inputRolePetDoc(userVO);
	}
			
	//관리자 승인 시 종사자 role 수간호사로 바꾸기
	@PostMapping("modifyRolePetNurse")
	@ResponseBody
	public int inputRolePetnurse(UserVO userVO)throws Exception{
		return adminService.inputRolePetnurse(userVO);
	}
	
	//MedicEnabled 1로 수정
	@PostMapping("modifyMedicEnabled")
	@ResponseBody
	public int modifyMedicEnabled(String username)throws Exception{
		return adminService.modifyMedicEnabled(username);
	}
	
	@GetMapping("dashboard")
	public ModelAndView dashboard()throws Exception{
		ModelAndView mv = new ModelAndView();
		int findMonthlyDiagnosisCount = adminService.findMonthlyDiagnosisCount();
		int findDailyDiagnosisCount = adminService.findDailyDiagnosisCount();
		int findMonthlyPetDiagnosisCount = adminService.findMonthlyPetDiagnosisCount();
		int findDailyPetDiagnosisCount = adminService.findDailyPetDiagnosisCount();
		mv.addObject("findMonthlyDiagnosisCount", findMonthlyDiagnosisCount);
		mv.addObject("findDailyDiagnosisCount", findDailyDiagnosisCount);
		mv.addObject("findMonthlyPetDiagnosisCount", findMonthlyPetDiagnosisCount);
		mv.addObject("findDailyPetDiagnosisCount", findDailyPetDiagnosisCount);
		mv.setViewName("/admin/admin/dashboard");
		return mv;
	}
	
	//이번 달 신청된 병원 진료 수
	@GetMapping("findDoughnutChart")
	@ResponseBody
	public Map<String, Object> findDashboard()throws Exception{
		Map<String, Object> map = new HashMap<>();
		int findThisMonthReport = adminService.findThisMonthReport();
		int findThisMonthReportChecked = adminService.findThisMonthReportChecked();
		int findThisMonthReportUnchecked = findThisMonthReport - findThisMonthReportChecked;
		map.put("findThisMonthReport", findThisMonthReport);
		map.put("findThisMonthReportChecked", findThisMonthReportChecked);
		map.put("findThisMonthReportUnchecked", findThisMonthReportUnchecked);
		return map;
	};
	

}
