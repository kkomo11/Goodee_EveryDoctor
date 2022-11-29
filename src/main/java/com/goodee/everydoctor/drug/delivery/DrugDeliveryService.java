package com.goodee.everydoctor.drug.delivery;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.report.ReportVO;
import com.goodee.everydoctor.util.FileManager;

@Service
@Transactional(rollbackFor = Exception.class)
public class DrugDeliveryService {

	@Autowired
	private DrugDeliveryMapper drugDeliveryMapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Value("${app.file.base}")
	private String path;
	
	private String label = "drugDelivery";
	
	public List<DrugDeliveryVO> getList(DrugDeliveryVO drugDeliveryVO)throws Exception {
		return drugDeliveryMapper.getList(drugDeliveryVO);
	}

	public DrugDeliveryVO getDetail(DrugDeliveryVO drugDeliveryVO) throws Exception {
		// TODO Auto-generated method stub
		return drugDeliveryMapper.getDetail(drugDeliveryVO);
	}
	
	public int setDrugDeliveryIcon(DrugDeliveryVO drugDeliveryVO)throws Exception{
		int result = drugDeliveryMapper.setDrugDeliveryIcon(drugDeliveryVO);
		
		//받아온 파일들을 반복문 돌려서 HDD 저장 및 DB에 저장
		for(MultipartFile f : drugDeliveryVO.getFiles()) {
			
			String fileName = fileManager.saveFile(f, label);
			FileVO fileVO = new FileVO();
			fileVO.setFileName(fileName);
//			fileVO.setNum(drugDeliveryVO.getDrugDeliveryNum());			
			fileVO.setFileOriName(f.getOriginalFilename());
			
			//DB저장
			fileMapper.inputFile(fileVO);
		}
		return result;
	}
	
}
