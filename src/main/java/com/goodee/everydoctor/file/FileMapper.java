package com.goodee.everydoctor.file;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
	
	//FileVO fileNum으로 가져오기
	public FileVO findFileByFileNum(FileVO fileVO);
	//FileVO에 담긴 값 저장
	public int inputFile(FileVO fileVO);
	//FileNum을 기준으로 FileDB삭제
	public int deleteFileByFileNum(FileVO fileVO);

}
