package com.goodee.everydoctor.sse;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmMapper {
	
	public int setAlarm(AlarmVO alarmVO)throws Exception;
	//alarm 리스트 출력
	public List<AlarmVO> findAlarmList(AlarmVO alarmVO)throws Exception;

}
