package hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;


@Controller
public class AppController {
    @RequestMapping("/home")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "Login/login";
    }
}