package hello.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import hello.domain.IssueVO;

//@Repository: 해당클래스가 데이터베이스에 접근하는 클래스임을 명시
@Repository("hello.mapper.IssueMapper")    
public interface IssueMapper{
    public int issueCount();                //이슈 갯수
    public List<IssueVO> issueList();       //이슈 리스트    
    public IssueVO issueView(int id);       //이슈 보기
    public int issueInsert(IssueVO vo);    //이슈 저장
    public void issueModify(IssueVO vo);    //이슈 수정
    public int issueDelete(int id);        //이슈 삭제
}