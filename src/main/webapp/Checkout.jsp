<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="./checkout-assest/css/checkout.css?version=4">

    <!-- Link css bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link rel="icon" href="./cart-assest/img/head-img/B-ion.jpg">
    <!-- link css boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div id="main">
        <jsp:include page="Header.jsp"></jsp:include>

        <!-- Bắt đầu slider -->
        <div id="slider" style="background: url('./checkout-assest/img/slider-img/img1.jpg');
        background-size: cover;
   	 	background-repeat: no-repeat;
    	background-position: center center;">
            <div class="container">
                <div class="content text-shadow">
                    <div class="content-info">
                        <a href="/Home/Home.html" class="home-card">Home /</a>
                        <p>Products</p>
                    </div>
                    <h1 class="product-header">Products</h1>
                </div>
            </div>
        </div>
        <!-- Kết thúc slider -->

        <div id="billing-detail">
            <div class="container">
                <form action="SendEmailController" method="post">
                    <div class="wrap-bill">
                        <div class="wrap-detail">
                            <h3 class="wrap-detail-heading">Billing Details</h3>
                            <div class="wrap-form">
                                <div class="form-input">
                                    <p>First Name</p>
                                    <input type="text" name="firstName" class="form-control" value="${user.firstName}"
                                        readonly>
                                </div>
                                <div class="form-input">
                                    <p>Last Name</p>
                                    <input type="text" name="lastName" class="form-control" value="${user.lastName}"
                                        readonly>
                                </div>
                                <div class="form-input-2">
                                    <p>Address</p>
                                    <input type="text" name="address" class="form-control" value="${user.address}"
                                        readonly>
                                </div>
                                <div class="form-input-2">
                                    <p>Birthday</p>
                                    <input type="date" name="birthDay" class="form-control" value="${user.birthDay}"
                                        readonly>
                                </div>
                                <div class="form-input">
                                    <p>Gender</p>
                                    <c:if test="${user.gender == true }">
                                        <input type="text" name="gender" class="form-control" value="Female" readonly>
                                    </c:if>
                                    <c:if test="${user.gender == false }">
                                        <input type="text" name="gender" class="form-control" value="Male" readonly>
                                    </c:if>
                                </div>
                                <div class="form-input">
                                    <p>User ID</p>
                                    <input type="text" name="userId" class="form-control" value="${user.userId}"
                                        readonly>
                                </div>
                                <div class="form-input">
                                    <p>Phone</p>
                                    <input type="text" name="phone" class="form-control" value="${user.phone}" readonly>
                                </div>
                                <div class="form-input">
                                    <p>Email</p>
                                    <input type="text" name="email" class="form-control" value="${user.email}" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="wrap-cart">
                            <div class="cart-part2-wrapper">
                                <div class="cart-total checkout">
                                    <h3>Cart total</h3>
                                    <c:forEach items="${listProduct}" var="o">
                                        <p>
                                            <span>${o.name}</span>
                                            <span>
	                                            <fmt:setLocale value="en_US"/>
												<fmt:formatNumber value="${o.cost(o.weight)}" type="currency"/>
                                            </span>
                                        </p>
                                    </c:forEach>

                                    <p class="total-price">
                                        <span>TOTAL</span>
                                        <span>
                                        	<fmt:setLocale value="en_US"/>
											<fmt:formatNumber value="${totalPrice}" type="currency"/>
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div class="payment">
                                <div class="payment-detail">
                                   	<input type="submit" value="Send to Email">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </div>
    <!-- link css icon-icons -->

    <!-- Script -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="./checkout-assest/js/checkout.js?version=2"></script>
</body>

</html>