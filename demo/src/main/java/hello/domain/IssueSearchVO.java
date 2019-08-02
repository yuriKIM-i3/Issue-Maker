package hello.domain;

import lombok.Data;

@Data
public class IssueSearchVO extends ListPagingVO{
    private String title;
    private String usr_id;
    private String usr_name;
    private long bbs_sno;
    private long blt_rsrc_sno;
}