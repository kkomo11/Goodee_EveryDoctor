package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Controller
@RequestMapping("/hospital/doctor/*")
public class HospitalDoctorController {
	
	@Autowired
	private HospitalDoctorService hospitalDoctorService;
	
	@GetMapping("detail")
	public ModelAndView doctorDetail(HospitalDoctorVO doctorVO, ModelAndView modelAndView) throws Exception {
		
		doctorVO = hospitalDoctorService.findDoctorDetail(doctorVO);
		modelAndView.addObject("doctorVO", doctorVO);
		modelAndView.setViewName("hospital/doctorDetail");
		
		return modelAndView;
	}
	
	@GetMapping("/diagnosis/detail")
	public String diagnosisDetail() throws Exception {
		return "hospital/diagnosisDetail";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public ModelAndView doctorList(ModelAndView modelAndView, HospitalMainPager HospitalMainPager) throws Exception {
		List<HospitalDoctorVO> doctorList = hospitalDoctorService.findDoctorList(HospitalMainPager);
		modelAndView.addObject("doctorList", doctorList);
		modelAndView.addObject("pager", HospitalMainPager);
		modelAndView.setViewName("hospital/doctorList");
		return modelAndView;
	}
}
