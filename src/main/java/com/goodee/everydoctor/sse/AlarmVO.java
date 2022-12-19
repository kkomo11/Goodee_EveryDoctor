package com.goodee.everydoctor.sse;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlarmVO {
	
	private int alarmNum;
	private String alarmContents;
	private Timestamp alarmTime;
	private String alarmReceiver;
}
