package com.goodee.everydoctor.pay;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.user.UserVO;

@Service
public class PayService {
	
	@Value("${toss.api.client.key}")
	private String cli_key;
	
	@Value("${toss.api.base.key}")
	private String base_key;

	@Autowired
	private PayMapper payMapper;
	
	public List<PayVO> findMyCompletedPayList(PetDiagnosisPager petDiagnosisPager, String m) throws Exception {
		petDiagnosisPager.setUsername(m);
		Long totalCount = payMapper.findMyCompletedPayListCount(petDiagnosisPager);
		petDiagnosisPager.getNum(totalCount);
		petDiagnosisPager.getRowNum();
		
		List<PayVO> list = payMapper.findMyCompletedPayList(petDiagnosisPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		for(PayVO p : list) {
			String payReqDateString = p.getPayReqDate().format(dtf);
			String requestedAtString = p.getRequestedAt().format(dtf);
			String approvedAtString = p.getApprovedAt().format(dtf);
			
			p.setPayReqDateString(payReqDateString);
			p.setRequestedAtString(requestedAtString);
			p.setApprovedAtString(approvedAtString);
		}
		
		return list;
	}
	
	public Map<String, Object> getBilling(HttpServletRequest req, String cn, String cey, String cem, String ct, String birth, String username) throws Exception {
		
		// 결제를 위한 빌링 객체를 받아옴
		String bodyPublisherString = "{\"cardNumber\":\"{cn}\",\"cardExpirationYear\":\"{cey}\",\"cardExpirationMonth\":\"{cem}\",\"cardPassword\":\"{ct}\",\"customerIdentityNumber\":\"{birth}\",\"customerKey\":\"{username}\"}";
		bodyPublisherString = bodyPublisherString.replace("{cn}", cn).replace("{cey}", cey).replace("{cem}", cem).replace("{ct}", ct)
			.replace("{birth}", birth).replace("{username}", username);
		
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/billing/authorizations/card"))
			    .header("Authorization", "Basic " + base_key)
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString(bodyPublisherString))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			
					
		String result = response.body();			// 빌링 객체 요청 결과
		int resStatusCode = response.statusCode();	// 빌링 객체 요청 결과 상태
				
		ObjectMapper objectMapper = new ObjectMapper();	// json 변환기
				
		Map<String, Object> resultMap = new HashMap<>();
				
		// 정상 응답
		if(resStatusCode == 200) {
			Map<String, String> map = objectMapper.readValue(result, Map.class);
			Object card = map.get("card");

			BillingVO billingVO = objectMapper.convertValue(map, BillingVO.class);	// 빌링 객체로 변환
			billingVO.setCardVO(objectMapper.convertValue(card, CardVO.class));	// 빌링 객체가 가지는 카드 정보 객체 변환 후 설정
					
			resultMap.put("billingVO", billingVO);		// 응답으로 빌링 객체 담음
			resultMap.put("statusCode", resStatusCode);	// 응답으로 상태 코드 담음
					
		} else {
			// 에러발생(에러객체 받음)
			PayErrorVO payErrorVO = objectMapper.readValue(response.body(), PayErrorVO.class);
					
			resultMap.put("payErrorVO", payErrorVO);	// 응답으로 에러 객체 담음
			resultMap.put("statusCode", resStatusCode);	// 응답으로 상태 코드 담음
					
		}
				
		return resultMap;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> getPayment(HttpServletRequest req, String bk, String username, Integer amount, String orderId, String orderName, Long pn) throws Exception {
		
		ObjectMapper objectMapper = new ObjectMapper();	// json 변환기
		
		//"{\"customerKey\":\"edPkasN9Rd87s3TKiAfx3\",\"amount\":150,\"orderId\":\"ATNcD9gYoUhb6J_r9Vzx8\",\"orderName\":\"토스 티셔츠 외 2건\"}"
		String bodyPublisherString = "{\"customerKey\":\"{username}\",\"amount\":{amount},\"orderId\":\"{orderId}\",\"orderName\":\"{orderName}\"}";
		bodyPublisherString = bodyPublisherString.replace("{username}", username).replace("{amount}", amount.toString())
				.replace("{orderId}", orderId).replace("{orderName}", orderName);
		
		// 결제 요청(Payment객체 반환받음)
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/billing/" + bk))
			    .header("Authorization", "Basic " + base_key)
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString(bodyPublisherString))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			
			
		// 결제 요청의 응답 코드
		int resStatusCode = response.statusCode();
		String result = response.body();	// 요청 결과
		
		Map<String, Object> resultMap = new HashMap<>();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
		
		if(resStatusCode == 200) {
			// 정상 응답
			resultMap.put("statusCode", resStatusCode);
			
			Map<String, String> map = objectMapper.readValue(result, Map.class);	// 결과 문자열을 매핑
			Object card = map.get("card");	// 카드에 해당하는 부분 매핑
			
			PaymentVO paymentVO = objectMapper.convertValue(map, PaymentVO.class);	// payment 객체 매핑
			CardVO cardVO = objectMapper.convertValue(card, CardVO.class);			// card 객체 매핑
			
			// 결제 테이블 Update
			PayVO payVO = new PayVO();
			payVO.setPayNum(pn);
			payVO.setPaymentKey(paymentVO.getPaymentKey());		// 반환된 결제 고유키 설정
			payVO.setType(paymentVO.getType());					// 반환된 결제 타입 설정
			payVO.setMethod(paymentVO.getMethod());				// 반환된 결제 수단 설정
			payVO.setStatus(paymentVO.getStatus());				// 반환된 결제 상태 설정
			payVO.setTotalAmount(paymentVO.getTotalAmount());	// 반환된 총 결제 금액 설정
			
			LocalDateTime reqeusted = LocalDateTime.parse(paymentVO.getRequestedAt().split("\\+")[0], dtf);	// 반환된 문자열 DateTime을 변환
			payVO.setRequestedAt(reqeusted);
			
			LocalDateTime approved = LocalDateTime.parse(paymentVO.getApprovedAt().split("\\+")[0], dtf);
			payVO.setApprovedAt(approved);
			
			payVO.setLastTransactionKey(paymentVO.getLastTransactionKey());	// 반환된 마지막 거래 트랜잭션 키 설정
			payVO.setReceiptUrl(cardVO.getReceiptUrl());					// 반환된 영수증 url 설정
			
			payVO.setPayCardNumber(cardVO.getNumber());		// 결제 카드번호
			payVO.setPayCardCompany(cardVO.getCompany());	// 결제 카드사
			payVO.setPayCardType(cardVO.getCardType());		// 결제 카드유형
			
			payMapper.modifyUnpaidDetail(payVO);	// 결제 정보 테이블 로우 업데이트
			
		} else {
			// 에러발생(에러객체 받음)
			PayErrorVO payErrorVO = objectMapper.readValue(response.body(), PayErrorVO.class);
			
			resultMap.put("payErrorVO", payErrorVO);
			resultMap.put("statusCode", resStatusCode);
		}
		
		return resultMap;
	}
	
