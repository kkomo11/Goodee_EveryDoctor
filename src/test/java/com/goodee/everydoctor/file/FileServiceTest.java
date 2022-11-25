package com.goodee.everydoctor.file;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FileServiceTest {

	@Autowired
	private FileManageService fileManageService;
	
//	@Test
	void getFileDetailTest() throws Exception{
		FileVO f = new FileVO();
		
		f.setLabel("TEST");
		f.setFileNum(1);
		
		f = fileManageService.getFileDetail(f);
		
		assertNotNull(f);
	}
	
//	@Test
	void deleteFileTest() throws Exception{
		FileVO f = new FileVO();
		
		f.setLabel("TEST");
		f.setFileNum(2);
		
		int result = fileManageService.fileDelete(f);
		
		assertEquals(result, 1);
	}

}
