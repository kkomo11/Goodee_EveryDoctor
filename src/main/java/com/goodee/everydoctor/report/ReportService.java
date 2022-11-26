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
	
	@Value("${app.download.base}")
	private String path;
	
	private String label = "REPORT";
	
	//신고 Insert
	public int inputReport(ReportVO reportVO)throws Exception{
		int result = reportMapper.inputReport(reportVO);
		
		//받아온 파일들을 반복문 돌려서 HDD 저장 및 DB에 저장
		if(reportVO.getFiles() != null) {
			for(MultipartFile f : reportVO.getFiles()) {
				if(!f.isEmpty()) {
					log.info("fileName : ", f.getOriginalFilename());
					String fileName = fileManager.saveFile(f, path, label);
					FileVO fileVO = new FileVO();
					fileVO.setFileName(fileName);
					fileVO.setLabel(label);
					fileVO.setNum(reportVO.getReportNum());
					fileVO.setFileOriName(f.getOriginalFilename());
					
					//DB저장
					fileMapper.inputFile(fileVO);
				}
			}
		}
	return result;
	}

}
