package com.goodee.everydoctor.board;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	//글번호
	private Long boardNum;
	//글제목
	private String boardTitle;
	//글내용
	private String boardContents;
	
	private MultipartFile [] files;

}
