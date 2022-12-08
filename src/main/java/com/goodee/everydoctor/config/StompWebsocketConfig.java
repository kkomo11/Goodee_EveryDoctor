package com.goodee.everydoctor.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class StompWebsocketConfig implements WebSocketMessageBrokerConfigurer {
	
	@Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    
		registry.addEndpoint("/stomp/chat")
         		.setAllowedOrigins("http://localhost:81")
         		.withSockJS();
		
		//웹 소캣을 사용하기 위해 설정하는 부분
		registry.addEndpoint("/ws")
				.withSockJS(); 
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
//    	registry.setApplicationDestinationPrefixes("/pub");
//    	registry.enableSimpleBroker("/sub");
    	
    	registry.setApplicationDestinationPrefixes("/app"); //prefix 설정
        registry.enableSimpleBroker("/topic"); //topic 이라는 주제에 브로커를 설정
    }
}
