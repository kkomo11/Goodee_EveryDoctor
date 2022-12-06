package com.goodee.everydoctor.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import com.goodee.everydoctor.user.security.AuthenticationSuccessImpl;
import com.goodee.everydoctor.user.security.LogoutHandlerImpl;
import com.goodee.everydoctor.user.security.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private AuthenticationSuccessImpl authenticationSuccessImpl;
	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;
	@Autowired
	private LogoutHandlerImpl logoutHandlerImpl;

	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		//Security에서 무시해야하는 URL패턴 등록
		return web -> web
				.ignoring()
				.antMatchers("/images/**")
				.antMatchers("/css/**")
				.antMatchers("/js/**")
				.antMatchers("/favicon/**")
				.antMatchers("/resources/**");
	}
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception{
		
		//csrf 비활성화
		httpSecurity.csrf()
					.disable();
		
		//cors 설정
		httpSecurity.cors();
		
		//요청 권한 허용
		httpSecurity.authorizeRequests()
					.antMatchers("/").permitAll()
					.anyRequest().permitAll();
		
		//로그인
		httpSecurity.formLogin()
					.loginPage("/user/login")
					.successHandler(authenticationSuccessImpl)
					.permitAll()
					.and()
					.userDetailsService(userDetailsServiceImpl);
		
		//로그아웃
		httpSecurity.logout()
					.logoutUrl("/logout")
					.addLogoutHandler(logoutHandlerImpl)
					.logoutSuccessUrl("/")	
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID")
					.permitAll();
		
		//소셜로그인
		httpSecurity.oauth2Login()
					.userInfoEndpoint()
					.userService(userDetailsServiceImpl)
					
					;
		
		//RememberMe 설정
		httpSecurity.rememberMe()
					.tokenValiditySeconds(3600) //로그인 유지시간 (초단위)
					.key("rememberMe") //key는 인증받은 사용자의 정보로 Token 생성시 필요, 필수
					.alwaysRemember(true) //사용자가 기능사용을 체크하지 않아도 항상 사용
					.userDetailsService(userDetailsServiceImpl)  //인증 절차를 실행할 UserDetailservice, 필수
					;
					
		
		return httpSecurity.build();	
	}
	
	@Bean
	public PasswordEncoder getEncoder() {
		return new BCryptPasswordEncoder(15);
	}
}
