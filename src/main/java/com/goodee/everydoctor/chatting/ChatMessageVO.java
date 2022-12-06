package com.goodee.everydoctor.chatting;

import lombok.Data;

@Data
public class ChatMessageVO {

	private String roomId;
    private String writer;
    private String message;
}
