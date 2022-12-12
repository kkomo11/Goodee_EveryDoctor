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
import com.goodee.everydoctor.user.UserVO;

@Controller
@RequestMapping("/pet/diagnosis/*")
public class PetDiagnosisController {

	@Autowired
	private PetDiagnosisService petDiagnosisService;
	
	// 의사에게 신청된 진료 디테일 요청
	@GetMapping("reservatedDetail")
	public ModelAndView findReservatedDetail(Long n) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("reservatedDetail", petDiagnosisService.findReservatedDetail(n));
		mv.setViewName("pet/diagnosis/reservatedDetail");
		
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
