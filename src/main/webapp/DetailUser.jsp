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
    <link rel="stylesheet" href="./adminhub/css/style.css?version=1">
    <title>Detail User</title>
</head>
<body>
	<form action="HomeController" method="post" class="container border ">
        <div class="text-center">
            <h3>Detail User</h3>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">ID User</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="userId" value="${user.userId}" aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">First Name</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="firstName" value="${user.firstName}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Last Name</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="lastName" value="${user.lastName}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Birth Day </label>
            </div>
            <div class="col-auto">
                <input type="date" class="form-control" name="birthDay" value="${user.birthDay}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
		    <div class="col-auto">
		        <label class="col-form-label width-100">Gender</label>
		    </div>
		    <div class="col-auto">
		        <select class="form-control" name="gender" disabled aria-describedby="passwordHelpInline">
		            <c:choose>
		                <c:when test="${user.gender == 'Male'}">
		                    <option value="Male" selected>Male</option>
		                    <option value="Female">Female</option>
		                </c:when>
		                <c:otherwise>
		                    <option value="Male">Male</option>
		                    <option value="Female" selected>Female</option>
		                </c:otherwise>
		            </c:choose>
		        </select>
		    </div>
		</div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Address</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="address" value="${user.address}" readonly aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Email</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="email" value="${user.email}" readonly aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Phone</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="phone" value="${user.phone}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <input type="submit" value="Home" class="bg-lightgreen no-border rounded p-1 px-2 ">
            </div>
            <div class="col-auto">
            	<a href="EditUserController?accId=${user.getAccount().accId}">
	                <input type="button" value="Edit user" class="bg-lightgreen no-border rounded p-1 px-2 ">
            	</a>
            </div>
        </div>
    </form>
</body>
</html>