package com.goodee.everydoctor.drug.delivery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/drug/delivery/*")
public class DrugDeliveryController {
	
	@Value("${spring.delivery.t_key}")
	private String t_Key;
	
	@Value("${spring.delivery.t_code}")
	private String t_code;
	
	@Autowired
	private DrugDeliveryService drugDeliveryService;
	
	@GetMapping("list")
	public ModelAndView getList(DrugDeliveryVO drugDeliveryVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DrugDeliveryVO> ar = drugDeliveryService.getList(drugDeliveryVO);
		mv.addObject("list",ar);
		mv.setViewName("drug/delivery/list");
		return mv;
		
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(DrugDeliveryVO drugDeliveryVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		drugDeliveryVO=drugDeliveryService.getDetail(drugDeliveryVO);
		mv.addObject("detail",drugDeliveryVO);
		mv.setViewName("drug/delivery/detail");
		return mv;
	}
	
//	@RequestMapping(value="http://info.sweettracker.co.kr/tracking/5")
////	@RequestMapping("list")
//	public String urlMethod(HttpServletRequest request , HttpServletResponse response, Model model) throws Exception {		
//		// url.jsp라는 이름을 가진 팝업 생성
//		return "popUp";
//	}

}
