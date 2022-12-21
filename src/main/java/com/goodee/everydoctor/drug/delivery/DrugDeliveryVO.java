package com.goodee.everydoctor.drug.delivery;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DrugDeliveryVO {

	//운송장번호
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;

	private String t_key;
	//택배 회사 코드
	private String t_code;
	//택배 회사 이름
	private String name;

	private MultipartFile []files;

	// 주소번호
	private Integer addressNum;

}
