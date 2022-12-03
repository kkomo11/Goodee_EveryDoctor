package com.goodee.everydoctor.drug;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.util.Pager;

@Controller
@RequestMapping("/drug/*")
public class DrugController {
		
	@Autowired
	private DrugService drugService;
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DrugVO> ar = drugService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		mv.setViewName("drug/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(DrugVO drugVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		drugVO=drugService.getDetail(drugVO);
		mv.addObject("detail",drugVO);
		mv.setViewName("drug/detail");
		return mv;
	}

}
