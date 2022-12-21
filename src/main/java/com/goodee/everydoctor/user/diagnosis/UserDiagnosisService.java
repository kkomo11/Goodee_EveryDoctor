package com.goodee.everydoctor.user.diagnosis;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;
import com.goodee.everydoctor.user.address.UserAddressMapper;
import com.goodee.everydoctor.user.address.UserAddressVO;
import com.goodee.everydoctor.user.security.LogoutHandlerImpl;
import com.goodee.everydoctor.util.EmailManager;
import com.goodee.everydoctor.util.FileManager;
import com.goodee.everydoctor.util.MessageManager;
import com.goodee.everydoctor.util.Pager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class UserDiagnosisService {
	
	@Autowired
	private UserDiagnosisMapper diagnosisMapper;
	
	public List<HospitalDiagnosisVO> getMylist(Pager pager)throws Exception{
		Long cnt = diagnosisMapper.findMylistCnt(pager);
		log.info("count {}", cnt);
		pager.getNum(cnt);
		pager.getRowNum();
		
		return diagnosisMapper.findHospitalDiagnosisListbyUsername(pager);
	}
	
	public List<PetDiagnosisVO> getPetlist(Pager pager)throws Exception{
		Long cnt = diagnosisMapper.findMylistCnt(pager);
		log.info("count {}", cnt);
		pager.getNum(cnt);
		pager.getRowNum();
		
		return diagnosisMapper.findPetDiagnosisListbyUsername(pager);
	}
	
}
