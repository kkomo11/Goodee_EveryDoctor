package com.goodee.everydoctor.user.address;

import lombok.Data;

@Data
public class UserAddressVO {
	private String username;
	private Integer addressNum;
	private String addressNick;
	private String userMainAddr;
	private String userSubAddr;
	private String userPost;
	private String addressReceiver;
	private String addressPhone;
	private Integer idt; // 식별자 : 몇번째 주소니?

}
