package com.goodee.everydoctor.pay;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.user.UserVO;

@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@GetMapping("completedPayList")
	public ModelAndView findMyCompletedPayList(PetDiagnosisPager petDiagnosisPager, String m) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("completedPayList", payService.findMyCompletedPayList(petDiagnosisPager, m));
		mv.addObject("pager", petDiagnosisPager);
		mv.setViewName("pay/myCompletedPayList");
		
		return mv;
	}
	
	@PostMapping("findMyPayInfo")
	@ResponseBody
	public UserVO findMyPayInfo(UserVO userVO) throws Exception {
		return payService.findMyPayInfo(userVO);
	}
	
	@GetMapping("doPay")
	public ModelAndView getDoPay(Long pn) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("unpaidDetail", payService.findUnpaidDetail(pn));
		mv.setViewName("pay/doPay");
		
		return mv;
	}
	
	@GetMapping("requestedPayList")
	public ModelAndView findMyRequestedPayList(PetDiagnosisPager petDiagnosisPager, String m) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("requestedPayList", payService.findMyRequestedPayList(petDiagnosisPager, m));
		mv.addObject("pager", petDiagnosisPager);
		boolean isPayInfoRegisted = payService.findPayInfoRegisted(m) == 1 ? true : false;
		mv.addObject("isPayInfoRegisted", isPayInfoRegisted);
		mv.setViewName("pay/myRequestedPayList");
		
		return mv;
	}
	
	@GetMapping("myPay")
	public ModelAndView findMyPay(String m) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("myPay", payService.findMyPay(m));
		mv.setViewName("pay/myPay");
		
		return mv;
	}
	
	@PostMapping("regist")
	public String inputPayInfo(UserVO userVO) throws Exception {
		int result = payService.inputPayInfo(userVO);
		
		return "redirect:/pay/myPay?m=" + userVO.getUsername();
		
	}
	
	@PostMapping("checkRealCard")
	@ResponseBody
	public Map<String, Object> checkRealCard(HttpServletRequest req, UserVO userVO) throws Exception {
		
		String username = userVO.getUsername();
		String cn = userVO.getCardNumber();
		String cey = userVO.getCardExpirationYear();
		String cem = userVO.getCardExpirationMonth();
		String ct = userVO.getCardTwo();
		
		Map<String, Object> resultMap = payService.getBilling(req, cn, cey, cem, ct, ct, username);
		
		return resultMap;
		
	}

	@PostMapping("billing")
	@ResponseBody
	public Map<String, Object> getBilling(HttpServletRequest req, String cn, String cey, String cem, String ct, String birth, String username) throws Exception {
		
		// 4330123412341234
		Map<String, Object> resultMap = payService.getBilling(req, cn, cey, cem, ct, birth, username);
		
		return resultMap;
		
	}
	
	@PostMapping("payment")
	@ResponseBody
	public Map<String, Object> getPayment(HttpServletRequest req, String bk, String username, Integer amount, String orderId, String orderName, Long pn) throws Exception {
		
		Map<String, Object> resultMap = payService.getPayment(req, bk, username, amount, orderId, orderName, pn);
		
		return resultMap;
	}
	
}
