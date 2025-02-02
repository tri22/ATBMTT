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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./adminhub/main.css?version=1">
    <title>Edit User</title>
</head>
<body>

	<div class="container" >
            <div class=" flex-column  rounded mt-3 mb-2 ">
                <nav aria-label="breadcrumb pb-5" style="background-color: #edf2f9; margin: 0 -12px;">
                    <ol class="breadcrumb mb-0" style="padding: 25px;">
                        <li class="breadcrumb-item active bold-text font-25" aria-current="page" >
                            <a class="text-decoration-none" href="Home.jsp">Home</a>
                            <a class="text-decoration-none" href="EditUser.jsp">/ Edit User</a>
                        </li>
                    </ol>
                </nav>
                <form action="EditUserController"  method="post" id="orderForm"  class="bg-white rounded" enctype="multipart/form-data">
                    <div class="row px-5 pt-4">
                        <div class="col-6">
                            <label class="form-label">First name</label>
                            <input type="text" id="" class="form-control" value="${user.firstName}">
                            <span class="error">Please enter first name.</span>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Last name</label>
                            <input type="text" id="" class="form-control" value="${user.lastName}">
                            <span class="error">Please enter last name.</span>
                        </div>
                    </div>
                    <div class="row px-5 pt-4">
                        <div class="col-6">
                            <label class="form-label">Date of birth</label>
                            <input type="date" id="" class="form-control" value="${user.birthDay}">
                            <span class="error">Please select a date.</span>
                        </div>
                        <div class="col-6">
                            <label>Gender:</label>
            				<select>
                					<option value="1" selected>Male</option>
                					<option value="0">FeMale</option>
            				</select>
            				<span class="error">Please select a gender.</span>
                        </div>
                    </div>
                    <div class="row px-5 pt-4">
                        <div class="col-6">
                            <label class="form-label">Email</label>
                            <input type="email" id="" class="form-control" value="${user.email}">
                            <span class="error">Please enter an email.</span>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Phone number</label>
                            <input type="tel" id="" class="form-control" value="${user.phone}" >
                            <span class="error">Please enter a phone number.</span>
                        </div>
                    </div>
                    <div class="px-5 pt-4">
                        <label class="form-label">Address</label>
                        <input type="text" id="" class="form-control" value="${user.address}">
                        <span class="error">Please enter a delivery address.</span>
                    </div>
                    <div class="px-5 py-4">
                        <input type="submit" id="submitAddBtn" class="form-control" style="background-color: #2c7be5;">
                    </div>
                    <div id="addModal" class="modal">
                        <div class="modal-content" >
                            <div class="row">
                                <p class="col-10 align-self-center pl-0">Are you sure you want to change this?</p>
                                <span class="close col-2 mb-3 pl-0" style="margin-left: -15px;">&times;</span>
                            </div>
                            <button class="modalCancel">Cancel</button>
                            <button class="modalSubmit">Submit</button>
                        </div>
                    </div>

        	</form>
            </div>
            </div>
	<script>
	document.getElementById('orderForm').addEventListener('submit', function(event) {
	    let isValid = true;
	    const inputs = document.querySelectorAll('input, select');

	    inputs.forEach(input => {
	        if (!input.checkValidity()) {
	            isValid = false;
	        }
	    });

	    if (!isValid) {
	        event.preventDefault();
	    }
	});
	</script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>