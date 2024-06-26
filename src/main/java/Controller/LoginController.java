package Controller;

import ILogin.ILoginDao;
import ILogin.imp.LoginImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private ILoginDao iLoginDao;

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @PostMapping("/dologin")
    public String checkUser(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean loginFlag = iLoginDao.validUser(username, password);
        if (loginFlag) {
            return "success";
        } else {
            return "failure";
        }
    }
}
