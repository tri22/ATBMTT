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
    <link rel="stylesheet" href="./cart-assest/css/cart-style.css?version=3">

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
	
	                                <td class="product-price">$${o.price}</td>
	
	                                <td class="product-quantity">
	                                    <div class="count">
									        <div class="minus">
									            <button class="btn-minus" type="button">
									                <i class='bx bx-minus'></i>
									            </button>
									        </div>
									
									        <input type="number" name="weight" id="quantity" class="quantity-form" value="${o.weight}" min="1">
									
									        <div class="plus">
									            <button class="btn-plus" type="button">
									                <i class='bx bx-plus'></i>
									            </button>
									        </div>
									    </div>
									    
									    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
										<script type="text/javascript">
											$(document).ready(function () {
										        // Sử dụng class thay vì ID cho ô trọng lượng và thẻ button
										        $(".btn-plus").on("click", function () {
										            updateQuantity(this, "inc");
										        });
	
										        $(".btn-minus").on("click", function () {
										            updateQuantity(this, "dec");
										        });
	
										        function updateQuantity(btn, action) {
										            var $row = $(btn).closest("tr");
										            var currentQuantity = parseInt($row.find(".quantity-form").val(), 10);
										            var productId = $row.data("product-id");
	
										            // Sử dụng AJAX để gửi yêu cầu đến servlet
										            $.ajax({
										                type: "GET",
										                url: "IncDecButton",
										                data: {
										                    currentQuantity: currentQuantity,
										                    action: action
										                },
										                success: function (newQuantity) {
										                    // Cập nhật số lượng trên trang
										                    $row.find(".quantity-form").val(newQuantity);
										                    
										                    // Cập nhật giá trị của ô "Total"
										                    var price = parseFloat($row.find(".product-price").text().substring(1));
										                    var newTotal = newQuantity * price;
										                    $row.find(".product-total").text("$" + newTotal.toFixed(2));
										                },
										                error: function () {
										                    console.error("Error updating quantity");
										                }
										            });
										        }
										    });
										</script>
	                                </td>
	                                
	                                <td class="product-total">
	                                	$${o.cost(o.weight)}
	                                </td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="content-cart-part2">
                    <div class="cart-part2-wrapper">
                        <div class="cart-total">
                            <h3>Coupon Code</h3>
                            <p>Enter your coupon code if you have one</p>
                            <form action="info">
                                <div class="info-form">
                                    <p>Coupon code</p>
                                    <input type="text" class="info-form-input">
                                </div>
                            </form>
                        </div>

                        <a href="" class="button-apply">Apply Coupon</a>
                    </div>

                    <div class="cart-part2-wrapper">
                        <div class="cart-total">
                            <h3>Estimate shipping and tax</h3>
                            <p>Enter your destination to get a shipping estimate</p>
                            <form action="#" class="info">
                                <div class="info-form">
                                    <p>Country</p>
                                    <input type="text" class="info-form-input">
                                </div>

                                <div class="info-form">
                                    <p>State/Province</p>
                                    <input type="text" class="info-form-input">
                                </div>

                                <div class="info-form">
                                    <p>Zip/Postal Code</p>
                                    <input type="text" class="info-form-input">
                                </div>

                            </form>
                        </div>

                        <a href="" class="button-apply">Estimate</a>
                    </div>

                    <div class="cart-part2-wrapper">
                        <div class="cart-total checkout">
                            <h3>Cart total</h3>
                            <p>
                                <span>Subtotal</span>
                                <span>$20.60</span>
                            </p>

                            <p>
                                <span>Delivery</span>
                                <span>$0.00</span>
                            </p>

                            <p>
                                <span>Discount</span>
                                <span>$3.00</span>
                            </p>

                            <p class="total-price">
                                <span>TOTAL</span>
                                <span>$17.60</span>
                            </p>

                        </div>

                        <a href="" class="button-apply">Proceed to Checkout</a>
                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <!---------------------------------- END FooterFooter ---------------------------------->
    </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="./cart-assest/js/cart-jquery.js?version=1"></script>
</body>
</html>