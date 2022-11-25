package com.goodee.everydoctor.drugDelivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/drugDelivery/*")
public class DrugDeliveryController {
	
	@Autowired
	private DrugDeliveryService drugDeliveryService;
	
	@GetMapping("list")
	public ModelAndView getList(DrugDeliveryVO drugDeliveryVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DrugDeliveryVO> ar = drugDeliveryService.getList(drugDeliveryVO);
		mv.addObject("list",ar);
		mv.setViewName("drugDelivery/list");
		return mv;
	}

}
