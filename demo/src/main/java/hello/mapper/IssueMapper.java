package hello.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import hello.domain.IssueVO;

//@Repository: 해당클래스가 데이터베이스에 접근하는 클래스임을 명시
@Repository("hello.mapper.IssueMapper")    
public interface IssueMapper{
    public List<IssueVO> issueList();                   //이슈 리스트    
    public IssueVO issueView(int id);                   //이슈 보기
    public void issueUpdateViewCount(int id);           //이슈 조회수 증가
    public int issueInsert(IssueVO vo);                 //이슈 저장
    public void issueModify(IssueVO vo);                //이슈 수정
    public int issueDelete(int id);                     //이슈 삭제    

    public List<IssueVO> testlist(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);
    public int testcount();
}