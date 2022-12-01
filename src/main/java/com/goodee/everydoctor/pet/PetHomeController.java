package com.goodee.everydoctor.pet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/pet/*")
public class PetHomeController {
	
	@Autowired
	private PetHomeService petHomeService;
	
	@GetMapping("petdocDetail")
	public String getPetdocDetailPage() throws Exception {
		return "pet/petdocDetail";
	}

	@GetMapping("home")
	public String getPetHomePage() throws Exception {
		return "pet/home";
	}
	
	@GetMapping("findPetdocList")
	@ResponseBody
	public Map<String, Object> findPetdocList(PetHomePager pager) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("list", petHomeService.findPetdocList(pager));
		return map;
	} // 메인 화면 의료진 리스트 데이터 요청
	
}
