package com.goodee.everydoctor.consult;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.util.Pager;

@Controller
@RequestMapping("/consult/*")
public class ConsultController {

	@Autowired
	private ConsultService consultService;
	
	@PostMapping("delete")
	@ResponseBody
	public int deleteConsult(ConsultVO consultVO) throws Exception {
		return consultService.deleteConsult(consultVO);
	}
	
	@PostMapping("update")
	public String modifyConsult(ConsultVO consultVO, Integer consultCategory, FileVO fileVO) throws Exception {
		
		int result = consultService.modifyConsult(consultVO, consultCategory, fileVO);
		
		return "redirect:/consult/detail?consultNum=" + consultVO.getConsultNum();
	}
	
	@GetMapping("detailAjax")
	@ResponseBody
	public ConsultVO findConsultDetailForUpdate(ConsultVO consultVO) throws Exception {
		return consultService.findConsultDetail(consultVO);
	}
	
	@GetMapping("update")
	public ModelAndView getConsultUpdate(ConsultVO consultVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("consultNum", consultVO.getConsultNum());
		mv.setViewName("consult/update");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView findConsultDetail(ConsultVO consultVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("consultDetail", consultService.findConsultDetail(consultVO));
		mv.setViewName("consult/detail");
		
		return mv;
	}
	
	@PostMapping("consultCategory")
	@ResponseBody
	public List<HospitalCategoryVO> findConsultCategory(ConsultVO consultVO) throws Exception {
		return consultService.findConsultCategory(consultVO);
	}	// JS로부터 유형에 맞는 카테고리 데이터 정보 요청 처리 메소드
	
	@PostMapping("write")
	public String inputConsult(ConsultVO consultVO, Integer consultCategory, FileVO fileVO) throws Exception {
		
		consultService.inputConsult(consultVO, consultCategory, fileVO);
		
		return "redirect:/consult/list";
	}
	
	@GetMapping("write")
	public String getConsultWritePage() throws Exception {
		return "consult/write";
	}
	
	@GetMapping("list")
	public ModelAndView getConsultListPage(Pager pager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("consultList", consultService.findConsultList(pager));
		mv.addObject("pager", pager);
		
		mv.setViewName("consult/list");
		
		return mv;
	}
	
}
