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
    <title>Cart</title>
    <link rel="stylesheet" href="./cart-assest/css/cart-style.css?version=4">

    <!-- Link css bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <!-- link css boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" href="./cart-assest/img/head-img/B-ion.jpg">

</head>
<body>
<div id="main">
        <jsp:include page="Header.jsp"></jsp:include>
        <!-- Bắt đầu slider -->
        <div id="slider" style="background: url('./cart-assest/img/slider-img/img1.jpg');
        background-size: cover;
   	 	background-repeat: no-repeat;
    	background-position: center center;">
            <div class="container">
                <div class="subnav">
                    <div class="content">
                        <div class="content-info">
                            <a href="" class="home-card">Home</a>
                            <p>Cart</p>
                        </div>
                        <h1 class="product-header">My Cart</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc slider -->

        <div id="cart-content">
            <div class="container">
                <!-- class cart list khi css thì thêm overflow-x = scroll vào để khỏi cần tạo thêm class bên dưới như mẫu -->
                <div class="content-cart-part1">
                    <table class="table">
                        <thead class="table-head">
                            <tr>
                                <th>&nbsp</th>
                                <th>&nbsp</th>
                                <th>Produce name</th>
                                <th>Price</th>
                                <th>Weight</th>
                                <th>Total</th>
                            </tr>
                        </thead>

                        <tbody class=table-body>
                        	<c:forEach items="${listProduct}" var="o">
	                            <tr>
	                                <td class="product-remove">
	                                    <a href="DeleteCartController?id=${o.id}" onclick="deleteCart()">
	                                        <i class="bi-x"></i>
	                                    </a>
		                               	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
										<script type="text/javascript">
		                                </script>
	                                </td>
	                                
	                                <td class="product-image">
	                                    <a href="SingleController?id=${o.id}"><img src="${o.imageUrl}" alt=""></a>
	                                </td>
	
	                                <td class="product-name">
	                                    <h3>${o.name}</h3>
	                                    <p>${o.content}</p>
	                                </td>
	
	                                <td class="product-price">
		                                <fmt:setLocale value="en_US"/>
										<fmt:formatNumber value="${o.price}" type="currency"/>
	                                </td>
	
	                                <td class="product-quantity">
	                                    <div class="count">
									        <input type="number" name="weight" id="quantity" class="quantity-form" value="${o.weight}" min="1" disabled>
									    </div>
	                                </td>
	                                
	                                <td class="product-total">
	                                	<fmt:setLocale value="en_US"/>
										<fmt:formatNumber value="${o.cost(o.weight)}" type="currency"/>
	                                </td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
				
				<form action="CheckoutController" method="post">
	                <div class="content-cart-part2">
	                    <div class="cart-part2-wrapper">
	                        <div class="cart-total">
	                            <h3>Information User</h3>
	                            <div class="info-form">
								    <p>First name</p>
								    <input type="text" class="info-form-input" name="firstName" value="${user.firstName}" readonly>
								</div>
								<div class="info-form">
								    <p>Last name</p>
								    <input type="text" class="info-form-input" name="lastName" value="${user.lastName}" readonly>
								</div>
								<div class="info-form">
								    <p>Birthday</p>
								    <input type="date" class="info-form-input" name="birthDay" value="${user.birthDay}" readonly>
								</div>
								<div class="info-form">
								    <p>Gender</p>
								    <c:if test="${user.gender == false}">
									    <input type="text" class="info-form-input" name="gender" value="Male" readonly>
								    </c:if>
								    <c:if test="${user.gender == true}">
									    <input type="text" class="info-form-input" name="gender" value="Female" readonly>
								    </c:if>
								</div>
	                        </div>
	                    </div>
	
	                    <div class="cart-part2-wrapper">
	                        <div class="cart-total">
							    <h3>Information User</h3>
							    <div class="info-form">
							        <p>Address</p>
							        <input type="text" class="info-form-input" name="address" value="${user.address}" readonly>
							    </div>
							
							    <div class="info-form">
							        <p>Email</p>
							        <input type="email" class="info-form-input" name="email" value="${user.email}" readonly>
							    </div>
							
							    <div class="info-form">
							        <p>Phone</p>
							        <input type="number" class="info-form-input" name="phone" value="${user.phone}" readonly>
							    </div>
							</div>
	
	                        <a href="EditUserController" class="button-apply">Edit User's Information</a>
	                    </div>
	
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
	                       	
	                       	<input type="submit" value="Checkout" class="button-apply">
	                   	</div>
	                </div>
                </form>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="./cart-assest/js/cart-jquery.js?version=1"></script>
</body>
</html>