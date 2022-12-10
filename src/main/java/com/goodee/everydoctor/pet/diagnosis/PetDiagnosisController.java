package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.sse.NotificationController;
import com.goodee.everydoctor.user.UserVO;

@Controller
@RequestMapping("/pet/diagnosis/*")
public class PetDiagnosisController {

	@Autowired
	private PetDiagnosisService petDiagnosisService;
	@Autowired
	private NotificationController notificationController;
	
	@PostMapping("reservation")
	public String inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO, FileVO fileVO) throws Exception {
		
		int result = petDiagnosisService.inputPetDiagnosis(petDiagnosisVO, fileVO);
		
		
		return "redirect:/pet/home";
	}
	
	@GetMapping("reservation")
	public ModelAndView getDiagnosisReservation(UserVO userVO, String petdoc) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int ownedPetCount = petDiagnosisService.findOwnPetCount(userVO);	// 등록된 반려동물이 있는지 체크
		String viewName = "index";
		
		if(ownedPetCount > 0) {	// 등록된 반려동물이 있으면
			mv.addObject("ownedPetList", petDiagnosisService.findOwnPetList(userVO));	// 반려동물 리스트 조회 후 전달
			mv.addObject("petdoc", petdoc);	// 담당의사 username 전달
			viewName = "pet/diagnosis/reservation";
		} else {
			viewName = "redirect:/pet/profile/regist";	// 없으면 등록 폼으로 이동
		}
		notificationController.dispatchEventToClients("진료신청", "새 진료신청이 들어왔습니다","", "Petdoc");
		
		mv.setViewName(viewName);
		
		return mv;
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<HospitalCategoryVO> findPetCategories() throws Exception {
		return petDiagnosisService.findPetCategories();
	}
	
}
