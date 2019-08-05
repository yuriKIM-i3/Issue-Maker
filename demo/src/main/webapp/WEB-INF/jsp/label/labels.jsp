<%@ include file="/WEB-INF/jsp/commonization/jstl.jsp" %>
<!doctype html>
<html>
  <%@ include file="/WEB-INF/jsp/commonization/html_head.jsp" %>
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
      <div class="row"><div class="col py-3"></div></div>
      <div class="row">
        <h1>라벨편집</h1>
      </div>
        <div class="addLabel">
          <div class="row justify-content-end my-2">
            <div class="col-2 text-right">
              <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#addLabel" aria-expanded="false" aria-controls="collapseExample">
                New Label
              </button>
            </div>            
          </div>
          <form>
            <div class="collapse row justify-content-start" id="addLabel">
              <div class="col-1 text-center">                                   
                <button type="button" class="btn btn-warning">NT</button>
              </div>
              <div class="col-2">
                <input class="form-control" type="text" placeholder="라벨이름">
              </div>
              <div class="col-5">
                <input class="form-control" type="text" placeholder="라벨설명">
              </div>
              <div class="col-1 text-left pt-1">              
                <button type="button" class="btn btn-secondary btn-sm" data-toggle="tooltip" data-placement="top" title="Change Color">
                  <img class="border border-secondary" src="../images/outline_replay_1x.png">  
                </button>
              </div>
              <div class="col-2 offset-md-1 text-right pt-1">
                <button type="submit" class="btn btn-light btn-sm border border-secondary">저장</button>
                <button type="button" class="btn btn-secondary btn-sm">취소</button>
              </div>
            </div>
          </form>                        
        </div>
        <div class="searchLabel my-3">
          <form>
            <div class="row">
              <div class="col-4">
                <label for="searchLabel" class="font-weight-light">라벨이름으로 검색</label>                
              </div>               
            </div>
            <div class="row mb-3">
              <div class="col-2 ">
                <input class="form-control" type="text" id="searchLabel" placeholder="라벨이름">
              </div>
              <div class="col-2 pt-1">
                <button type="submit" class="btn btn-secondary btn-sm">검색</button>
              </div>             
            </div>
          </form>
        </div>        
        <div class="row">
          <div class="col">
            <div class="alert alert-dark" >
              <div class="row justify-content-start">
                  <div class="col-2 pt-2">
                      <button type="button" class="btn btn-dark">
                        라벨갯수 <span class="badge badge-light">4</span>
                      </button>                                
                  </div>                            
              </div>
            </div>
          </div>
        </div>            
        <div class="row">
          <div class="col">
            <div class="alert alert-light" role="alert" style="height: 450px">                                                        
              <div class="row">
                <div class="col">
                  <div class="alert alert-light border-bottom h-75" role="alert">                
                    <div class="row">
                      <div class="col-3">
                        <button type="button" class="btn btn-warning">NT</button>
                      </div>
                      <div class="col-6 pt-1">
                        라벨설명
                      </div>
                      <div class="col-3 text-right">
                        <h5 class="float-right"><button type="button" class="badge badge-light border border-dark mx-1" data-toggle="modal" data-target="#confirmDelete">Delete</button></h5>                                         
                        <h5 class="float-right"><a href="#" class="badge badge-light border border-dark mx-1">Edit</a></h5>                        
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
                    </div>
                  </div>
                </div>
              </div>               
            </div>
          </div>
        </div>
        <div class="row"><div class="col my-5"></div></div>
      </div>
    <%@ include file="/WEB-INF/jsp/commonization/html_footer.jsp" %>
  </body>
</html>