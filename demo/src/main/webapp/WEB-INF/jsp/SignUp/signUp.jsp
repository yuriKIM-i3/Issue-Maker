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
    <script src="/resources/js/jQuery.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/common.css">
    <title>Issue Maker</title>
  </head>
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
                <div class="col-5 pt-4 bg-secondary text-white rounded mt-5">
                    <h1 class="text-center mb-4">Sign Up</h1>
                    <form action="/signUpOk" method="post">
                        <div class="row my-3 pl-5">
                            <div class="col-3">
                                <label for="email">Email</label>
                            </div>
                            <div class="col-6">
                                <input type="email" name="username" class="form-control" id="email" placeholder="name@example.com">
                            </div>
                            <div class="col-2 text-center">
                                <button type="button" class="btn btn-dark">Check</button>
                            </div>
                        </div>
                        <div class="row my-3 pl-5">
                            <div class="col-3">
                                <label for="name">Name</label>
                            </div>
                            <div class="col-6">
                                <input type="text" name="name" class="form-control" id="name">
                            </div>
                            <div class="col-2 text-center">
                                <button type="button" class="btn btn-dark">Check</button>
                            </div>
                        </div>
                        <div class="row my-3 pl-5">
                            <div class="col-3">
                                <label for="password">password</label>
                            </div>
                            <div class="col-6">
                                <input type="password" name="password" class="form-control" id="password" placeholder="10자이상">
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <div class="row my-3 pl-5">
                            <div class="col-3">
                                <label for="passwordCheck">passwordCheck</label>
                            </div>
                            <div class="col-6">
                                <input type="password" class="form-control" id="passwordCheck">
                            </div>
                            <div class="col-2"></div>
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
        <footer class="page-footer font-small blue pt-4">
            <div class="footer-copyright text-center py-3">© 2019 Copyright:
                <a href="https://github.com/crane93">Yuri Kim</a>
            </div> 
        </footer>
    </body>
</html>