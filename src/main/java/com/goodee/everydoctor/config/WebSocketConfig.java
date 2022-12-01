package com.goodee.everydoctor.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketConfigurer, WebSocketMessageBrokerConfigurer{

	@Autowired
	private ChatHandler chatHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler, "")	//handler 클래스와 경로를 설정
				.setAllowedOrigins("*") //ws프로토콜/ws/chat 하위의 모든uri에서 chatHandler를 사용한다는 의미
				.addInterceptors(new HttpSessionHandshakeInterceptor());
				//interceptor for adding httpsession into websocket session
		
		registry.addHandler(signalHandler(), "/signal")
        		.setAllowedOrigins("*"); // allow all origins
	}
	
	@Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws").withSockJS(); //웹 소캣을 사용하기 위해 설정하는 부분
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app"); //prefix 설정
        registry.enableSimpleBroker("/topic"); //topic 이라는 주제에 브로커를 설정
    }
    
	@Bean
    public WebSocketHandler signalHandler() {
        return new SignalHandler();
    }

//	@Bean
//    public ServletServerContainerFactoryBean createWebSocketContainer() {
//        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
//        container.setMaxTextMessageBufferSize(8192);
//        container.setMaxBinaryMessageBufferSize(8192);
//        return container;
//    }
}
