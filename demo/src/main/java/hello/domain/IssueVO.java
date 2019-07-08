package hello.domain;

import lombok.Data;

@Data
public class IssueVO{
    private int id;
    private String title;
    private String content;
    private boolean status;
    private int viewcount;
    private String create_at;
    private String update_at;
}