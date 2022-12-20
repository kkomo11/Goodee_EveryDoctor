package com.goodee.everydoctor.admin.agency;

import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;

import lombok.Data;

@Data
public class AgencyVO {

	private int agencyNum;
	@NotBlank
	private String agencyName;
	@NotBlank
	private String agencyAddr;
	@NotBlank
	private String agencyTel;
	private String agencyInfo;
	private String agencyRole;
	private String agencyType;
	
	private MultipartFile []files;
	private AgencyWorkHourVO agencyWorkHourVO;
	private List<FileVO> fileVOs;
}
