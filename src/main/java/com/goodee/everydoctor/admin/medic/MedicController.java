package com.goodee.everydoctor.admin.medic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/medic/*")
public class MedicController {
	
	@GetMapping("regist")
	public void inputMedic()throws Exception{
		
	}

}
