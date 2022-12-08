package com.goodee.everydoctor.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired
	private ChatHandler chatHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		// 챗봇용
		registry.addHandler(chatHandler, "ws/chat")	//handler 클래스와 경로를 설정
		.setAllowedOrigins("*"); //ws프로토콜/ws/chat 하위의 모든uri에서 chatHandler를 사용한다는 의미
//		.addInterceptors(new HttpSessionHandshakeInterceptor());
		//interceptor for adding httpsession into websocket session
		
		registry.addHandler(signalHandler(), "/signal")
		.setAllowedOrigins("*"); // allow all origins 
	}

    @Bean
    WebSocketHandler signalHandler() {
        return new SignalHandler();
    }

    @Bean
    ServletServerContainerFactoryBean createWebSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        container.setMaxTextMessageBufferSize(8192);
        container.setMaxBinaryMessageBufferSize(8192);
        return container;
    }
}
