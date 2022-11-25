package com.goodee.everydoctor.board;

import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;

import lombok.Data;

@Data
public class BoardFileVO extends FileVO{
	
	//파일번호
	private Long boardFileNum;
	//글번호
	private Long boardNum;
	//파일명
	private String boardFileName;
	//원본파일명
	private String boardFileOriName;
	
	private MultipartFile [] files;

}