	public UserVO findMyPayInfo(UserVO userVO) throws Exception {
		return payMapper.findMyPayInfo(userVO);
	}
	
	public PayVO findUnpaidDetail(Long pn) throws Exception {
		PayVO payVO = new PayVO();
		payVO.setPayNum(pn);
		
		payVO = payMapper.findUnpaidDetail(payVO);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String payReqDateString = payVO.getPayReqDate().format(dtf);
		
		payVO.setPayReqDateString(payReqDateString);
		
		return payVO;
	}
	
	public int findPayInfoRegisted(String m) throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUsername(m);
		return payMapper.findPayInfoRegisted(userVO);
	}
	
	public List<PayVO> findMyRequestedPayList(PetDiagnosisPager petDiagnosisPager, String m) throws Exception {
		
		petDiagnosisPager.setUsername(m);
		Long totaCount = payMapper.findMyRequestedPayListCount(petDiagnosisPager);	//미납된 결제 총 개수
		petDiagnosisPager.getNum(totaCount);
		petDiagnosisPager.getRowNum();
		
		List<PayVO> list = payMapper.findMyRequestedPayList(petDiagnosisPager);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		for(PayVO pay : list) {
			String payReqDateString = pay.getPayReqDate().format(dtf);
			
			pay.setPayReqDateString(payReqDateString);
		}
		
		return list;
	}
	
	public UserVO findMyPay(String m) throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUsername(m);
		
		return payMapper.findMyPay(userVO);
	}
	
	public int inputPayInfo(UserVO userVO) throws Exception {
		return payMapper.inputPayInfo(userVO);
	}
	
}
