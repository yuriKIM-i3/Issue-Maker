package hello.mapper;

import hello.domain.account.Account;
import hello.domain.issue.Issue;

public interface IssueMapper{
    public void insertIssueEachUser(Issue issue);
    public Account selectIssueById(int id);
    public Issue viewIssue(int id);
};