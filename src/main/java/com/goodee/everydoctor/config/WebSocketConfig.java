package com.goodee.everydoctor.config;

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
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		registry.addHandler(signalHandler(), "/signal")
//				.setAllowedOriginPatterns("http://*:81", "http://*.*.*.*:81")
//		        .withSockJS()
//		        .setClientLibraryUrl("https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js");
//		        //.setClientLibarayUrl은 그냥 sockjs CDN 주소를 입력해도 무관하다.
//		        //https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js
//		        // 원래 코드 : http://localhost:8080/myapp/js/sock-client.js
//		        /*
//		        Spring Boot에서 CORS 설정 시, .allowCredentials(true)와
//		        .allowedOrigins("*")는 동시 설정을 못하도록 업데이트 되었다고 한다.
//		        모든 주소를 허용하는 대신 특정 패턴만 허용하는 것으로 적용해야한다고 변동됨.
//		        
//		        .allowedOrigins("*") 대신 .allowedOriginPatterns("*")를 사용하면 에러는 해결이
//		        된다고 한다.
//		        
//		        나는 이처럼 하지 않고, http://localhost:8080 또는, IP 주소로 접속하기 때문에
//		        위에 설정처럼 하였다.
//		        */
		
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
