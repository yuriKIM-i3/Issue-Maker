package hello.domain.issue;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class Issue{
    private int id;

    @NotNull(message = "title can't be blank")
    private String title;
    @NotNull(message = "content can't be blank")
    private String content;
    
    private int status;
    private int viewcount;
    private String create_at;
    private String update_at;
    private int user_id;
}