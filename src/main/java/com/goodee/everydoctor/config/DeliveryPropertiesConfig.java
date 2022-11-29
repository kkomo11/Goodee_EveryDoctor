package com.goodee.everydoctor.config;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class DeliveryPropertiesConfig {

	@Bean
	public PropertiesFactoryBean deliveryPropertiesFactoryBean() {
		PropertiesFactoryBean bean = new PropertiesFactoryBean();
		bean.setLocation(new ClassPathResource("application.properties"));
		return bean;
	}
	
}
