package com.goodee.everydoctor.consult.answer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/consult/answer/*")
public class ConsultAnswerController {
	
	@Autowired
	private ConsultAnswerService consultAnswerService;
	
	@GetMapping("count")
	@ResponseBody
	public Long findConsultAnswerCount(ConsultAnswerVO consultAnswerVO) throws Exception {
		return consultAnswerService.findConsultAnswerCount(consultAnswerVO);
	}
	
	@GetMapping("list")
	@ResponseBody
	public Map<String, Object> findConsultAnswer(ConsultAnswerPager consultAnswerPager) throws Exception {
		Map<String, Object> map = new HashMap<>();
		List<ConsultAnswerVO> list = consultAnswerService.findConsultAnswer(consultAnswerPager);
		
		map.put("list", list);
		map.put("pager", consultAnswerPager);
		
		return map;
	}

	@PostMapping("write")
	@ResponseBody
	public int inputConsultAnswer(ConsultAnswerVO consultAnswerVO) throws Exception {
		return consultAnswerService.inputConsultAnswer(consultAnswerVO); 
	}
	
}
