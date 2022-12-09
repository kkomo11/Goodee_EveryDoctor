package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hospital/doctor/*")
public class HospitalDoctorController {
	
	@Autowired
	private HospitalDoctorService hospitalDoctorService;
	
	@GetMapping("detail")
	public String doctorDetail(HospitalDoctorVO doctorVO) throws Exception {
		
		return "hospital/doctorDetail";
	}
	
	@GetMapping("management")
	public String doctorManagement() throws Exception {
		return "hospital/doctorManagement";
	}
	
	@GetMapping("/diagnosis/detail")
	public String diagnosisDetail() throws Exception {
		return "hospital/diagnosisDetail";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public ModelAndView doctorList(ModelAndView modelAndView) throws Exception {
		List<HospitalDoctorVO> doctorList = hospitalDoctorService.findDoctorList();
		modelAndView.addObject("doctorList", doctorList);
		modelAndView.setViewName("hospital/doctorList");
		return modelAndView;
	}
}
