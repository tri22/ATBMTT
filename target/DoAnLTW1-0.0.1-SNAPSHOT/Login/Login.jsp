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
    <title>Login</title>
    <link rel="stylesheet" href="./Login/login-assest/css/login-style.css?version=1">

    <!-- Link css bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <!-- link css boxicons -->
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
</head>
<body style="background: url(./Login/login-assest/img/Background-image.png);background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;">
    <header id="header">
        <div class="contain">
            <h1 class="title">Login Form</h1>

            <form class="formLogin" action="LoginController" method="post">
                <div class="username typeInput">
                    <ion-icon name="person-circle-outline"></ion-icon>
                    <input type="text" name="username" placeholder="Username">
                </div>

                <div class="password typeInput">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password" placeholder="Password">
                </div>

                <div class="forgetPass">
                    <div class="remember">
                        <input type="checkbox">
                        <p>Remember me</p>
                    </div>
                    <p class="forPass">Forgot password ?</p>
                </div>

                <input class="submit" type="submit" value="Login">
            </form>

            <div class="incon or">
                <p>or</p>
            </div>

            <div class="linkTo">
                <button class="facebook">
                    <ion-icon name="logo-facebook"></ion-icon>
                    <p>Facebook</p>
                </button>

                <button class="twitter">
                    <ion-icon name="logo-twitter"></ion-icon>
                    <p>Twitter</p>
                </button>
            </div>
        </div>
    </header>

    <footer id="footer">
        © 2016 Classy Login Form. All rights reserved | Design by <p>@RAT</p>
    </footer>

    <!-- link css icon-icons -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>