package hello.mapper;

import java.util.List;

import hello.domain.account.Account;
import hello.domain.issue.Assignee;
import hello.domain.issue.Issue;

public interface IssueMapper{
    public void insertWithUserId(Issue issue);
    public Account selectByUserId(int id);
    public Issue read(int id);
    public List<Assignee> addedAssignees(int issueId);
};