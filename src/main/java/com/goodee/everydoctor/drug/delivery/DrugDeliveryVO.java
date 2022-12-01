package com.goodee.everydoctor.drug.delivery;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DrugDeliveryVO {
	
	//배송번호(운송장번호)
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;
	
	//sweet tracker
	//택배 회사 코드
//	private String t_code;
//	//운송장 번호
//	private String t_invoice;
	//발급받은 키
	private String t_key;
	//택배 회사 코드
	private String code;
	//택배 회사 이름
	private String name;
	
	//Status 뭔지 모름
	private String msg;
	private boolean status;
	
	private MultipartFile []files;
		
}
