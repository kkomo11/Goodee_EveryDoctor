package com.goodee.everydoctor.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.goodee.everydoctor.file.FileVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager extends AbstractView {

	@Value("${app.file.base}")
	private String base; //파일 다운로드와 저장, 삭제 시 사용

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		log.info("==fileDownloadView==");
		FileVO fileVO = (FileVO)model.get("fileVO");
		String path = fileVO.getLabel();
		File file = new File(base+path+"/", fileVO.getFileName());

		//한글 처리
		response.setCharacterEncoding("UTF-8");

		//총 파일의 크기
		response.setContentLengthLong(file.length());

		//다운로드시 파일의 이름을 인코딩
		String fileOriName = URLEncoder.encode(fileVO.getFileOriName(), "UTF-8");

		//header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileOriName+"\"");
		response.setHeader("content-Transfer-Encoding", "binary");

		//HDD에서 파일을 읽고
		FileInputStream fi = new FileInputStream(file);

		//Client로 전송 준비
		OutputStream os = response.getOutputStream();

		//전송
		FileCopyUtils.copy(fi, os);

		//자원 해제
		os.close();
		fi.close();

	}

	public String saveFile(MultipartFile multipartFile, String label)throws Exception {
		String path=base+label+"/";
		
		//0. 저장경로에 폴더(directory)가 없으면 만든다.
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//1. 중복되지 않는 파일명 생성(UUID, Date)
		String boardFileName = UUID.randomUUID().toString();

		//2. 확장자
		StringBuffer bf = new StringBuffer();
		bf.append(boardFileName);

		//파일명과 확장자 분리
		String ex = multipartFile.getOriginalFilename();
		ex = ex.substring(ex.lastIndexOf("."));

		//bf.append(multipartFile.getOriginalFilename());
		bf.append(ex);

		boardFileName = bf.toString();

		//3. File 저장
		file = new File(path, bf.toString());

		// MultipartFile
		multipartFile.transferTo(file);

		return boardFileName;
	}
	
	//파일 삭제 (label 값과 FileName 필수)//
	public boolean deleteFile(FileVO fileVO)throws Exception{
		String path = base + fileVO.getLabel()+"/";
		
		File file = new File(path, fileVO.getFileName());
		
		boolean result = false;
		
		if(file.exists()) {
			if(file.isDirectory()) {
				File[] delList = file.listFiles();
				
				for(int i=0; i<delList.length; i++) {
					delList[i].delete();
				}
				
				if(delList.length==0) {
					result = file.delete();
				}
			}else {
				result = file.delete();
			}
		}
		
		
		return result;
	}
}
