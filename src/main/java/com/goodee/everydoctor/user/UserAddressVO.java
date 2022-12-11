package com.goodee.everydoctor.user;

import lombok.Data;

@Data
public class UserAddressVO {
	
	private Integer addressNum;
	private String addressNick;
	private String userMainAddr;
	private String userSubAddr;
	private Integer userPost;
	private String addressReceiver;
	private String addressPhone;

}
