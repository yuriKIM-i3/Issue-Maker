package hello.Controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.mapper.IssueMapper;

@Controller
public class HomeController {
    
    @Resource(name="hello.mapper.IssueMapper")
    IssueMapper issue;

    @RequestMapping("/")
    public String home() throws Exception{
        return "index";
    }

}