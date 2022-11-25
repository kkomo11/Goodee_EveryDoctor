package com.goodee.everydoctor.file;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
	
	public FileVO getFileByFileNum(FileVO fileVO);
	public int inputFile(FileVO fileVO);
	public int deleteFileByFileNum(FileVO fileVO);

}
