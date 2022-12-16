package com.goodee.everydoctor.board.tip;


import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.board.BoardVO;

import lombok.Data;

@Data
public class BoardTipVO extends BoardVO {
	
	private BoardVO boardVO;

	private MultipartFile [] files;
//	private List<BoardFileVO> boardFileVOs;

}
