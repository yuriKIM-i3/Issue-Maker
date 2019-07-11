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
                    <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/myPage">내정보</a>                  
                    </li>
                    <li class="nav-item">                  
                    <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="#">로그아웃</a>  
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
                            <label for="searchIssue" class="font-weight-light">이슈검색</label>                
                        </div>               
                    </div>
                    <div class="row pb-2">
                        <div class="col-6">
                            <div class="row pt-2">           
                                <div class="col-10">
                                    <input class="form-control" type="text" id="searchIssue" name="keyword_title" placeholder="이슈제목으로검색">
                                </div>
                                <div class="col-2 pt-1">
                                    <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                                </div>
                            </div>                       
                        </div>
                        <div class="col-2 offset-md-4 text-right">
                            <a type="button" class="btn btn-outline-dark btn-lg" href="/issue_write">New Issue</a>
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

<!--이슈 리스트-->
                <div class="row">
                    <div class="col">
                        <div class="alert alert-light" role="alert" style="height: 900px">
                            <c:forEach var="list" items="${list}">
                                <div class="row">
                                    <div class="col">
                                        <div class="alert alert-light border-bottom h-75" role="alert">
                                            <!--이슈Status 라벨들  이슈 담당자들, 댓글수-->
                                            <div class="row">
                                                <div class="col-1">
                                                    <h5><span class="badge badge-light">${list.status}</span></h5>
                                                </div>
                                                <div class="col-5">
                                                    <a href="/issue_view/${list.id}" class="alert-link">${list.title}</a>
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
                            </c:forEach>                                
                        </div>
                    </div>
                </div>

                <select name="contentnum" id="contentnum">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                </select>
                <table>
                    <thead>
                        <th></th>
                    </thead>
                </table>
                <tbody>
                    <c:forEach var="k" items="${list}">
                        <tr>
                            <td>${k.id}</td>
                            <td>${k.title}</td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <c:if test="${page.prev}">
                                <a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
                            </c:if>
                            <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
                                <a href="javascript:page(${idx});">${idx}</a>
                            </c:forEach>
                            <c:if test="${page.next}">
                                    <a href="javascript:page(${page.getEndPage()-1});">&laquo;</a>
                            </c:if>
                        </td>
                    </tr>
                </tfoot>
                <!--<div class="row justify-content-center">
                    <div class="col-2">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    -->
                </div>>
            </div>
        </div>
    <footer class="page-footer font-small blue pt-4">
        <div class="footer-copyright text-center py-3">© 2019 Copyright:
            <a href="https://github.com/crane93">Yuri Kim</a>
        </div> 
    </footer>
  </body>
  <script>
      fuction page(idx){
          var pagenum = idx;
          var contentnum = $("#contentnum option:selected").val();
          location.href="${issue_list}"
      }
  </script>
</html>