package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/drug/prescription/*")
public class DrugPrescriptionController {

	@Autowired
	private DrugPrescriptionService drugPrescriptionService;
	
	

	//병원에서 넘어온 진료 처방완료
	@GetMapping("list")
	public ModelAndView findDrugPrescriptionList(DrugPrescriptionPager drugPrescriptionPager)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("completedList", drugPrescriptionService.findCompletedList(drugPrescriptionPager));
		mv.addObject("pager", drugPrescriptionPager);
		mv.setViewName("drug/prescription/list");

		return mv;
	}
	//조제완료 
	@GetMapping("completedList")
	public ModelAndView findCompletedListResult(DrugPrescriptionPager drugPrescriptionPager)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("completedListResult", drugPrescriptionService.findCompletedListResult(drugPrescriptionPager));
		mv.addObject("pager", drugPrescriptionPager);
		mv.setViewName("drug/prescription/completedList");

		return mv;
	}
	//조제상태바꾸기
	@PostMapping("prescribe")
	public String modifyPrescriptionStatus(DrugPrescriptionVO drugPrescriptionVO) throws Exception {
		int result = drugPrescriptionService.modifyPrescriptionStatus(drugPrescriptionVO);
		String page = "./";
		if(result == 1) {
			page = "drug/prescription/completedList";
		}
		return page;
	}

	@GetMapping("detail")
	public ModelAndView findDrugPrescriptionDetail(DrugPrescriptionVO drugPrescriptionVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		//약목록
		List<DrugPrescriptionVO> ar = drugPrescriptionService.findDrugPrescriptionList(drugPrescriptionVO);
		mv.addObject("list", ar);

		//처방된약
		//List<DrugPrescriptionVO> drug = drugPrescriptionService.findDrugPrescriptionDetail(drugPrescriptionVO);
		DrugPrescriptionVO drug = drugPrescriptionService.findDrugPrescriptionDetail(drugPrescriptionVO);
		String drugName = "";
		/*for(int i = 0; i < drug.size(); i++) {
			drugName += drug.get(i).getDrugName();
			if(i != drug.size()-1) {
				drugName += ", ";
			}
		}*/


		//운송장번호 랜덤출력
		List<DrugPrescriptionVO> deliveryNumList = drugPrescriptionService.findDrugDeliveryNum();
		int randomNum = (int)(Math.random() * 3);
		DrugPrescriptionVO deliveryNumObject = deliveryNumList.get(randomNum);
		mv.addObject("deliveryNum", deliveryNumObject.getDrugDeliveryNum());

		mv.addObject("drug", drug);
		mv.addObject("detail",drugPrescriptionVO);
		mv.setViewName("drug/prescription/detail");

		return mv;
	}

}
