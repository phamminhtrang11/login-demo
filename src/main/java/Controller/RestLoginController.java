package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;

@RestController
public class RestLoginController {
    @Autowired
    @Qualifier("restTemplate")
    private RestTemplate restTemplate;

    @Bean
    @Primary
    public RestTemplate restTemplate() {

        SimpleClientHttpRequestFactory simpleClientHttpRequestFactory = new SimpleClientHttpRequestFactory();
        simpleClientHttpRequestFactory.setConnectTimeout(60000);
        simpleClientHttpRequestFactory.setReadTimeout(60000);

        RestTemplate restTemplate = new RestTemplate(simpleClientHttpRequestFactory);
        restTemplate.getMessageConverters()
                .add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));

        return restTemplate;
    }
    @PostMapping(value = "/dologin")
    public String checkUser(@RequestBody LoginReq req) {
        String apiUrl = "http://localhost:8080/api/login";

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("username", req.getUsername());
        params.add("password", req.getPassword());

        // Make the API call
        String response = restTemplate.postForObject(apiUrl, params, String.class);

        return response;
    }
}
