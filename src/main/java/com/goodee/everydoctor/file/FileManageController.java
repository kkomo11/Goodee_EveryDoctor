package com.goodee.everydoctor.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileManageController {
	@Autowired
	private FileManageService fileManageService;
	
	@GetMapping("/resources/everydoctor/{label}/{fileNum}")
	public ModelAndView fileDown(FileVO fileVO, @PathVariable String label)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		fileVO = fileManageService.getFileDetail(fileVO);
		fileVO.setLabel(label);
		
		log.info("==fileVO {}==", fileVO);
		
		mv.addObject("fileVO", fileVO);
		mv.addObject("label", fileVO.getLabel());
		mv.setViewName("fileManager");
		
		return mv;
	}
	
	
	//===아래는 테스트 코드 추후 삭제예정==
	@GetMapping("/fileUpload")
	public String fileUpload() throws Exception{
		//업로드 테스트 페이지
		return "fileUploadTest";
	}
	
	@PostMapping("/fileUpload")
	@ResponseBody
	public String fileUpload(FileVO fileVO)throws Exception{
		//업로드 테스트
		
		String filename = fileManageService.saveFile(fileVO);
		
		//download주소 mapping
		return "다운로드 : resources/everydoctor/TEST/"+fileVO.getFileNum()+ "    이미지 뷰 : file/TEST/"+fileVO.getFileName();
	}
	
	@GetMapping("fileDelete/{label}/{fileNum}")
	@ResponseBody
	public int fileDelete(FileVO fileVO) throws Exception{
		
		int result = fileManageService.fileDelete(fileVO);
		
		
		return result;
	}
	
}
