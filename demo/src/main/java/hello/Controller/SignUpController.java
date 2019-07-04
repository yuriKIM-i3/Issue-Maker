package hello.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignUpController{
    @RequestMapping("/signUp")
    public String labels(){
        return "SignUp/signUp";
    }
}