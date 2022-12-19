package com.goodee.everydoctor.sse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmMapper alarmMapper;
	
	public int setAlarm(AlarmVO alarmVO)throws Exception{
		return alarmMapper.setAlarm(alarmVO);
	}
	//alarm 리스트 출력
	public List<AlarmVO> findAlarmList(AlarmVO alarmVO)throws Exception{
		return alarmMapper.findAlarmList(alarmVO);
	}

}
