<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
    <%@ include file="/WEB-INF/jsp/Commonization/html_head.jsp" %>
    <body class="wrap">    
        <header> 
            <nav class="navbar header">
                <a class="navbar-brand font_C_white" href="/index">Issue Maker</a>            
                <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/login">로그인</a>            
            </nav>
        </header>
        <div class="container-fluid">
            <div class="row"><div class="col py-3"></div></div>
            <div class="row justify-content-center">
                <div class="col-5 pt-4 rounded mt-5">
                    <h1 class="text-center mb-4">Sign Up</h1>
                    <form action="/signUp_check" method="post" class="my-5">
                        <div class="row my-3 pl-5 justify-content-center">
                            <div class="col-3">
                                <label for="email">Email</label>
                            </div>
                            <div class="col-6">                                
                                <c:choose>
                                    <c:when test="${(empty errorMessege.hasFieldErrors('username')) or (errorMessege.hasFieldErrors('username')==false && errorMessege.hasErrors()==true)}">
                                        <input type="text" class="form-control" name="username" value="${errorMessege.getFieldValue('username')}" id="email" placeholder="name@example.com">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control is-invalid" name="username" value="${errorMessege.getFieldValue('username')}" id="email" placeholder="name@example.com">
                                        <div class="invalid-feedback">
                                            ${errorMessege.getFieldError('username').getDefaultMessage()}
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>                        
                        </div>
                        <div class="row my-3 pl-5 justify-content-center">
                            <div class="col-3">
                                <label for="name">Name</label>
                            </div>
                            <div class="col-6">
                            <c:choose>
                                <c:when test="${(empty errorMessege.hasFieldErrors('name')) or (errorMessege.hasFieldErrors('name')==false && errorMessege.hasErrors()==true)}">                                    
                                    <input type="text" class="form-control" name="name" value="${errorMessege.getFieldValue('name')}" id="name">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="form-control is-invalid" name="name" value="${errorMessege.getFieldValue('name')}">
                                    <div class="invalid-feedback">
                                        ${errorMessege.getFieldError('name').getDefaultMessage()}
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            </div>                           
                        </div>
                        <div class="row my-3 pl-5 justify-content-center">
                            <div class="col-3">
                                <label for="password">password</label>
                            </div>
                            <div class="col-6">
                                <c:choose>
                                    <c:when test="${(empty errorMessege.hasFieldErrors('password')) or (errorMessege.hasFieldErrors('password')==false && errorMessege.hasErrors()==true)}">
                                        <input type="password" class="form-control" name="password" id="password" placeholder="10자이상">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="password" class="form-control is-invalid" name="password" id="password" placeholder="10자이상">
                                        <div class="invalid-feedback">
                                            ${errorMessege.getFieldError('password').getDefaultMessage()}
                                        </div>
                                    </c:otherwise>
                                </c:choose>              
                            </div>                                                       
                        </div>
                        <div class="row my-3 pl-5 justify-content-center">
                            <div class="col-3">
                                <label for="password_check">passwordCheck</label>
                            </div>
                            <div class="col-6">
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
                        <div class="row my-3 justify-content-center">
                            <div class="col-3 text-center">
                                <button type="submit" class="btn btn-dark">Sign Up</button>
                            </div>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/jsp/Commonization/html_footer.jsp" %>        
    </body>
</html>