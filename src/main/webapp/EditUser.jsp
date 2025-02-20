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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="./adminhub/main.css?version=1">
<title>Edit User</title>
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
</style>
</head>
<body>

	<div class="container px-5">
		<div class=" flex-column  rounded mt-3 mb-2 ">
			<!-- Avatar và tên người dùng -->
			<div class="text-center mb-4">
				<div class="avatar mx-auto mb-3">
					<img src="data:image/jpeg;base64,${user.imageBase64}"
						alt="User Avatar">
				</div>
				<h3 class="fw-bold">${user.firstName}${user.lastName}</h3>
				<p class="text-muted">${user.email}</p>
			</div>
			<form action="/FoodWeb/EditUserController" method="post" id="orderForm"
				class="bg-white rounded" enctype="multipart/form-data">
				<div class="row px-5 pt-4">
					<div class="col-6">
						<label class="form-label">First name</label> 
						<input type="text" id="" class="form-control" value="${user.firstName}" name="firstName"> <span
							class="error">Please enter first name.</span>
					</div>
					<div class="col-6">
						<label class="form-label">Last name</label> <input type="text"
							id="" class="form-control" value="${user.lastName}" name="lastName"> <span
							class="error">Please enter last name.</span>
					</div>
				</div>
				<div class="row px-5 pt-4">
					<div class="col-6">
						<label class="form-label">Date of birth</label> <input type="date"
							id="" class="form-control" value="${user.birthDay}" name="birthDay"> <span
							class="error">Please select a date.</span>
					</div>
					<div class="col-6">
						<label class="form-label">Avatar</label> <input type="file"
							id="" class="form-control" value="" name="avatar"> <span
							class="error">Select Avatar.</span>
					</div>
				</div>
				<div class="row px-5 pt-4">
					<div class="col-6">
						<label class="form-label">Email</label> <input type="email" id=""
							class="form-control" value="${user.email}" name="email"> <span
							class="error">Please enter an email.</span>
					</div>
					<div class="col-6">
						<label class="form-label">Phone number</label> <input type="tel"
							id="" class="form-control" value="${user.phone}" name="phone"> <span
							class="error">Please enter a phone number.</span>
					</div>
				</div>
				<div class="px-5 pt-4">
					<label class="form-label">Address</label> <input type="text" id=""
						class="form-control" value="${user.address}" name="address"> <span
						class="error">Please enter a delivery address.</span>
				</div>
				<div class="row px-5 pt-4">
					<div class="col-6">
						<label class="form-label">Username</label> <input type="text" id=""
							class="form-control" value="${user.username}" name="username"> <span
							class="error">Please enter an username.</span>
					</div>
					<div class="col-6">
						<label class="form-label">Password</label> <input type="text"
							id="" class="form-control" value="${user.password}" name="password"> <span
							class="error">Please enter a password.</span>
					</div>
				</div>
				<div class="d-flex justify-content-between mt-4 px-5 pb-3">
					<button type="submit" class="btn btn-outline-success px-4">
						<i class="bi bi-pencil-square"></i> Submit change
					</button>
					<a href="DetailUserController" class="btn btn-outline-success px-4">
						Back </a>
				</div>
				

			</form>
		</div>
	</div>
	<script>
	document.getElementById('orderForm').addEventListener('submit', function(event) {
	    let isValid = true;
	    const inputs = document.querySelectorAll('input');

	    inputs.forEach(input => {
	        if (!input.value) {
	            console.log(input.name + ' is empty');
	            isValid = false;
	        }
	    });

	    if (!isValid) {
	        event.preventDefault();  // Ngừng gửi form nếu có trường rỗng
	    }
	});

	</script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>