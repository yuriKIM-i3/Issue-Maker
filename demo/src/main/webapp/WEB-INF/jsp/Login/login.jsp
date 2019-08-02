<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <%@ include file="/WEB-INF/jsp/Commonization/html_head.jsp" %>
  <body class="wrap">
    <div class="container">
      <div class="row"><div class="col py-3"></div></div>
      <div class="row justify-content-center">
        <div class="col-5 p-3 bg-secondary text-white rounded mt-5">
          <h1 class="text-center mt-2">Issue Maker</h1>
          <form action="/login" method="POST">
            <div class="form-group">
              <label for="email">Email address</label>              
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
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="row justify-content-center">
              <div class="col-4 text-center">
                <button type="submit" class="btn btn-dark">Sign In</button>
              </div>
              <div class="col-4 text-center">
                <a href="/signUp" role="button" class="btn btn-dark">Sign Up</a>
              </div>
            </div>    
          </form>
          <div class="row">
            <div class="col pt-2">
              <%-- <a href="#" class="text-decoration-none text-light">Forgot Password?</a> --%>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>