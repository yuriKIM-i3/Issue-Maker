<%@ include file="/WEB-INF/jsp/commonization/jstl.jsp" %> 
<!doctype html>
<html>
    <%@ include file="/WEB-INF/jsp/commonization/html_head.jsp" %> 
    <body class="wrap">
        <header> 
            <nav class="navbar header">
                <a class="navbar-brand font_C_white" href="/issue_list">Issue Maker</a>            
                <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/issue_list">Issue List</a>                  
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
                    <h1 class="text-center">My Profile</h1>
                </div>
            </div>        
            <form action="/my_page/apply/pass" method="POST">                                
                <div class="row justify-content-center mt-4 py-2">
                    <div class="col-2 text-center">
                        <label for="password">password</label>
                    </div>
                    <div class="col-3 text-center">
                        <c:choose>
                            <c:when test="${(empty errorMessege.hasFieldErrors('password')) or (errorMessege.hasFieldErrors('password')==false && errorMessege.hasErrors()==true)}">
                                <input type="password" class="form-control" name="password" id="password" placeholder="over 10 letters">
                            </c:when>
                            <c:otherwise>
                                <input type="password" class="form-control is-invalid" name="password" id="password" placeholder="over 10 letters">
                                <div class="invalid-feedback">
                                    ${errorMessege.getFieldError('password').getDefaultMessage()}
                                </div>
                            </c:otherwise>
                        </c:choose>              
                    </div>                                                       
                </div>
                <div class="row justify-content-center mt-4 py-2">
                    <div class="col-2 text-center">
                        <label for="password_check">passwordCheck</label>
                    </div>
                    <div class="col-3 text-center">
                        <c:choose>
                            <c:when test="${(empty errorMessege.hasFieldErrors('password_check')) or (errorMessege.hasFieldErrors('password_check')==false && errorMessege.hasErrors()==true)}">
                                <input type="password" class="form-control" name="password_check" id="password_check">
                            </c:when>
                            <c:otherwise>
                                <input type="password" class="form-control is-invalid" name="password_check">
                                <div class="invalid-feedback">
                                    ${errorMessege.getFieldError('password_check').getDefaultMessage()}
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