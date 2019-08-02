<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <%@ include file="/WEB-INF/jsp/Commonization/html_head.jsp" %> 
    <body class="wrap">
        <header> 
            <nav class="navbar header">
                <a class="navbar-brand font_C_white" href="/index">Issue Maker</a>            
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
            <form action="/modify_apply_pass" method="POST">                                
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