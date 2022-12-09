package com.goodee.everydoctor.chatting;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomRepository {

	private Map<String, ChatRoomVO> chatRoomVOMap;

    @PostConstruct
    private void init(){
        chatRoomVOMap = new LinkedHashMap<>();
    }

    public List<ChatRoomVO> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoomVO> result = new ArrayList<>(chatRoomVOMap.values());
        Collections.reverse(result);

        return result;
    }

    public ChatRoomVO findRoomById(String id){
        return chatRoomVOMap.get(id);
    }

    public ChatRoomVO createChatRoomVO(String name){
    	ChatRoomVO room = ChatRoomVO.create(name);
        chatRoomVOMap.put(room.getRoomId(), room);

        return room;
    }
}
