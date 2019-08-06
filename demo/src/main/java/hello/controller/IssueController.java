package hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController{
    @RequestMapping("/issue/list")
    public String issue_list(){           
        return "issue/issue_list";
    }

    @RequestMapping("/issue/write")
    public String issue_write(){
        return "issue/issue_write";
    }

    @RequestMapping("/issue/view")
    public String issue_view(){
        return "issue/issue_view";
    }
}