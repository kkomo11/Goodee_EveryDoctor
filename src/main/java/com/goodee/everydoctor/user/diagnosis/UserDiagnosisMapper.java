package com.goodee.everydoctor.user.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.user.UserVO;
import com.goodee.everydoctor.util.Pager;

@Mapper
public interface UserDiagnosisMapper {
	public List<HospitalDiagnosisVO> findHospitalDiagnosisListbyUsername(Pager pager)throws Exception;
	public Long findMylistCnt(Pager pager);

}
