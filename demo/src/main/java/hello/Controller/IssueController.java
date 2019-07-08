package hello.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.IssueVO;
import hello.service.IssueService;

@Controller
public class IssueController{
    @Resource(name="hello.service.IssueService")
    IssueService issueService;

    @RequestMapping("/issue_list")
    public String issue_list(Model model){
        model.addAttribute("list", issueService.issueListService());
        return "Issue/issue_list";
    }

    @RequestMapping("/issue_write")
    public String issue_write(){
        return "Issue/issue_write";
    }

    @RequestMapping("/writeProc")
    public String issueInsertProc(HttpServletRequest request){
        IssueVO vo = new IssueVO();
        vo.setContent(request.getParameter("content"));
        vo.setTitle(request.getParameter("title"));
        issueService.issueInsertService(vo);
        return "redirect:/issue_list";
    }

    @RequestMapping("/issue_view/{id}")
    public String issue_view(@PathVariable int id, Model model){
        model.addAttribute("issue_view", issueService.issueViewService(id));
        return "Issue/issue_view";
    }

    @RequestMapping("/issue_delete/{id}")
    public String issueDelete(@PathVariable int id){
        issueService.issueDeleteService(id);
        return "redirect:/issue_list";
    }
}