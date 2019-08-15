package hello.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hello.domain.issue.Issue;
import hello.mapper.IssueMapper;

@Service
public class IssueService{
    @Autowired
    IssueMapper issueMapper;

    public void insertIssue(Issue issue){
        issueMapper.insertIssue(issue);        
    };

    public List<Issue> listIssue(){
        return issueMapper.listIssue();
    };
};