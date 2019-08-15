package hello.mapper;

import java.util.List;

import hello.domain.issue.Issue;

public interface IssueMapper{
    public void insertIssue(Issue issue);
    public List<Issue> listIssue();
};