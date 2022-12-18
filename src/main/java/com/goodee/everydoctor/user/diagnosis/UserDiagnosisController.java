package com.goodee.everydoctor.user.diagnosis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("user/diagnosis")
public class UserDiagnosisController {


	@GetMapping("mylist")
	public ModelAndView myList(ModelAndView mv)throws Exception{
		log.info("mylist {}");
		
		
		
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
	public ModelAndView petList(ModelAndView mv)throws Exception{
		log.info("mylist {}");
		
		
		
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
