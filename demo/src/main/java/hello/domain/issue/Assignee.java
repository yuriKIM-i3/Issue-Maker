package hello.domain.issue;

import lombok.Data;

@Data
public class Assignee{
    private int id;
    private int issue_id;
    private int user_id;
    private String username;    
}