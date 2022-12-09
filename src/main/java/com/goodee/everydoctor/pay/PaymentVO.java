package com.goodee.everydoctor.pay;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentVO {

	//Payment 객체의 응답 버전, 날짜 기반 버저닝
	private String version;
	
	//결제 건에 대한 고유한 키 값
	private String paymentKey;
	
	//결제 타입 정보, NORMAL 일반 결제, BILLING 자동 결제, BRANDPAY 브랜드페이
	private String type;
	
	//주문 ID입니다. 상점에서 발급
	private String orderId;
	
	//결제에 대한 주문명, ex) 생수 외 1건
	private String orderName;
	
	//상점을 구분하는 상점아이디(MID)입니다. 토스페이먼츠에서 발급
	private String mId;
	
	//결제할 때 사용한 통화 단위, 원화인 KRW만 사용
	private String currency;
	
	//결제할 때 사용한 결제 수단
	private String method;
	
	//총 결제 금액
	private Integer totalAmount;
	
	//취소할 수 있는 금액(잔고)
	private Integer balanceAmount;
	
	/*
	 * 결제 처리 상태
	 * READY 결제를 생성하면 가지게 되는 초기 상태 입니다. 인증 전까지는 READY 유지
	 * IN_PROGRESS 결제 수단 정보와 해당 결제 수단의 소유자가 맞는지 인증을 마친 상태, 결제 승인 API를 호출하면 완료됨
	 * DONE 인증된 결제 수단 정보, 고객 정보로 요청한 결제가 승인된 상태
	 * CANCELED 승인된 결제가 취소된 상태
	 * PARTICIAL_CANCELED 승인된 결제가 부분 취소된 상태
	 * ABORTED 결제 승인이 실패했거나, 결제 고객이 창을 닫아서 결제를 취소한 상태
	 * EXPIRED 결제 유효 시간 30분이 지나 거래가 취소된 상태 IN_PROGRESS에서 결제 승인 API를 호출하지 않으면 발생
	 */
	private String status;
	
	//결제가 일어난 날짜와 시간 정보입니다. ISO 8601 형식 yyyy-MM-dd'T'HH:mm:ss+hh:mm, 2022-01-05T12:03:25+09:00
	private String requestedAt;
	
	//결제 승인이 일어난 날짜와 시간 정보입니다. ISO 8601 형식
	private String approvedAt;
	
	//에스크로 사용 여부
	private Boolean useEscrow;
	
	/*
	 * 마지막 거래 건에 대한 고유한 키 값입니다. 결제 한 건에 대한 승인 거래와 취소 거래를 구분하는데 사용됩니다. 
	 * 예를 들어 결제 승인 후 부분 취소를 두 번 했다면 마지막 부분 취소 거래 건에 대한 키 값이 할당
	 */
	private String lastTransactionKey;
	
	//공급가액
	private Integer suppliedAmount;
	
	/*
	 * 부가세
	 * (결제 금액 amount - 면세 금액 taxFreeAmount) / 11 후 소수점 첫째 자리에서 반올림해서 계산
	 */
	private Integer vat;
	
	//문화비(도서, 공연 티켓, 박물관·미술관 입장권 등) 지출 여부입니다. 계좌이체, 가상계좌를 사용할 때만 설정, 카드 결제는 항상 false
	private Boolean cultureExpense;
	
	/*
	 * 결제 금액 중 면세 금액
	 * 일반 상점일 때는 면세 금액으로 0
	 */
	private Integer taxFreeAmount;
	
	//결제 금액 중 과세 제외 금액(컵 보증금 등)
	private Integer taxExemptionAmount;
	
	//부분 취소 가능 여부, false면 전액 취소만 가능
	private Boolean isPartialCancelable;
	
	//결제한 국가 정보
	private String country;
	
	//결제 실패 정보, nullable
	private PayErrorVO failure;
	
}
