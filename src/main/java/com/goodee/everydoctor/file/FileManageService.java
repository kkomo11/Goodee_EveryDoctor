package com.goodee.everydoctor.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.util.FileManager;

import lombok.extern.slf4j.Slf4j;

//테스트용 클래스 추후 삭제 예정
@Service
@Slf4j
public class FileManageService {
	
	@Autowired
	private FileMapper fileMapper;
	@Value("${app.download.base}")
	private String base;
	@Autowired
	private FileManager fileManager;

	
	//FileDetail 가져오기 TEST
	public FileVO getFileDetail(FileVO fileVO)throws Exception {
		
		return fileMapper.getFileByFileNum(fileVO);

	}
	
	
	//파일 업로드 테스트
	public String saveFile(FileVO fileVO)throws Exception{
		//아마 보통 서비스에서 실행하는 코드
		String label = "TEST";
		fileVO.setLabel(label);
		
		int result = 0;
		String fileName ="";
		//saveFile
		for(MultipartFile f: fileVO.getFiles()) {
			//HDD저장 (저장경로에 label을 추가해준다.)
			fileName = fileManager.saveFile(f, base, label);
			fileVO.setFileName(fileName);
			fileVO.setFileOriName(f.getOriginalFilename());
			
			//DB저장
			result = fileMapper.inputFile(fileVO);
		}
		
		return fileName;
	}
	
	public int fileDelete(FileVO fileVO) throws Exception{
		log.info("삭제할 fileVO {}",fileVO);
		//fileName가져오기
		fileVO = fileMapper.getFileByFileNum(fileVO);
		
		//db에서 삭제
		int result = fileMapper.deleteFileByFileNum(fileVO);
		boolean result2 = false;
		
		//db삭제 완료되면 HDD삭제
		if(result == 1) {
			result2 =fileManager.deleteFile(fileVO, base);
		}
		
		log.info("파일삭제? {}", result2);
		return result;
	}
	
}
