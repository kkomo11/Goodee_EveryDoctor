package com.goodee.everydoctor.user;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import lombok.Data;

@Data
public class UserVO implements UserDetails, OAuth2User{
	
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	private String password2;
	@NotBlank
	private String name;
	@NotBlank
	private String email;
	private Integer birth;
	private String phone;
	private Date userRegdate;
	private String sex;
	private String fileName;
	private List<String> roles;
	private String ci;
	private String social;
	
	private boolean enabled;
	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;
	
	//OAuth2User, Token 등 정보를 저장
	private Map<String, Object> attributes;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		for(String role: roles) {
			//꺼낸 rolename을 authorities에 담으려고 한다.
			authorities.add(new SimpleGrantedAuthority(role));
		}
		
		return authorities;
	}

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	

}
