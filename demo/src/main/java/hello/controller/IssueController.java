package hello.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.controller_common_method.UserSignedIn;
import hello.domain.issue.Issue;
import hello.service.IssueService;

@Controller
public class IssueController{
    @Autowired
    IssueService issueService;
    
    @Autowired
    UserSignedIn userSignedIn;

    @RequestMapping("/issue/list")
    public String issueList(Model model){           
        model.addAttribute("my_issue_list", issueService.selectByUserId(userSignedIn.GetUserId()).getIssues());

        return "issue/issue_list";
    }

    @RequestMapping("/issue/write")
    public String issueWrite(){
        return "issue/issue_write";
    }

    @PostMapping("/issue/write/apply")
    public String issueWriteApply(@Valid Issue issue, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){         
            model.addAttribute("errorMessege", bindingResult);
            
            return "issue/issue_write";
        }
        issue.setUser_id(userSignedIn.GetUserId());
        issueService.insertWithUserId(issue);

        return "redirect:/issue/list";
    }

    @RequestMapping("/issue/view/{id}")
    public String issueView(@PathVariable int id, Model model){        
        model.addAttribute("issue_view", issueService.readService(id));
        model.addAttribute("assignees", issueService.addedAssignees(id));
        
        return "issue/issue_view";
    }
}