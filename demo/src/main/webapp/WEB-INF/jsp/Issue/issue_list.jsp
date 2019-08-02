<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <%@ include file="/WEB-INF/jsp/Commonization/html_head.jsp" %>
    <body class="wrap">
        <header> 
            <nav class="navbar header">
                <a class="navbar-brand font_C_white" href="/issue_list">Issue Maker</a>            
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/myPage">My Page</a>                  
                    </li>
                    <li class="nav-item">                  
                        <a href="<%= request.getRequestURL().toString().replace(request.getRequestURI(), "/logout") %>" class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3">Sign Out</a>  
                    </li>
                </ul>           
            </nav>
        </header>
        <div class="container">
            <div class="issue_search mb-2">
                <div class="row m-5"><div class="col"><h2 class="text-center">Issue Maker</h2></div></div>
                <div class="row m-4"><div class="col"></div></div>
                <form>
                    <div class="row">
                        <div class="col-4 ml-1 pt-1">
                            <label for="searchIssue" class="font-weight-light">Search Issue</label>                
                        </div>               
                    </div>
                    <div class="row pb-2">
                        <div class="col-6">
                            <div class="row pt-2">           
                                <div class="col-10">
                                    <input class="form-control" type="text" id="searchIssue" placeholder="이슈제목으로검색">
                                </div>
                                <div class="col-2 pt-1">
                                    <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                                </div>
                            </div>                       
                        </div>
                        <div class="col-2 offset-md-4 text-right">
                            <a role="button" class="btn btn-outline-dark btn-lg" href="/issue_write">New Issue</a>
                        </div>             
                    </div>
                </form>
            </div>
            <div class="issue_list">
                <div class="row">
                    <div class="col">
                        <div class="alert alert-dark" >
                            <div class="row justify-content-between">
                                <div class="col-2 pt-2">
                                    <a class="badge badge-light" href="#">10 Open</a> 
                                    <a class="badge badge-dark" href="#">1000 Close</a>                                   
                                </div>
                                <div class="col-5">
                                    <div class="row justify-content-around">
                                        <div class="col-3 text-center pt-1">
                                            <div class="dropdown">
                                                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="authorDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Author
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="authorDropdown">
                                                    <input class="form-control" type="text" placeholder="작성자검색">
                                                    <div class="dropdown-divider"></div>    
                                                    <a class="dropdown-item" href="#">학녀</a>
                                                    <a class="dropdown-item" href="#">마츠다세이코</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 text-center pt-1">
                                            <div class="dropdown">
                                                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="labelDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Label
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="labelDropdown">
                                                    <input class="form-control" type="text" placeholder="라벨검색">
                                                    <div class="dropdown-divider"></div>    
                                                    <a class="dropdown-item" href="#">학녀</a>
                                                    <a class="dropdown-item" href="#">마츠다세이코</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 text-center pt-1">
                                            <div class="dropdown">
                                                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="assignDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Assignee
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="assignDropdown">
                                                    <input class="form-control" type="text" placeholder="담당자검색">
                                                    <div class="dropdown-divider"></div>    
                                                    <a class="dropdown-item" href="#">학녀</a>
                                                    <a class="dropdown-item" href="#">마츠다세이코</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 text-center pt-1">
                                            <div class="dropdown">
                                                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="sortDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Sort
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="sortDropdown">                                        
                                                    <a class="dropdown-item" href="#">최근업데이트</a>
                                                    <a class="dropdown-item" href="#">생성일로부터 오래됨</a>
                                                    <a class="dropdown-item" href="#">생성일로부터 최신</a>
                                                    <a class="dropdown-item" href="#">most comments</a>
                                                    <a class="dropdown-item" href="#">least comments</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="alert alert-light" role="alert" style="height: 900px">
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-light border-bottom h-75" role="alert">
                                        <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                        <div class="row">
                                            <div class="col-1">
                                                <h5><span class="badge badge-light">open</span></h5>
                                            </div>
                                            <div class="col-5">
                                                <a href="/issue_view" class="alert-link">이슈제목</a>
                                            </div>
                                            <div class="col-3">
                                                라벨자리
                                            </div>
                                            <div class="col-2">
                                                담당자들자리
                                            </div>
                                            <div class="col-1">
                                                댓글수
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-light border-bottom h-75" role="alert">
                                        <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                        <div class="row">
                                            <div class="col-1">
                                                <h5><span class="badge badge-light">open</span></h5>
                                            </div>
                                            <div class="col-5">
                                                <a href="#" class="alert-link">이슈제목</a>
                                            </div>
                                            <div class="col-3">
                                                라벨자리
                                            </div>
                                            <div class="col-2">
                                                담당자들자리
                                            </div>
                                            <div class="col-1">
                                                댓글수
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-light border-bottom h-75" role="alert">
                                        <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                        <div class="row">
                                            <div class="col-1">
                                                <h5><span class="badge badge-dark">close</span></h5>
                                            </div>
                                            <div class="col-5">
                                                <a href="#" class="alert-link">이슈제목</a>
                                            </div>
                                            <div class="col-3">
                                                라벨자리
                                            </div>
                                            <div class="col-2">
                                                담당자들자리
                                            </div>
                                            <div class="col-1">
                                                댓글수
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-light border-bottom h-75" role="alert">
                                        <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                        <div class="row">
                                            <div class="col-1">
                                                <h5><span class="badge badge-dark">close</span></h5>
                                            </div>
                                            <div class="col-5">
                                                <a href="#" class="alert-link">이슈제목</a>
                                            </div>
                                            <div class="col-3">
                                                라벨자리
                                            </div>
                                            <div class="col-2">
                                                담당자들자리
                                            </div>
                                            <div class="col-1">
                                                댓글수
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-light border-bottom h-75" role="alert">
                                        <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                        <div class="row">
                                            <div class="col-1">
                                                <h5><span class="badge badge-dark">close</span></h5>
                                            </div>
                                            <div class="col-5">
                                                <a href="#" class="alert-link">이슈제목</a>
                                            </div>
                                            <div class="col-3">
                                                라벨자리
                                            </div>
                                            <div class="col-2">
                                                담당자들자리
                                            </div>
                                            <div class="col-1">
                                                댓글수
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <footer class="page-footer font-small blue pt-4">
        <div class="footer-copyright text-center py-3">© 2019 Copyright:
            <a href="https://github.com/crane93">Yuri Kim</a>
        </div> 
    </footer>
  </body>
</html>