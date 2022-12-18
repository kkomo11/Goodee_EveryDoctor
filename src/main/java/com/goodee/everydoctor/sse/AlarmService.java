package com.goodee.everydoctor.sse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmMapper alarmMapper;
	
	public int setAlarm(AlarmVO alarmVO)throws Exception{
		return alarmMapper.setAlarm(alarmVO);
	}

}
