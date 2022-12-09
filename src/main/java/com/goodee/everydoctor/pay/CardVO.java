package com.goodee.everydoctor.pay;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CardVO {
	//발급된 빌링키와 연결된 카드 정보입니다.
	
	//카드사
	private String company;
	
	//카드 발급사 숫자 코드입니다.
	private String issuerCode;
	
	//카드 매입사 숫자 코드입니다
	private String acquirerCode;
	
	//카드 번호
	private String number;
	
	//카드 종류
	private String cardType;
	
	//카드의 소유자 타입 (개인, 법인)
	private String ownerType;
	
	//카드로 결제한 금액
	private Integer amount;
	
	//할부 개월 수(일시불 0)
	private Integer installmentPlanMonths;
	
	//카드사 승인 번호
	private String approveNo;
	
	//카드사 포인트를 사용했는지 여부
	private Boolean useCardPoint;
	
	//카드 결제의 매입 상태, READY 아직 매입 요청이 안 된 상태,REQUESTED 매입이 요청된 상태, COMPLETED 요청된 매입이 완료된 상태, CANCEL_REQUESTED 매입 취소가 요청된 상태, CANCELED 요청된 매입 취소가 완료된 상태
	private String acquireStatus;
	
	//무이자 할부의 적용 여부
	private Boolean isInterestFree;
	
	//무이자 할부가 적용된 결제일 때 할부 수수료를 부담하는 주체에 대한 정보, BUYER 상품을 구매한 고객, CARD_COMPANY 카드사, MERCHANT 상점
	private String interestPayer;
	
	//영수증을 볼수있는 url(테스트 환경에서는 가상의 값이 들어감, 임의의 url은 오는데 정보는 없음)
	private String receiptUrl;
	
}
