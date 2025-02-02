<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link rel="stylesheet" href="./login-assest/css/login-style.css?version=3">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
</head>
<body>
    <div id="logreg-forms">
        <form class="form-signin" action="LoginController" method="post">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>

            <p class="text-danger" >${loginError}</p>
			
            <input name="username" value="${username}" type="text" required id="inputEmail" class="form-control" placeholder="Username">
            <input name="password" value="${password}" type="password" required id="inputPassword" class="form-control" placeholder="Password">

            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
            <input type="checkbox" name="remember"> Remember me
            <hr>
            <!-- <p>Don't have an account!</p>  -->
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>
                Sign up New Account</button>
        </form>

        <form action="SignupController" class="form-signup" method="post">
            <input name="username" type="text" required id="user-email"class="form-control" placeholder="Username">
            <input name="password" type="password" required id="user-pass" class="form-control" placeholder="Password">
            <input name="rePassword" type="password" required id="user-repeatpass" class="form-control"
                placeholder="Repeat Password">

            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
            <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
        </form>
        <br>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="./login-assest/js/login.js?version=3"></script>
</body>
</html>