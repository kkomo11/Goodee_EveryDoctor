package com.goodee.everydoctor.consult.answer;

import java.sql.Date;

import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class ConsultAnswerVO {

	private Long answerNum;
	private Long consultNum;
	private String username;
	private String answerContent;
	private Date answerRegDate;
	
	private UserVO userVO;
	
}
