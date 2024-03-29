package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.sse.NotificationController;

@Controller
@RequestMapping("/drug/prescription/*")
public class DrugPrescriptionController {

	@Autowired
	private DrugPrescriptionService drugPrescriptionService;
	@Autowired
	private NotificationController notificationController;

	//병원에서 넘어온 진료 처방완료
	@GetMapping("list")
	public ModelAndView findDrugPrescriptionList(DrugPrescriptionPager drugPrescriptionPager)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("completedList", drugPrescriptionService.findCompletedList(drugPrescriptionPager));
		mv.addObject("pager", drugPrescriptionPager);
		mv.setViewName("drug/prescription/list");
		
		//웹알림을 넣어주자
//		notificationController.dispatchEventToClients("처방전 등록완료", "", "", );
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
	@ResponseBody
	public int modifyPrescriptionStatus(DrugPrescriptionVO drugPrescriptionVO) throws Exception {
		notificationController.dispatchEventToClients("처방전 완료", drugPrescriptionVO.getUsername()+"님의 처방전이 완료되어 택배 배송준비 시작합니다.", "", drugPrescriptionVO.getUsername());
			System.out.println("되나요 상태님 가져오는거요? "+ drugPrescriptionVO.getUsername());
			System.out.println("되나요 상태님 가져오는거요?222 "+ drugPrescriptionVO.getPatient());
		 return drugPrescriptionService.modifyPrescriptionStatus(drugPrescriptionVO);
	}

	@GetMapping("detail")
	public ModelAndView findDrugPrescriptionDetail(DrugPrescriptionVO drugPrescriptionVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		//약목록
		List<DrugPrescriptionVO> ar = drugPrescriptionService.findDrugPrescriptionList(drugPrescriptionVO);
		mv.addObject("list", ar);

		//처방된약

		DrugPrescriptionVO drug = drugPrescriptionService.findDrugPrescriptionDetail(drugPrescriptionVO);
		String drugName = "";

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
