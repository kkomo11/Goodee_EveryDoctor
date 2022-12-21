package com.goodee.everydoctor.drug.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/drug/delivery/*")
public class DrugDeliveryController {
	//택배api키
	@Value("${spring.delivery.t_key}")
	private String t_Key;
	//택배사코드
	@Value("${spring.delivery.t_code}")
	private String t_code;

	@Autowired
	private DrugDeliveryService drugDeliveryService;

	@GetMapping("list")
	public ModelAndView findDrugDeliveryList(DrugDeliveryVO drugDeliveryVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DrugDeliveryVO> ar = drugDeliveryService.findDrugDeliveryList(drugDeliveryVO);
		mv.addObject("list",ar);
		mv.setViewName("drug/delivery/list");
		return mv;

	}

}
