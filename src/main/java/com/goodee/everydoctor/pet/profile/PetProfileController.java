package com.goodee.everydoctor.pet.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pet/profile/*")
public class PetProfileController {

	@Autowired
	private PetProfileService petProfileService;
	
	@PostMapping("delete")
	@ResponseBody
	public int deletePetProfile(PetVO petVO) throws Exception {
		int result = petProfileService.deletePetProfile(petVO);
		
		return result;
	}
	
	@PostMapping("update")
	public String modifyPetProfile(PetVO petVO, MultipartFile petFile) throws Exception {
		Long petNum = petVO.getPetNum();
		int result = petProfileService.modifyPetProfile(petVO, petFile);
		
		return "redirect:/pet/profile/detail?petNum=" + petNum;
	}
	
	@GetMapping("update")
	public ModelAndView findPetProfileUpdate(PetVO petVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//petVO = petProfileService.findPetProfileDetail(petVO);
		//mv.addObject("petProfile", petVO);
		
		mv.addObject("petNum", petVO.getPetNum());
		mv.addObject("userName", "test");	  // test말고 petVO에서 꺼내서 전달(페이지를 요청한 유저의 PK를 받아야함)
		
		mv.setViewName("pet/profile/update");
		
		return mv;
	}
	
	@PostMapping("detail")
	@ResponseBody
	public Map<String, Object> findPetProfileDetail(PetVO petVO) throws Exception {
		// JS에서 반려동물 정보 비동기 요청
		Map<String, Object> map = new HashMap<>();
		
		petVO = petProfileService.findPetProfileDetail(petVO);	//반려동물 정보
		PetBioVO petBioVO = new PetBioVO();
		petBioVO.setPetBioNum(petVO.getPetBioNum());
		petBioVO = petProfileService.findPetBioDetail(petBioVO); // 반려동물 분류 정보
		
		map.put("petProfileDetail", petVO);
		map.put("petProfileBioDetail", petBioVO);
		
		return map;
	}
	
	@GetMapping("detail")
	public ModelAndView getPetProfileDetail(PetVO petVO) throws Exception {
		//petVO = petProfileService.findPetProfileDetail(petVO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("petNum", petVO.getPetNum());
		mv.addObject("userName", "test");	  // test말고 petVO에서 꺼내서 전달(페이지를 요청한 유저의 PK를 받아야함)
		mv.setViewName("pet/profile/detail"); // 페이지에 반려동물 테이블 PK만 전달
		
		return mv;
	}
	
	@PostMapping("regist")
	public String inputPetProfile(PetVO petVO, MultipartFile petFile) throws Exception {
		
		// 반려동물 정보 등록
		petProfileService.inputPetProfile(petVO, petFile);
		
		return "redirect:/pet/profile/regist";
	}
	
	@GetMapping("regist")
	public String getProfileRegist() throws Exception{
		return "pet/profile/regist";
	}
	
	@GetMapping("findPetBioList")
	@ResponseBody
	public List<PetBioVO> findPetBioList() throws Exception {	// 반려동물 대분류 리스트 요청
		return petProfileService.findPetBioList();
	}
	
	@GetMapping("findPetBioDetailList")
	@ResponseBody
	public List<PetBioVO> findPetBioDetailList(PetBioVO petBioVO) throws Exception {	//반려동물 소분류 리스트 요청
		return petProfileService.findPetBioDetailList(petBioVO);
	}
	
	@PostMapping("findPetBioDetailSearch")
	@ResponseBody
	public List<PetBioVO> findPetBioDetailSearch(PetBioVO petBioVO) throws Exception {
		return petProfileService.findPetBioDetailSearch(petBioVO);
	}
	
}
