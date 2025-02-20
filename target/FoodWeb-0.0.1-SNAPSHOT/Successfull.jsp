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
    <title>Order Successful</title>
</head>
<body>
    <h2>Your order has been placed successfully!</h2>
    
    <!-- Display user and order details -->
    <c:forEach var="product" items="${listProduct}">
        <p>${product.name}: 
	        <fmt:setLocale value="en_US"/>
			<fmt:formatNumber value="${product.cost(product.weight)}" type="currency"/>
        </p>
    </c:forEach>
    
    <p>Total price: 
    	<fmt:setLocale value="en_US"/>
		<fmt:formatNumber value="${totalPrice}" type="currency"/>
    </p>
    
    <!-- Add other user details as needed -->
    <p>User ID: ${user.userId}</p>
    <p>Name: ${user.firstName} ${user.lastName}</p>
    <p>Address: ${user.address}</p>
    <p>Birthday: ${user.birthDay}</p>
    <p>Gender: ${user.gender}</p>
    <p>Phone Number: ${user.phone}</p>
    <!-- Add more user details as needed -->
    
    <!-- Add a button to redirect to HomeController -->
    <form action="HomeController" method="GET">
        <input type="submit" value="Back to Home">
    </form>
</body>
</html>