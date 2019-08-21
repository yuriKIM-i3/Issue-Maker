package hello.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hello.domain.account.Account;
import hello.domain.issue.Issue;
import hello.mapper.IssueMapper;

@Service
public class IssueService{
    @Autowired
    IssueMapper issueMapper;

    public void insertIssue(Issue issue){
        issueMapper.insertIssue(issue);        
    };

    public Account selectIssueById(int id){
        return issueMapper.selectIssueById(id);
    };
};