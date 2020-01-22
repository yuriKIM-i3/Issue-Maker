package hello.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hello.domain.account.Account;
import hello.domain.issue.Assignee;
import hello.domain.issue.Issue;
import hello.mapper.IssueMapper;

@Service
public class IssueService{
    @Autowired
    IssueMapper issueMapper;

    public void insertWithUserId(Issue issue){
        issueMapper.insertWithUserId(issue);        
    };

    public Account selectByUserId(int id){
        return issueMapper.selectByUserId(id);
    };

    public Issue readService(int id){
        return issueMapper.read(id);
    }

    public List<Assignee> addedAssignees(int issueId){
        return issueMapper.addedAssignees(issueId);
    }
};