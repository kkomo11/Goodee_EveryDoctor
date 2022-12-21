package com.goodee.everydoctor.pay;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PayVO {

	private Long payNum;			// 결제번호
	private String username;		// 결제회원
	private String orderId;			// 주문아이디
	private String orderName;		// 주문명
	private String paymentKey;		// 결제 고유키
	private String type;			// 결제타입
	private String method;			// 결제수단
	private String status;			// 결제상태
	private Integer amount;			// 결제금액
	private Integer totalAmount;	// 총 결제 금액
	private LocalDateTime payReqDate;	// 결제 발생 시각
	private LocalDateTime requestedAt;	// 결제 요청 시각
	private LocalDateTime approvedAt;	// 결제 완료 시각
	private String lastTransactionKey;	// 마지막 결제 상태 고유키
	private String receiptUrl;			// 영수증 url
	private Long dansNum;				// 진료번호
	private Long prescriptionNum;		// 처방전번호
	private Long pDansNum;				// 반려동물 진료번호
	
	private String payReqDateString;	// 결제 발생 시각 처리용
	private String requestedAtString;	// 결제 요청 시각 처리용
	private String approvedAtString;	// 결제 완료 시각 처리용
	
	private String payCardNumber;		// 결제시 사용한 카드번호
	private String payCardCompany;		// 결제 카드사
	private String payCardType;			// 결제 카드 유형
	
}
