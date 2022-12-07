package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.drug.DrugService;
import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.util.Pager;

@Controller
@RequestMapping("/drug/prescription*")
public class DrugPrescriptionController {

	@Autowired
	private DrugService drugService;

	@Autowired
	private DrugPrescriptionService drugPrescriptionService;

	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(4374L);
		List<DrugVO> ar = drugService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		mv.setViewName("drug/prescription/list");
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getDetail(DrugPrescriptionVO drugPrescriptionVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		drugPrescriptionVO=drugPrescriptionService.getDetail();
		//약목록
		List<DrugPrescriptionVO> ar = drugPrescriptionService.getList();
		mv.addObject("list", ar);
		//진료 과목 가져오기
		List<DrugPrescriptionVO> sectionList = drugPrescriptionService.findDrugPrecriptionSection();
		mv.addObject("sectionList", sectionList);
		//환자 증상 가져오기
		List<DrugPrescriptionVO> categoryList = drugPrescriptionService.findDrugPrescriptionCategory();
		mv.addObject("categoryList", categoryList);

		mv.addObject("detail",drugPrescriptionVO);
		mv.setViewName("drug/prescription/detail");
		return mv;
	}

}
