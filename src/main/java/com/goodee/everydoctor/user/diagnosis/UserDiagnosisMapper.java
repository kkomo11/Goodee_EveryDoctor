package com.goodee.everydoctor.user.diagnosis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface UserDiagnosisMapper {
	public HospitalDiagnosisVO getHospitalDiagnosisListbyUsername(UserVO userVO)throws Exception;


}
