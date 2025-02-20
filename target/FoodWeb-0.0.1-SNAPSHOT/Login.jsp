<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link rel="stylesheet" href="./login-assest/css/login-style.css?version=3">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <style>
        .text-danger {
            color: #ff4d4d;
            font-weight: bold;
            text-align: center;
        }
        .form-signup {
            display: none;
        }
    </style>
</head>
<body>
    <div id="logreg-forms">
        <!-- Form Đăng nhập -->
        <form class="form-signin" action="LoginController" method="post">
            <h1 class="h3 mb-3 font-weight-normal text-center">Sign in</h1>

            <!-- Hiển thị lỗi đăng nhập nếu có -->
            <c:if test="${not empty loginError}">
                <p class="text-danger">${loginError}</p>
            </c:if>
            
            <!-- Input username và password -->
            <input name="username" value="${username}" type="text" required class="form-control mb-2" placeholder="Username">
            <input name="password" value="${password}" type="password" required class="form-control mb-2" placeholder="Password">

            <!-- Nút đăng nhập -->
            <button class="btn btn-success btn-block" type="submit">
                <i class="fas fa-sign-in-alt"></i> Sign in
            </button>

            <!-- Checkbox Remember Me -->
            <div class="form-check mt-2">
                <input type="checkbox" class="form-check-input mt-2" name="remember" 
                       <c:if test="${not empty username}">checked</c:if> >
                <label class="form-check-label">Remember me</label>
            </div>

            <hr>

            <!-- Nút chuyển sang form đăng ký -->
            <button class="btn btn-primary btn-block" type="button" id="btn-signup">
                <i class="fas fa-user-plus"></i> Sign up New Account
            </button>
        </form>

        <!-- Form Đăng ký -->
        <form action="SignupController" class="form-signup" method="post">
            <h1 class="h3 mb-3 font-weight-normal text-center">Sign up</h1>

            <input name="username" type="text" required class="form-control mb-2" placeholder="Username">
            <input name="password" type="password" required class="form-control mb-2" placeholder="Password">
            <input name="rePassword" type="password" required class="form-control mb-2" placeholder="Repeat Password">

            <button class="btn btn-primary btn-block" type="submit">
                <i class="fas fa-user-plus"></i> Sign Up
            </button>

            <!-- Nút quay lại form đăng nhập -->
            <a href="#" id="cancel_signup" class="btn btn-link mt-2">
                <i class="fas fa-angle-left"></i> Back to Sign in
            </a>
        </form>
    </div>

    <!-- Thư viện và script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        // Chuyển đổi giữa form đăng nhập và đăng ký
        $(document).ready(function() {
            $('#btn-signup').click(function() {
                $('.form-signin').hide();
                $('.form-signup').fadeIn();
            });
            $('#cancel_signup').click(function(e) {
                e.preventDefault();
                $('.form-signup').hide();
                $('.form-signin').fadeIn();
            });
        });
    </script>
</body>
</html>
