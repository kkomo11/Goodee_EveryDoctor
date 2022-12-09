package com.goodee.everydoctor.pay;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Value("${toss.api.client.key}")
	private String cli_key;
	
	@Value("${toss.api.base.key}")
	private String base_key;

	@GetMapping("test")
	public String getTestPage(HttpServletRequest req) throws Exception {
		
		// 결제를 위한 빌링 객체를 받아옴
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/billing/authorizations/card"))
			    .header("Authorization", "Basic " + base_key)
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"cardNumber\":\"4330123412341234\",\"cardExpirationYear\":\"24\",\"cardExpirationMonth\":\"07\",\"cardPassword\":\"12\",\"customerIdentityNumber\":\"881212\",\"customerKey\":\"edPkasN9Rd87s3TKiAfx3\"}"))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			//System.out.println(response.body());
			
		String result = response.body();
		
		req.setAttribute("billing", result);
		
		return "forward:/pay/testPay";
	}
	
	@GetMapping("testPay")
	public String getTestPay(HttpServletRequest req) throws Exception {
		
		ObjectMapper objectMapper = new ObjectMapper();	// json 변환기
		String billingString = req.getAttribute("billing").toString();	// 변환할 json
		
		Map<String, String> map = objectMapper.readValue(billingString, Map.class);
		Object card = map.get("card");

		BillingVO billingVO = objectMapper.convertValue(map, BillingVO.class);	// 빌링 객체로 변환
		billingVO.setCardVO(objectMapper.convertValue(card, CardVO.class));	// 빌링 객체가 가지는 카드 정보 객체 변환 후 설정
		
		// 결제 요청(Payment객체 반환받음)
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/billing/" + billingVO.getBillingKey()))
			    .header("Authorization", "Basic " + base_key)
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"customerKey\":\"edPkasN9Rd87s3TKiAfx3\",\"amount\":15000,\"orderId\":\"ATNcD9gYoUhb6J_r9Vzx7\",\"orderName\":\"토스 티셔츠 외 2건\"}"))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			
		// 결제 요청의 응답 코드
		int resStatusCode = response.statusCode();
		
		if(resStatusCode == 200) {
			// 정상 응답
		} else {
			// 에러발생(에러객체 받음)
			PayErrorVO payErrorVO = objectMapper.readValue(response.body(), PayErrorVO.class);
			System.out.println(payErrorVO);
		}
		
		return "pay/test";
	}
	
}
