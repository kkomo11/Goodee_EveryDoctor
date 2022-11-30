package com.goodee.everydoctor.board.tip;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardTipVO {

	//글번호
	private Long boardNum;
	//글제목
	private String boardTitle;
	//글내용
	private String boardContents;

	private MultipartFile [] files;
	private List<BoardFileVO> boardFileVOs;

}