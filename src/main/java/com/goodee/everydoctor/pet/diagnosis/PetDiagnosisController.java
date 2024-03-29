package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.drug.DrugVO;
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
	
	@PostMapping("findDrug")
	@ResponseBody
	public List<DrugVO> findDrug(DrugVO drugVO) throws Exception {
		return petDiagnosisService.findDrug(drugVO);
	}
	
	@PostMapping("petPrescription")
	public String modifyPetDiagnosis(PetDiagnosisVO petDiagnosisVO, Long[] druges) throws Exception {
		
		int result = petDiagnosisService.modifyPetDiagnosis(petDiagnosisVO, druges);
		
		//웹알림 url변경 필요 contents 보호자이름 잘나오는지 확인해야 함
		notificationController.dispatchEventToClients("결제요청 알림", petDiagnosisVO.getProtectorName()+"님 진단서 작성이 완료되었습니다. 결제를 진행해 주세요!", "/pay/pay", petDiagnosisVO.getPUsername());
		
		return "redirect:/pet/diagnosis/completedList?d=" + petDiagnosisVO.getPDoctorname();
	}
	
	@GetMapping("petPrescription")
	public ModelAndView getPetPrescriptionPage(Long n) throws Exception {
		// 의사가 화상 진료 후 작성할 페이지 요청
		ModelAndView mv = new ModelAndView();
		PetDiagnosisVO petDiagnosisVO = petDiagnosisService.findDetailForPrescription(n);
		
		mv.addObject("detailForPrescription", petDiagnosisVO);
		mv.setViewName("pet/diagnosis/prescription");
		
		return mv;
	}
	
	@GetMapping("completedDetail")
	public ModelAndView findCompletedDetail(Long n) throws Exception {
		ModelAndView mv = new ModelAndView();
		PetDiagnosisVO petDiagnosisVO = petDiagnosisService.findCompletedDetail(n);
		mv.addObject("completedDetail", petDiagnosisVO);
		mv.setViewName("pet/diagnosis/completedDetail");
		return mv;
	}
	
	// 해당 의사가 완료한 진료 내역 리스트 요청
	@GetMapping("completedList")
	public ModelAndView findCompletedList(PetDiagnosisPager petDiagnosisPager, String d) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("completedList", petDiagnosisService.findCompletedList(petDiagnosisPager, d));
		mv.addObject("pager", petDiagnosisPager);
		mv.setViewName("pet/diagnosis/completedList");
		
		return mv;
	}
	
	// 의사에게 신청된 진료 리스트 요청
	@GetMapping("reservatedList")
	public ModelAndView findReservatedList(PetDiagnosisPager petDiagnosisPager, String d) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PetDiagnosisVO> list = petDiagnosisService.findReservatedList(petDiagnosisPager, d);
		
		mv.addObject("reservatedList", list);
		mv.addObject("pager", petDiagnosisPager);
		mv.setViewName("pet/diagnosis/reservatedList");
		
		return mv;
	}
	
	@PostMapping("reservation")
	public String inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO, FileVO fileVO) throws Exception {
		
		int result = petDiagnosisService.inputPetDiagnosis(petDiagnosisVO, fileVO);

		//웹 알림입니다(title,text,url,받는사람)
		notificationController.dispatchEventToClients("진료신청","["+petDiagnosisVO.getPDansCategory()+"]"+petDiagnosisVO.getPDansContent() ,"/pet/diagnosis/reservatedList", petDiagnosisVO.getPDoctorname());
		
		
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
		mv.setViewName(viewName);
		
		return mv;
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<HospitalCategoryVO> findPetCategories() throws Exception {
		return petDiagnosisService.findPetCategories();
	}
	
}
