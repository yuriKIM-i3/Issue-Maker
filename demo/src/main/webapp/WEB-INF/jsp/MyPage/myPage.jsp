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
            <div class="row justify-content-center mt-4 py-2">
                <div class="col-2">
                    <label for="Email">Email</label>
                </div>
                <div class="col-3">
                    <h4>${account.username}</h4>
                </div>                
            </div>
            <div class="row justify-content-center py-2">
                <div class="col-2">
                    <label for="name">Name</label>
                </div>
                <div class="col-3">
                    <h4>${account.name}</h4>
                </div>
            </div>
            <div class="row justify-content-center py-2">
                <div class="col-2">
                    <label for="create_at">Date of account opening</label>
                </div>
                <div class="col-3">
                    <h4>${account.create_at.substring(0,10)}</h4>
                </div>
            </div>            
            <div class="row justify-content-center py-2 mt-4">
                <div class="col-2 text-center">
                    <a class="btn btn-dark" href="/myPage_modify_name">Change Name</a>                  
                </div>
                <div class="col-2 text-center">
                    <a class="btn btn-dark" href="/myPage_modify_pass">Change Password</a>                  
                </div>           
                
                    <div class="col-2 text-center">                    
                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#confirmDelete">Close Account</button>                    
                    </div>
                    <!-- Modal -->
                    <form action="/delete_account" method="get"> 
                    <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Close Account</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-left">
                                    Are you sure to be closed?<br>                                
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" >Yes</button>
                                    <button type="button" class="btn btn-outline-secondary">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form> 
            </div> 
        </div>
        <footer class="page-footer font-small blue pt-4">
            <div class="footer-copyright text-center py-3">© 2019 Copyright:
                <a href="https://github.com/crane93">Yuri Kim</a>
            </div> 
        </footer>
    </body>
</html>