<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/commonization/jstl.jsp" %>
<!doctype html>
<html>
    <%@ include file="/WEB-INF/jsp/commonization/html_head.jsp" %>
    <body class="wrap">
        <header> 
            <nav class="navbar header">
                <a class="navbar-brand font_C_white" href="/issue/list">Issue Maker</a>            
                <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/issue/list">Issue List</a>                  
                </li>                
                <li class="nav-item">                  
                    <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="<%= request.getRequestURL().toString().replace(request.getRequestURI(), "/logout") %>">Sign Out</a>  
                </li>
                </ul>           
            </nav>
        </header>
        <div class="container">
            <div class="row"><div class="col py-3"></div></div>
            <div class="title">
                <div class="row py-2">
                    <div class="col-8">
                        <h3>${issue_view.title}</h3>
                    </div>
                    <div class="col-1 pt-2">
                        <button type="button" class="badge badge-secondary">수정</button>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-2">
                        이슈상태
                    </div>
                    <div class="col-2">
                        이슈작성자
                    </div>
                    <div class="col-2">
                        작성일시
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <span class="badge badge-light">Open</span>
                        <span class="badge badge-dark">Close</span>
                    </div>
                    <div class="col-2">
                        <h6>학녀</h6>
                    </div>
                    <div class="col-2">
                        <h6><time>${issue_view.create_at.substring(0,10)}</time></h6>
                    </div>
                </div>
            </div>
            <div class="content mt-4 mb-5">
                <div class="row">
                    <div class="col-1">
                        <h4><span class="badge badge-success">シホ</span></h4>
                     </div>                  
                    <div class="col-8 issue_content">
                        <div class="form-group">            
                            <textarea class="form-control overflow-auto" rows="12">
                                ${issue_view.content}
                            </textarea>
                        </div>
                    </div>
                    <div class="col-3 issue_label_and_assignee">
                        <div class="applied_label">
                            <div class="row">
                                <div class="col mb-2">
                                    현재 적용된 라벨 <button class="badge badge-light pb-1 border border-dark" data-toggle="modal" data-target="#addLabel">add</button>                        
                                </div>                                     
                                <!-- Modal -->
                                <div class="modal fade" id="addLabel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Add Labels</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="container">
                                                    <div class="row my-1">
                                                        <div class="col-8">
                                                            <input type="text" class="form-control" placeholder="라벨이름">
                                                        </div>           
                                                        <div class="col-4">
                                                            <button type="button" class="btn btn-dark">찾기</button>
                                                        </div>
                                                    </div>
                                                    <div class="row my-1">
                                                        <div class="col pt-3">
                                                            <h4><span class="badge" style="background-color: #37a04f">검색된라벨</span></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-light border border-secondary">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="col ml-3">
                                    <h4><span class="badge" style="background-color: #a9f2ba">NT</span></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ml-3">
                                    <h4><span class="badge" style="background-color: #963196">LGTM</span></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ml-3">
                                    <h4><span class="badge" style="background-color: #684be9">Merge OK</span></h4>
                                </div>
                            </div>
                        </div>   
                        <div class="assignee mt-5">
                            <div class="row">
                                <div class="col mb-2">
                                    이슈담당자 <button class="badge badge-light pb-1 border border-dark" data-toggle="modal" data-target="#addAssignee">add</button>                        
                                </div>  
                                <!-- Modal -->
                                <div class="modal fade" id="addAssignee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">유저검색</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="container">
                                                <div class="row mt-2">
                                                    <div class="col-8">
                                                        <input type="text" class="form-control" placeholder="username">
                                                    </div>           
                                                    <div class="col-4">
                                                        <button type="button" class="btn btn-dark">찾기</button>
                                                    </div>
                                                </div>
                                                <div class="row my-1">
                                                    <div class="col pt-3">
                                                        <h4><span class="badge" style="background-color: #37a04f">검색된유저</span></h4>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-light border-secondary">추가</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>                            
                            <c:forEach var="assignees" items="${assignees}">
                                <div class="row">
                                    <div class="col ml-3">
                                        <h4><span class="badge badge-success">${assignees.username}</span></h4>
                                    </div>
                                </div>                           
                            </c:forEach>                            
                        </div>                   
                    </div>
                </div>
            </div>
        <form>
            <div class="addedContent my-2">
                <div class="row">
                    <div class="col-1">
                        <h4><span class="badge badge-success">ガレット</span></h4>
                    </div>
                    <div class="col-8">
                        <div class="form-group">            
                            <textarea class="form-control overflow-auto" rows="6" placeholder="이슈내용을 입력"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="addedContent my-2">
                <div class="row">
                    <div class="col-1">
                        <h4><span class="badge badge-success">マウス</span></h4>
                    </div>
                    <div class="col-8">
                        <div class="form-group">            
                            <textarea class="form-control overflow-auto" rows="6" placeholder="이슈내용을 입력"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="addedContent my-2">
                <div class="row">
                    <div class="col-1">
                        <h4><span class="badge badge-success">シホ</span></h4>
                    </div>
                    <div class="col-8">
                        <div class="form-group">            
                            <textarea class="form-control overflow-auto" rows="6" placeholder="이슈내용을 입력"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-end">
                <div class="col-9 text-right">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-secondary">내용추가</button>                                
                        <button type="button" class="btn btn-light border border-secondary">Issue Close</button>
                    </div>
                </div>
                <div class="col-3 text-right pt-3">                    
                    <button type="button" class="badge badge-dark" data-toggle="modal" data-target="#confirmDelete">delete Issue</button>                    
                </div>
                <!-- Modal -->
                <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">이슈삭제</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-left">
                                정말로 삭제하시겠습니까?<br>
                                (삭제 후 되돌릴 수 없습니다.)
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yes</button>
                                <button type="button" class="btn btn-outline-secondary">No</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>          
        </div>
        <%@ include file="/WEB-INF/jsp/commonization/html_footer.jsp" %>
    </body>
</html>