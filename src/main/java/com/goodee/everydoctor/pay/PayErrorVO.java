package com.goodee.everydoctor.pay;

import lombok.Data;

@Data
public class PayErrorVO {

	//에러 타입을 보여주는 에러 코드
	private String code;
	
	//에러 메시지입니다. 에러 발생 이유
	private String message;
	
}
