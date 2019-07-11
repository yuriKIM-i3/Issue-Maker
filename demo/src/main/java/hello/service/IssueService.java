package hello.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import hello.domain.IssueSearchVO;
import hello.domain.IssueVO;
import hello.mapper.IssueMapper;

@Service("hello.service.IssueService")
public class IssueService{
    @Resource(name="hello.mapper.IssueMapper")
    IssueMapper issueMapper;

    public List<IssueVO> issueListService(){
        return issueMapper.issueList();
    }

    public IssueVO issueViewService(int id){
        return issueMapper.issueView(id);
    }

    public void issueUpdateViewCountService(int id){
        issueMapper.issueUpdateViewCount(id);
    }

    public int issueInsertService(IssueVO vo){
        return issueMapper.issueInsert(vo);
    }

    public int issueDeleteService(int id){
        return issueMapper.issueDelete(id);
    }

    public int issueCountService(){
        return issueMapper.testcount();
    }

    public List<IssueVO> testlist(int pagenum, int contentnum){
        return issueMapper.testlist(pagenum, contentnum);
    }
}