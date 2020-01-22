package hello.domain.issue;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Issue{
    private int id;

    @NotBlank(message = "title can't be blank")
    private String title;
    
    @NotBlank(message = "content can't be blank")
    private String content;
    
    private int status;
    private int viewcount;
    private String create_at;
    private String update_at;
    private int user_id;

    private List<Assignee> assignees;
}