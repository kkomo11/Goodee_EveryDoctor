package com.goodee.everydoctor.user;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;

@Mapper
public interface UserMapper {

	public int chkId(String username)throws Exception;
	public int inputUser(UserVO userVO) throws Exception;
	public int inputRolePre(UserVO userVO)throws Exception;
	public int inputRoleMember(UserVO userVO)throws Exception;
	public int inputRoleDoctor(UserVO userVO)throws Exception;
	public int inputRolePetdoc(UserVO userVO)throws Exception;
	public int inputRoleNurse(UserVO userVO)throws Exception;
	public int inputRolePetnurse(UserVO userVO)throws Exception;
	public int inputRoleAdmin(UserVO userVO)throws Exception;
	public int inputRolePharmacist(UserVO userVO)throws Exception;
	public UserVO getUserByUsername(String username)throws UsernameNotFoundException;
	public int modifyUserMember(UserVO userVO) throws Exception;
	public int modifyRoleMember(UserVO userVO) throws Exception;
	public int hasUserByCI(UserVO userVO)throws Exception;
	public int modifyFileName(UserVO userVO) throws Exception;
	public int modifyPhone(UserVO userVO) throws Exception;
	public int modifyEmail(UserVO userVO) throws Exception;
	public int modifyPassword(UserVO userVO) throws Exception;
}
