package hello.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController{
    @RequestMapping("/myPage")
    public String labels(){
        return "MyPage/myPage";
    }
}