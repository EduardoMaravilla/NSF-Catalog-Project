package org.eduardomaravill.nfs_catalogo.services.users_services.implement;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.services.users_services.IReCaptchaService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Service
public class ReCaptchaServiceImpl implements IReCaptchaService {

    @Value("${recaptcha.secret-key}")
    private String reCaptchaApiSecretKey;

    @Value("${recaptcha.verify.url}")
    private String reCaptchaVerifyUrl;

    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public ValidTokenResponse verifyReCaptcha(String token) {
        Map<String, String> requestParams = new HashMap<>();
        requestParams.put("secret", reCaptchaApiSecretKey);
        requestParams.put("response", token);

        ResponseEntity<Map<String, Object>> responseEntity = restTemplate.exchange(
                reCaptchaVerifyUrl,
                HttpMethod.POST, new HttpEntity<>(requestParams),
                new ParameterizedTypeReference<>() {
                });

        Map<String, Object> body = responseEntity.getBody();

        if (body != null) {
             Boolean success = (Boolean) body.get("success");
             return new ValidTokenResponse(success);
        }
        return new ValidTokenResponse(false);
    }
}
