package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;

@Controller
public class LoginController {

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

    @GetMapping("/login")
        public String getLoginPage() {
            return "login";
        }

    @PostMapping("/dologin")
    @ResponseBody
    public String checkUser(@RequestParam("username") String username, @RequestParam("password") String password) {
        String apiUrl = "http://localhost:8080/api/login";

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("username", username);
        params.add("password", password);

        // Make the API call
        String response = restTemplate.postForObject(apiUrl, params, String.class);

        return response;
    }
    @GetMapping("/success")
    public String getSuccessPage() {
        return "success";
    }
}
