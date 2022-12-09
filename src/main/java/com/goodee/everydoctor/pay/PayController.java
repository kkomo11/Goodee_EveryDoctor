package com.goodee.everydoctor.pay;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Value("${toss.api.client.key}")
	private String cli_key;

	@GetMapping("test")
	public ModelAndView getTestPage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("cliKey", cli_key);
		mv.setViewName("pay/test");
		return mv;
	}
	
}
