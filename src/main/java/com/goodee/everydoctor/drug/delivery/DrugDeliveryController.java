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

	//	@GetMapping("detail")
	//	public ModelAndView findDrugDeliveryDetail(DrugDeliveryVO drugDeliveryVO)throws Exception {
	//		ModelAndView mv = new ModelAndView();
	//		drugDeliveryVO=drugDeliveryService.findDrugDeliveryDetail(drugDeliveryVO);
	//		mv.addObject("detail",drugDeliveryVO);
	//		mv.setViewName("drug/delivery/detail");
	//		return mv;
	//	}

	//	@RequestMapping(value="http://info.sweettracker.co.kr/tracking/5")
	////	@RequestMapping("list")
	//	public String urlMethod(HttpServletRequest request , HttpServletResponse response, Model model) throws Exception {		
	//		// url.jsp라는 이름을 가진 팝업 생성
	//		return "popUp";
	//	}

}
