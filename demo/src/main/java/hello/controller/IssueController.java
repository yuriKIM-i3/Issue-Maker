package hello.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.issue.Issue;
import hello.service.IssueService;

@Controller
public class IssueController{
    @Autowired
    IssueService issueService;
    
    @RequestMapping("/issue/list")
    public String issue_list(Model model){           
        model.addAttribute("issue_list", issueService.listIssue());

        return "issue/issue_list";
    }

    @RequestMapping("/issue/write")
    public String issue_write(){
        return "issue/issue_write";
    }

    @PostMapping("/issue/write/apply")
    public String issue_write_apply(@Valid Issue issue, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){         
            model.addAttribute("errorMessege", bindingResult);
            
            return "issue/issue_write";
        }

        issueService.insertIssue(issue);
        System.out.print("글작성");

        return "redirect:/issue/list";
    }

    @RequestMapping("/issue/view")
    public String issue_view(){
        return "issue/issue_view";
    }
}