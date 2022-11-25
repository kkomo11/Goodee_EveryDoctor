package com.goodee.everydoctor.report;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Value("${app.upload.base}")
	private String path;
	
	private String label = "report";
	
	//신고 Insert
	public int setReport(ReportVO reportVO)throws Exception{
		int result = reportMapper.setReport(reportVO);
		//해당경로의 파일 객체 생성
		File file = new File(path);
		
		//해당 경로에 폴더가 생성되있지 않으면 폴더 생성
		if(!file.exists()) {
			boolean check = file.mkdirs();
			log.info("Check : ", check);
		}
		
		//받아온 파일들을 반복문 돌려서 HDD 저장 및 DB에 저장
		for(MultipartFile f : reportVO.getFiles()) {
			log.info("fileName : ", f.getOriginalFilename());
			String fileName = fileManager.saveFile(f, path, label);
			FileVO fileVO = new FileVO();
			fileVO.setFileName(fileName);
			fileVO.setNum(reportVO.getReportNum());			
			fileVO.setFileOriName(f.getOriginalFilename());
			
			//DB저장
			fileMapper.inputFile(fileVO);
		}
		return result;
	}

}
