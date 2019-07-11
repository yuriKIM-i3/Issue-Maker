package hello.Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.IssueSearchVO;
import hello.domain.IssueVO;
import hello.domain.PageMaker;
import hello.service.IssueService;

@Controller
public class IssueController{
    @Resource(name="hello.service.IssueService")
    IssueService issueService;

    // @RequestMapping("/issue_list")
    // public String issue_list(Model model){
    //     model.addAttribute("list", issueService.issueListService());
    //     return "Issue/issue_list";
    // }

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
        issueService.issueUpdateViewCountService(id);
        model.addAttribute("issue_view", issueService.issueViewService(id));
        return "Issue/issue_view";
    }

    @RequestMapping("/issue_delete/{id}")
    public String issueDelete(@PathVariable int id){
        issueService.issueDeleteService(id);
        return "redirect:/issue_list";
    }

    @RequestMapping("/issue_list")
    public String issue_list(HttpServletRequest request) {
        PageMaker pagemaker = new PageMaker();
        String pagenum = request.getParameter("pagenum");
        String contentnum = request.getParameter("contentnum");
        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);

        pagemaker.setTotalcount(issueService.issueCountService());  //전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);                           //현재 페이지를 페이지 객체에 지정한다 -1을 해야 쿼리에서 사용할 수 있다
        pagemaker.setContentnum(ccontentnum);                       //한 페이지에 몇개씩 게시글을 보여줄지 지정한다
        pagemaker.setCurrentblock(cpagenum);                        //혀재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다
        pagemaker.setLastblock(pagemaker.getTotalcount());          //마지막 블록 번호를 전체 게시글 수를 통해서 정한다
        pagemaker.prevnext(cpagenum);                               //현재 페이지 번호로 화살표를 나타낼지 정한다
        pagemaker.setStartPage(pagemaker.getCurrentblock());        //시작 페이지를 페이지 블록 번호로 정한다
        pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());    //마지막 페이지를 마지막페이지 블록과 현재 페이지 블록 번호로 정한다

        List<IssueVO> testlist = issueService.testlist(pagemaker.getPagenum()*10, pagemaker.getContentnum());
         
        request.setAttribute("list", testlist);
        request.setAttribute("page", pagemaker);

        return "Issue/issue_list";
    }
}