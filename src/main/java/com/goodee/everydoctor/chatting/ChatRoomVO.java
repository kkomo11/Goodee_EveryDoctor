package com.goodee.everydoctor.chatting;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatRoomVO {
	private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

    public static ChatRoomVO create(String name){
    	ChatRoomVO room = new ChatRoomVO();

        room.roomId = UUID.randomUUID().toString();
        room.name = name;
        return room;
    }
}
