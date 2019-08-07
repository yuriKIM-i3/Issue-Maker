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
            <div class="row justify-content-center mt-1 mb-5 pb-5">
                <div class="col-3">
                    <h2 class="text-center">Modify Name</h2>
                </div>
            </div>        
            <form action="/my_page/apply/name" method="POST">            
                <div class="row justify-content-center py-2">
                    <div class="col-2 text-center">
                        <label for="name">Name</label>
                    </div>
                    <div class="col-3 text-center">                        
                        <c:choose>
                            <c:when test="${(empty errorMessege.hasFieldErrors('name')) or (errorMessege.hasFieldErrors('name')==false && errorMessege.hasErrors()==true)}">                                    
                                <input type="text" class="form-control" name="name" value="${account.name}" id="name">
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control is-invalid" name="name" value="${errorMessege.getFieldValue('name')}" id="name">
                                <div class="invalid-feedback">
                                    ${errorMessege.getFieldError('name').getDefaultMessage()}
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>                  
                <div class="row justify-content-center py-2 mt-4">
                    <div class="col-2 text-center">
                        <button class="btn btn-dark" type="submit">Save</button>                  
                    </div>    
                    <div class="col-2 text-center">
                        <a class="btn btn-dark" role="button" href="/my_page">Go Back</a>                  
                    </div>    
                </div> 
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/commonization/html_footer.jsp" %> 
    </body>
</html>