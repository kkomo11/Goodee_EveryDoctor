package com.goodee.everydoctor.config;

import java.util.Map;
import java.util.stream.Collectors;
import com.google.common.base.Joiner;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class LogConfig {

	@Around("within(com.everydoctor.home..*)")
	public Object logging(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		
		String params = getRequestParams();
		
		long startAt = System.currentTimeMillis();

	    log.info("-----------> REQUEST : {}({}) = {}", proceedingJoinPoint.getSignature().getDeclaringTypeName(),
	    proceedingJoinPoint.getSignature().getName(), params);

	    Object result = proceedingJoinPoint.proceed(); // 4

	    long endAt = System.currentTimeMillis();

	    log.info("-----------> RESPONSE : {}({}) = {} ({}ms)", proceedingJoinPoint.getSignature().getDeclaringTypeName(),
	    proceedingJoinPoint.getSignature().getName(), result, endAt - startAt);

	    return result;
	}
	
	private String paramMapToString(Map<String, String[]> paramMap) {
		return paramMap.entrySet().stream()
				.map(entry -> String.format("%s -> (%s)",
						entry.getKey(), Joiner.on(",").join(entry.getValue())))
				.collect(Collectors.joining(", "));
	}
	
	private String getRequestParams() {
		String params = "없음";
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		if(requestAttributes != null) {
			HttpServletRequest httpServletRequest = ((ServletRequestAttributes) RequestContextHolder
			          .getRequestAttributes()).getRequest();
			Map<String, String[]> paramMap = httpServletRequest.getParameterMap();
			if(!paramMap.isEmpty()) {
				params = " [" + paramMapToString(paramMap) + "]";
			}
		}
		
		return params;
	}
	
}
