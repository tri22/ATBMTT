<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./shop-assest/img/head-img/B-ion.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="./adminhub/main.css?version=1">
    <title>Detail User</title>
    <style>
        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid #82ae46;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .form-control:read-only {
            background-color: #e9ecef;
        }

    </style>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>

    <!-- Container chính -->
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <!-- Card chứa thông tin người dùng -->
                <div class="card p-4">
                    <!-- Avatar và tên người dùng -->
                    <div class="text-center mb-4">
                        <div class="avatar mx-auto mb-3">
                            <img src="data:image/jpeg;base64,${user.imageBase64}" alt="User Avatar">
                        </div>
                        <h3 class="fw-bold">${user.firstName} ${user.lastName}</h3>
                        <p class="text-muted">${user.email}</p>
                    </div>

                    <!-- Form chi tiết người dùng -->
                    <form action=DetailUserController method="post">

                        <div class="mb-3">
                            <label class="form-label fw-bold">First Name</label>
                            <input type="text" class="form-control" name="firstName" value="${user.firstName}" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Last Name</label>
                            <input type="text" class="form-control" name="lastName" value="${user.lastName}" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Birth Day</label>
                            <input type="date" class="form-control" name="birthDay" value="${user.birthDay}" readonly>
                        </div>
   
                        <div class="mb-3">
                            <label class="form-label fw-bold">Address</label>
                            <input type="text" class="form-control" name="address" value="${user.address}" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Phone</label>
                            <input type="text" class="form-control" name="phone" value="${user.phone}" readonly>
                        </div>

                        <!-- Nút hành động -->
                        <div class="d-flex justify-content-between mt-4">
                            <a href="EditUserController" class="btn btn-outline-danger px-4">
                                Logout
                            </a>
                            <a href="EditUserController" class="btn btn-outline-success px-4">
                                Edit profile
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
