package com.goodee.everydoctor.hospital.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalHomeService;
import com.goodee.everydoctor.hospital.HospitalSectionVO;
import com.goodee.everydoctor.hospital.doctor.HospitalDoctorVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.sse.NotificationController;
import com.goodee.everydoctor.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hospital/diagnosis/*")
public class HospitalDiagnosisController {
	
	@Autowired
	private HospitalHomeService hospitalHomeService;
	@Autowired
	private HospitalDiagnosisService hospitalDiagnosisService;
	@Autowired
	private NotificationController notificationController;

	@GetMapping("reservation")
	public ModelAndView loadHospitalDiagnosis(ModelAndView modelAndView, HospitalDiagnosisVO diagnosisVO) throws Exception {
		List<HospitalSectionVO> sectionList = hospitalHomeService.findHospitalSection();
		modelAndView.setViewName("hospital/diagnosis");
		modelAndView.addObject("diagnosisVO", diagnosisVO);
		modelAndView.addObject("sectionList", sectionList);
		notificationController.dispatchEventToClients("새 진료신청", diagnosisVO.getDoctorName()+"님 진료신청이 들어왔습니다", "/hospital/doctor/management", "Doctor");
		return modelAndView;
	}
	
	@PostMapping("reservation")
	public String inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO, FileVO fileVO, @AuthenticationPrincipal UserVO userVO) throws Exception {
		
		hospitalDiagnosisVO.setUsername(userVO.getUsername());
		log.info("진료신청서를 보자{}", hospitalDiagnosisVO);
		log.info("fileVO도 보자 {}", fileVO);
		
		int result = hospitalDiagnosisService.inputHospitalDiagnosis(hospitalDiagnosisVO, fileVO);
		//웹 알림 띄우기
		notificationController.dispatchEventToClients("진료신청",hospitalDiagnosisVO.getDansCategory(), "/hospital/diagnosis/management",hospitalDiagnosisVO.getDoctorName());//상단,내용,버튼url,받는사람 순
		
		return "redirect:/user/mydiaglist";
	}
	
	@GetMapping("management")
	public ModelAndView findHospitalReservatedList(@AuthenticationPrincipal UserVO userVO)throws Exception{
		HospitalDoctorVO hospitalDoctorVO = new HospitalDoctorVO();
		hospitalDoctorVO.setUsername(userVO.getUsername());
		ModelAndView mv = new ModelAndView();
		List<HospitalDoctorVO> al = hospitalDiagnosisService.findHospitalReservatedList(hospitalDoctorVO);
			
		mv.addObject("reservatedList", al);
		mv.setViewName("/hospital/doctorManagement");
		
		return mv;
	}
	
	// 해당 의사가 완료한 진료 내역 리스트 요청
	@GetMapping("completedList")
	public ModelAndView findCompletedList(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("completedList", hospitalDiagnosisService.findCompletedList(hospitalDiagnosisPager));
		mv.addObject("pager", hospitalDiagnosisPager);
		mv.setViewName("hospital/completedList");
		
		return mv;
	}
}
