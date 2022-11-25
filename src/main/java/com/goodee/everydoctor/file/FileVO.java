package com.goodee.everydoctor.file;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO {
	
	private String label; //DB 구분자
	private Integer fileNum; //Primary Key
	private Integer num;//연결된 DB의 구분번호
	private String fileName; //저장된파일명
	private String fileOriName; //원본파일명
	private MultipartFile[] files; //upload시 form에서 받아오는 변수

}
