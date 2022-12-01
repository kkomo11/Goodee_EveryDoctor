package com.goodee.everydoctor.user;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;

@WebAppConfiguration
@SpringBootTest
@Slf4j
class UserImportTest {
	@Value("${import.api.key}")
	private String apiKey;
	@Value("${import.api.secret}")
	private String apiSecret;
	


	@Test
	void certificationTest() throws Exception{
		IamportClient client = new IamportClient(apiKey,apiSecret);
		log.info("아임포트 key {}   secret {}", apiKey, apiSecret);
		
		IamportResponse<AccessToken> auth_response = client.getAuth();
		String token = auth_response.getResponse().getToken();
		log.info("아임포트 token {}", token);
		
		
	      String test_imp_uid = "imp_201549968284";
	
	        try {
	            IamportResponse<Certification> certification_response = client.certificationByImpUid(test_imp_uid);
	
	            assertNotNull(certification_response.getResponse());
	            
	            assertEquals(test_imp_uid, certification_response.getResponse().getImpUid());
	            log.info("NAME {}   GENDER {}   PHONE {}     BIRTH {}   UIQUEKEY {}",certification_response.getResponse().getName(), certification_response.getResponse().getGender(), certification_response.getResponse().getPhone(), certification_response.getResponse().getBirth(), certification_response.getResponse().getUniqueKey());
	            assertEquals("http://localhost/", certification_response.getResponse().getOrigin());
	        } catch (IamportResponseException e) {
	            System.out.println(e.getMessage());
	
	            switch (e.getHttpStatusCode()) {
	                case 401:
	                    //TODO
	                    break;
	                case 500:
	                    //TODO
	                    break;
	            }
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		
	}

}
