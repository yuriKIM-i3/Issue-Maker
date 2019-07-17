package hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController{
    @RequestMapping("/issue_list")
    public String issue_list(){
        System.out.print("로그인성공");
        return "Issue/issue_list";
    }

    @RequestMapping("/issue_write")
    public String issue_write(){
        return "Issue/issue_write";
    }

    @RequestMapping("/issue_view")
    public String issue_view(){
        return "Issue/issue_view";
    }
}