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
            <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/my_page">My Page</a>                  
          </li>
          <li class="nav-item">                  
            <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="<%= request.getRequestURL().toString().replace(request.getRequestURI(), "/logout") %>">Sign Out</a>  
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
      <form action="/issue/write/apply" method="POST">
        <div class="row justify-content-center my-2">
          <div class="col-8">            
            <c:choose>
              <c:when test="${(empty errorMessege.hasFieldErrors('title')) or (errorMessege.hasFieldErrors('title')==false && errorMessege.hasErrors()==true)}">              
                <input type="text" class="form-control form-control-lg" name="title" value="${errorMessege.getFieldValue('title')}" id="title" placeholder="fill out a title">
              </c:when>
              <c:otherwise>              
                <input type="text" class="form-control is-invalid" name="title" value="${errorMessege.getFieldValue('title')}" id="title" placeholder="fill out a title">
                <div class="invalid-feedback">
                  ${errorMessege.getFieldError('title').getDefaultMessage()}
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>        
        <div class="row justify-content-center my-2">
          <div class="col-8">            
            <div class="form-group">                          
              <c:choose>
                <c:when test="${(empty errorMessege.hasFieldErrors('content')) or (errorMessege.hasFieldErrors('content')==false && errorMessege.hasErrors()==true)}">                                
                  <textarea class="form-control overflow-auto" name="content" rows="13" value="${errorMessege.getFieldValue('title')}" id="content" placeholder="fill out a content"></textarea>
                </c:when>
                <c:otherwise>              
                  <input type="text" class="form-control is-invalid" name="content" value="${errorMessege.getFieldValue('content')}" id="title" placeholder="fill out a content">
                  <div class="invalid-feedback">
                    ${errorMessege.getFieldError('content').getDefaultMessage()}
                  </div>
                </c:otherwise>
              </c:choose>
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
        <div class="row mt-4">
          <div class="col-7"></div>
          <div class="col-3 text-right">
            <input type="submit" class="btn btn-dark" value="Save">
          </div>              
        </div>
      </form>
    </div>
    <%@ include file="/WEB-INF/jsp/commonization/html_footer.jsp" %>
  </body>
</html>