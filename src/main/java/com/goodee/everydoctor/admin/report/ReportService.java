package com.goodee.everydoctor.admin.report;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.util.FileManager;
import com.goodee.everydoctor.util.Pager;
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

	private String label = "REPORT";

	//신고 Insert
	public int inputReport(ReportVO reportVO)throws Exception{
		int result = reportMapper.inputReport(reportVO);

		//받아온 파일들을 반복문 돌려서 HDD 저장 및 DB에 저장
		if(reportVO.getFiles() != null) {
			for(MultipartFile f : reportVO.getFiles()) {
				log.info("fileName : ", f.getOriginalFilename());
				String fileName = fileManager.saveFile(f, label);
				FileVO fileVO = new FileVO();
				fileVO.setFileName(fileName);
				fileVO.setNum(reportVO.getReportNum());			
				fileVO.setFileOriName(f.getOriginalFilename());
				fileVO.setLabel(label);

				//DB저장
				fileMapper.inputFile(fileVO);
			}
		}
		return result;
	}

	//신고 리스트 불러오기
	public List<ReportVO> findReportList(Pager pager)throws Exception{
		Long totalCount = reportMapper.findCount(pager);
		pager.getRowNum();
		pager.getNum(totalCount);
		
		return reportMapper.findReportList(pager);
	}

	//신고 답변 등록
	public int inputReportAnswer(ReportAnswerVO reportAnswerVO)throws Exception{
		int result = 0;
		int inputResult = reportMapper.inputReportAnswer(reportAnswerVO);
		log.info("=========== ReportNum : {}", reportAnswerVO.getReportNum());
		int updateResult = reportMapper.modifyReportChecked(reportAnswerVO.getReportNum());
		if(inputResult == 1 && updateResult == 1) {
			result = 1;
		}
		return result;
	}

	//신고 디테일 불러오기
	public ReportVO findReportDetail(ReportVO reportVO)throws Exception{
		return reportMapper.findReportDetail(reportVO);
	}

}
