package com.goodee.everydoctor.consult;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.util.FileManager;
import com.goodee.everydoctor.util.Pager;

@Service
public class ConsultService {
	
	@Autowired
	private ConsultMapper consultMapper;
	
	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private FileManager fileManager;
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteConsult(ConsultVO consultVO) throws Exception {
		consultMapper.deleteConsultCategory(consultVO);
		
		List<FileVO> consultFiles = consultMapper.findConsultFiles(consultVO);	// 기존의 파일 정보 조회
		
		if(consultFiles.size() > 0 && consultFiles.get(0) != null) {	// 기존에 파일이 존재하면
			for(FileVO file : consultFiles) {
				file.setLabel("CONSULT");
				this.fileDelete(file);	// 기존 파일들 삭제
			}
		}
		
		int result = consultMapper.deleteConsult(consultVO);
		
		return result;
		
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int modifyConsult(ConsultVO consultVO, Integer consultCategory, FileVO fileVO) throws Exception {
		consultVO.setConsultCategory(consultCategory);
		int result = consultMapper.modifyConsult(consultVO);	// 기존 내용 수정
		consultMapper.deleteConsultCategory(consultVO);			// 기존 카테고리 삭제
		consultMapper.inputConsultCategory(consultVO);			// 새로운 카테고리 등록
		
		if(fileVO.getFiles() != null) {	// 새로운 파일을 넣으면
			List<FileVO> consultFiles = consultMapper.findConsultFiles(consultVO);	// 기존의 파일 정보 조회
			
			if(consultFiles.size() > 0 && consultFiles.get(0) != null) {	// 기존에 파일이 존재하면
				for(FileVO file : consultFiles) {
					file.setLabel("CONSULT");
					this.fileDelete(file);	// 기존 파일들 삭제
				}
			}
			
			fileVO.setNum(consultVO.getConsultNum().intValue());	// 외래키를 넣어줌
			this.saveFile(fileVO);	// 파일을 HDD 및 DB에 저장
			
		}
		
		return result;
		
	}
	
	public ConsultVO findConsultDetail(ConsultVO consultVO) throws Exception {
		consultVO = consultMapper.findConsultDetail(consultVO);
		
		return consultVO;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int inputConsult(ConsultVO consultVO, Integer consultCategory, FileVO fileVO) throws Exception {
		consultVO.setConsultCategory(consultCategory);
		int result = consultMapper.inputConsult(consultVO);	// 무료 상담 테이블 입력
		int categoryResult = consultMapper.inputConsultCategory(consultVO);	// 상담-카테고리 테이블 입력
		
		if(fileVO.getFiles() != null) {	// 입력할 파일이 존재하면
			fileVO.setNum(consultVO.getConsultNum().intValue());	// 외래키를 넣어줌
			this.saveFile(fileVO);	// 파일을 HDD 및 DB에 저장
		}
		
		return result;
	}
	
	public List<HospitalCategoryVO> findConsultCategory(ConsultVO consultVO) throws Exception {
		return consultMapper.findConsultCategory(consultVO);
	}

	public List<ConsultVO> findConsultList(Pager pager) throws Exception {
		
		Long totalCount = consultMapper.findConsultCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		
		return consultMapper.findConsultList(pager);
	}
	
	public List<HospitalCategoryVO> findAllCategories() throws Exception{
		return consultMapper.findAllCategories();
	}
	
	private String saveFile(FileVO fileVO)throws Exception{
		//아마 보통 서비스에서 실행하는 코드
		String label = "CONSULT";
		fileVO.setLabel(label);
		
		int result = 0;
		String fileName ="";
		//saveFile
		for(MultipartFile f: fileVO.getFiles()) {
			
			if(!f.isEmpty()) {
				//HDD저장 (저장경로에 label을 추가해준다.)
				fileName = fileManager.saveFile(f, label);
				fileVO.setFileName(fileName);
				fileVO.setFileOriName(f.getOriginalFilename());
				
				//DB저장
				result = fileMapper.inputFile(fileVO);
			}
			
		}
		
		return fileName;
	}
	
	private int fileDelete(FileVO fileVO) throws Exception {
				
		//db에서 삭제
		int result = fileMapper.deleteFileByFileNum(fileVO);
		boolean result2 = false;
				
		//db삭제 완료되면 HDD삭제
		if(result == 1) {
			result2 =fileManager.deleteFile(fileVO);
		}
		
		return result;
	}
	
}
