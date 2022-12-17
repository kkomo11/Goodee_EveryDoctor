package com.goodee.everydoctor.sse;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmMapper {
	
	public int setAlarm(AlarmVO alarmVO)throws Exception;

}
