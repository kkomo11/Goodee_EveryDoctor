package com.goodee.everydoctor.user.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;
import com.goodee.everydoctor.user.UserVO;
import com.goodee.everydoctor.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("user/diagnosis")
public class UserDiagnosisController {
	
	@Autowired
	private UserDiagnosisService userDiagnosisService;

	@GetMapping("mylist")
	public ModelAndView getMylist(ModelAndView mv, @AuthenticationPrincipal UserVO userVO)throws Exception{
		log.info("mylist {}", userVO.getUsername());
		Pager pager = new Pager();
		pager.setSearch(userVO.getUsername());
		pager.setPerPage(8L);
		
		List<HospitalDiagnosisVO> hospitalDiagnosisVOs = userDiagnosisService.getMylist(pager);
		
		mv.addObject("diagnosisVOs", hospitalDiagnosisVOs);
		mv.addObject("pager", pager);
		mv.setViewName("user/mydiaglist");
		return mv;
	}
	
	@GetMapping("mydetail")
	public ModelAndView myDetail(ModelAndView mv)throws Exception{
		log.info("mylist {}");
		
		
		
		mv.setViewName("user/mydiagdetail");
		return mv;
	}
	
	@GetMapping("petlist")
	public ModelAndView petList(ModelAndView mv, @AuthenticationPrincipal UserVO userVO)throws Exception{
		Pager pager = new Pager();
		pager.setSearch(userVO.getUsername());
		pager.setPerPage(5L);
		
		List<PetDiagnosisVO> petDiagnosisVOs = userDiagnosisService.getPetlist(pager);
		
		mv.addObject("diagnosisVOs", petDiagnosisVOs);
		mv.addObject("pager", pager);
		mv.setViewName("user/petdiaglist");
		return mv;
	}
	
	@GetMapping("petdetail")
	public ModelAndView petDetail(ModelAndView mv)throws Exception{
		log.info("mylist {}");
		
		
		
		mv.setViewName("user/mydiagdetail");
		return mv;
	}
	
}
