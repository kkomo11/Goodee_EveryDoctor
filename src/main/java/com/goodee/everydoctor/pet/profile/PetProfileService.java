package com.goodee.everydoctor.pet.profile;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.util.FileManager;

@Service
public class PetProfileService {
	
	@Value("${app.file.base}")
	private String base; //파일 다운로드와 저장, 삭제 시 사용
	
	@Autowired
	private PetProfileMapper petProfileMapper;
	
	@Autowired
	private FileManager fileManager;
	
	public int deletePetProfile(PetVO petVO) throws Exception {
		
		if(petVO.getPetFileName() != null) {
			this.deleteFile(petVO.getPetFileName(), base + "PET/");
		}
		
		return petProfileMapper.deletePetProfile(petVO);
	}
	
	public int modifyPetProfile(PetVO petVO, MultipartFile petFile) throws Exception {
		
		if(petVO.getPetFileName() != null && !petFile.isEmpty()) {
			this.deleteFile(petVO.getPetFileName(), base + "PET/");
		} // 기존에 프로필 사진이 등록되어 있고 새로 등록한 프로필 사진이 있으면 기존 파일 삭제
		
		if(!petFile.isEmpty()) {
			String petFileName = this.saveFile(petFile);
			petVO.setPetFileName(petFileName);
		} // 새로 등록한 프로필 사진이 있으면 새로 저장
		
		return petProfileMapper.modifyPetProfile(petVO);
	}
	
	public PetBioVO findPetBioDetail(PetBioVO petBioVO) throws Exception {
		return petProfileMapper.findPetBioDetail(petBioVO);
	}
	
	public PetVO findPetProfileDetail(PetVO petVO) throws Exception {
		return petProfileMapper.findPetProfileDetail(petVO);
	}
	
	public int inputPetProfile(PetVO petVO, MultipartFile petFile) throws Exception {
		// petFile 이름으로 매개변수 MultipartFile을 받고 FileManager써서 FileName을 반환받고 petFileName으로 VO에 넣어야함
		if(!petFile.isEmpty()) {
			String petFileName = this.saveFile(petFile);
			petVO.setPetFileName(petFileName);
		}
		return petProfileMapper.inputPetProfile(petVO);
	}
	
	public List<PetBioVO> findPetBioList() throws Exception {
		return petProfileMapper.findPetBioList();
	}
	
	public List<PetBioVO> findPetBioDetailList(PetBioVO petBioVO) throws Exception {
		return petProfileMapper.findPetBioDetailList(petBioVO);
	}
	
	public List<PetBioVO> findPetBioDetailSearch(PetBioVO petBioVO) throws Exception {
		return petProfileMapper.findPetBioDetailSearch(petBioVO);
	}
	
	//파일 업로드 테스트
	private String saveFile(MultipartFile petFile)throws Exception{
		//아마 보통 서비스에서 실행하는 코드
		String label = "PET";
		//fileVO.setLabel(label);
		
		String fileName ="";
		//saveFile
		//HDD저장 (저장경로에 label을 추가해준다.)
		fileName = fileManager.saveFile(petFile, label);
		
		return fileName;
	}
	
	private boolean deleteFile(String fileName, String path) {
		File file = new File(path, fileName);
		
		boolean result = file.delete();
		
		return result;
	}

}
