<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
    <link rel="stylesheet" href="/resources/css/common.css">
    <title>Issue Maker</title>
  </head>
  <body class="wrap">
    <header> 
      <nav class="navbar header">
        <a class="navbar-brand font_C_white" href="/index">Issue Maker</a>            
        <ul class="nav justify-content-end">
          <li class="nav-item">
            <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/issue_list">이슈목록</a>                  
          </li>
          <li class="nav-item">
            <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/myPage">내정보</a>                  
          </li>
          <li class="nav-item">                  
            <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="#">로그아웃</a>  
          </li>
        </ul>           
      </nav>
    </header>
    <div class="container">
      <div class="row"><div class="col py-4"></div></div>
      <div class="row justify-content-center my-2">
        <div class="col-3 pb-2">
          <h1 class="text-center">New Issue</h1>
        </div>
      </div>
      <form action="/writeProc" method="POST">
        <div class="row justify-content-center my-2">
          <div class="col-8">
            <input type="text" class="form-control form-control-lg" name="title" placeholder="이슈제목을 입력">
          </div>
        </div>        
        <div class="row justify-content-center my-2">
          <div class="col-8">            
            <div class="form-group">            
              <textarea class="form-control overflow-auto" rows="13" name="content" placeholder="이슈내용을 입력"></textarea>
            </div>
          </div>
        </div>
        <div class="row justify-content-center my-2">
          <div class="col-2">              
            <h4><span class="badge badge-secondary">Assignee</span></h4>               
          </div>  
          <div class="col-5">                      
          </div>
          <div class="col-1 text-center pt-1">
            <button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#SearchAssignee">Add</button>
            <!-- Modal -->
            <div class="modal fade" id="SearchAssignee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Search Assignee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div class="container">
                      <div class="row my-1">
                        <div class="col-8">
                          <input type="text" class="form-control" placeholder="user name">
                        </div>           
                        <div class="col-4">
                          <button type="button" class="btn btn-dark">찾기</button>
                        </div>
                      </div>
                      <div class="row my-1 justify-content-start">
                        <div class="col-3 pt-3">
                          검색된사람
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
        </div>
        <div class="row justify-content-center my-2">
          <div class="col-2">                
            <h4><span class="badge badge-secondary">Labels</span></h4>                 
          </div>
          <div class="col-5">
          </div>
          <div class="col-1 text-center pt-1">
            <button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#addLabel">Add</button>
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
                      <div class="row my-1 justify-content-start">
                        <div class="col-3 pt-3">
                          검색된 라벨
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-light border border-secondary">Add</button>
                  </div>
                </div>
              </div>  
            </div>  
          </div>          
        </div>
        <div class="row mt-4 justify-content-end">
          <div class="offset-md-5 col-4">
            <div class="row">
              <div class="col-3 text-right">
                <input type="submit" class="btn btn-dark" value="Save">
              </div>
              <div class="col-3 text-center">
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#confirmDelete">취소</button>     
                <!-- Modal -->
                <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">글쓰기 취소</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body text-left">
                        이슈작성을 취소하겠습니까
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="location.href='/issue_list'">Yes</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">No</button>
                      </div>
                    </div>
                  </div>
                </div>               
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    <footer class="page-footer font-small blue pt-4">
      <div class="footer-copyright text-center py-3">© 2019 Copyright:
        <a href="https://github.com/crane93">Yuri Kim</a>
      </div> 
    </footer>
  </body>
</html>