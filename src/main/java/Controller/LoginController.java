package Controller;

import ILogin.imp.LoginImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @PostMapping("/dologin")
    @ResponseBody
    public String checkUser(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean loginFlag = LoginImp.getInstance().validUser(username, password);
        JSONObject jsonResponse = new JSONObject();
        if (loginFlag) {
            jsonResponse.put("success", true);
            jsonResponse.put("redirectURL", "/success");
        } else {
            jsonResponse.put("success", false);
        }
        return jsonResponse.toString();
    }

    @GetMapping("/success")
    public String getSuccessPage() {
        return "success";
    }
}
