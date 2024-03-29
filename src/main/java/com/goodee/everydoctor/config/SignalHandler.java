package com.goodee.everydoctor.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodee.everydoctor.telemedicine.Room;
import com.goodee.everydoctor.telemedicine.RoomService;
import com.goodee.everydoctor.telemedicine.WebSocketMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Component
public class SignalHandler extends TextWebSocketHandler {
    @Autowired private RoomService roomService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final ObjectMapper objectMapper = new ObjectMapper();

    // 웹RTC
    
    // session id to room mapping
    private Map<String, Room> sessionIdToRoomMap = new HashMap<>();

    // message types, used in signalling:
    // text message
    private static final String MSG_TYPE_TEXT = "text";
    // SDP Offer message
    private static final String MSG_TYPE_OFFER = "offer";
    // SDP Answer message
    private static final String MSG_TYPE_ANSWER = "answer";
    // New ICE Candidate message
    private static final String MSG_TYPE_ICE = "ice";
    // join room data message
    private static final String MSG_TYPE_JOIN = "join";
    // leave room data message
    private static final String MSG_TYPE_LEAVE = "leave";
    
//    private static List<WebSocketSession> list = new ArrayList<>(); //채팅

    @Override
    public void afterConnectionClosed(final WebSocketSession session, final CloseStatus status) {
        logger.debug("[ws] Session has been closed with status {}", status);
//        list.remove(session); //채팅
        sessionIdToRoomMap.remove(session.getId());
    }

    @Override
    public void afterConnectionEstablished(final WebSocketSession session) {
        // webSocket has been opened, send a message to the client
        // when data field contains 'true' value, the client starts negotiating
        // to establish peer-to-peer connection, otherwise they wait for a counterpart
    
//    	list.add(session); //채팅
        sendMessage(session, new WebSocketMessage("Server", MSG_TYPE_JOIN, Boolean.toString(!sessionIdToRoomMap.isEmpty()),null, null, null));
    }

    @Override
    protected void handleTextMessage(final WebSocketSession session, final TextMessage textMessage) {
        // a message has been received
        try {					//readValue같은 경우는 json형식 String을 다시 class객체로 
            WebSocketMessage message = objectMapper.readValue(textMessage.getPayload(), WebSocketMessage.class);
            logger.info("[ws] Message of {} type from {} received", message.getType(), message.getFrom());
            String userName = message.getFrom(); // origin of the message
            String data = message.getData(); // payload

            logger.info("textMessage: "+textMessage.getPayload());
            Room room;
            switch (message.getType()) {
                // text message from client has been received
                case MSG_TYPE_TEXT:
                	logger.info("messageToString : ", message.toString());
                    logger.info("[ws] Text message: {}", message.getData());
                    logger.info("text fileName : {}", message.getFileName());
                    // message.data is the text sent by client
                    // process text message if needed
                    Room rm2 = sessionIdToRoomMap.get(session.getId());
                    if (rm2 != null) {
                        Map<String, WebSocketSession> clients = roomService.getClients(rm2);
                        for(Map.Entry<String, WebSocketSession> client : clients.entrySet())  {
                            // send messages to all clients except current user
                            if (!client.getKey().equals(userName)) {
                                // select the same type to resend signal
                                sendMessage(client.getValue(), message);
                            }
                        }
                    }
                    break;

                // process signal received from client
                case MSG_TYPE_OFFER:
                case MSG_TYPE_ANSWER:
                case MSG_TYPE_ICE:
                    Object candidate = message.getCandidate();
                    Object sdp = message.getSdp();
                    logger.debug("[ws] Signal: {}",
                            candidate != null
                                    ? candidate.toString().substring(0, 64)
                                    : sdp.toString().substring(0, 64));

                    Room rm = sessionIdToRoomMap.get(session.getId());
                    if (rm != null) {
                        Map<String, WebSocketSession> clients = roomService.getClients(rm);
                        for(Map.Entry<String, WebSocketSession> client : clients.entrySet())  {
                            // send messages to all clients except current user
                            if (!client.getKey().equals(userName)) {
                                // select the same type to resend signal
                                sendMessage(client.getValue(),
                                        new WebSocketMessage(
                                                userName,
                                                message.getType(),
                                                data,
                                                null,
                                                candidate,
                                                sdp));
                            }
                        }
                    }
                    break;

                // identify user and their opponent
                case MSG_TYPE_JOIN:
                    // message.data contains connected room id
                    logger.debug("[ws] {} has joined Room: #{}", userName, message.getData());
                    room = roomService.findRoomByStringId(data)
                            .orElseThrow(() -> new IOException("Invalid room number received!"));
                    // add client to the Room clients list
                    roomService.addClient(room, userName, session);
                    sessionIdToRoomMap.put(session.getId(), room);
                    break;

                case MSG_TYPE_LEAVE:
                    // message data contains connected room id
                    logger.debug("[ws] {} is going to leave Room: #{}", userName, message.getData());
                    // room id taken by session id
                    room = sessionIdToRoomMap.get(session.getId());
                    // remove the client which leaves from the Room clients list
                    Optional<String> client = roomService.getClients(room).entrySet().stream()
                            .filter(entry -> Objects.equals(entry.getValue().getId(), session.getId()))
                            .map(Map.Entry::getKey)
                            .findAny();
                    client.ifPresent(c -> roomService.removeClientByName(room, c));
                    break;

                // something should be wrong with the received message, since it's type is unrecognizable
                default:
                    logger.debug("[ws] Type of the received message {} is undefined!", message.getType());
                    // handle this if needed
            }

        } catch (IOException e) {
            logger.info("An error occured: {}", e.getMessage());
        }
    }

    private void sendMessage(WebSocketSession session, WebSocketMessage message) {
        try {
            String json = objectMapper.writeValueAsString(message);//writeValueAsString -json형식String으로 변화시켜줌
            logger.info("Json : {}", json);
            session.sendMessage(new TextMessage(json));
        } catch (IOException e) {
            logger.debug("An error occured: {}", e.getMessage());
        }
    }
}
