package com.goodee.everydoctor.pay;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class BillingVO {

	//상점을 구분하는 상점아이디(MID)입니다. 토스페이먼츠에서 발급합니다. 최대 길이는 14자입니다.
	private String mId;
	
	//고객 ID입니다. 상점에서 발급합니다. 이 값에 빌링키가 연결됩니다.
	private String customerKey;
	
	//자동 결제 수단이 인증된 시점의 날짜와 시간 정보입니다 yyyy-MM-dd
	private String authenticatedAt;
	
	//결제할 때 사용한 결제 수단, 자동결제는 카드 고정
	private String method;
	
	//자동 결제에서 카드 정보 대신 사용되는 값입니다
	private String billingKey;
	
	// 카드 정보
	private CardVO cardVO;
	
}
