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
    <title>Single Product</title>
    <link rel="icon" href="./singleProduct-assest/img/head-img/B-ion.jpg">
    <link rel="stylesheet" href="./singleProduct-assest/css/singleProduct.css?version=5">

    <!-- Link css bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <!-- link css boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div id="main">
    	<jsp:include page="Header.jsp"></jsp:include>
        <!-- Bắt đầu slider -->
        <div id="slider">
            <div class="container">
                <div class="content text-shadow">
                    <div class="content-info">
                        <a href="/Home/Home.html" class="home-card">Home </a>
                        <p>Sing</p>
                    </div>
                    <h1 class="product-header">Product Single</h1>
                </div>
            </div>
        </div>
        <!-- Kết thúc slider -->

        <!-- Bắt đầu phần product -->
        <div id="product">
            <div class="container">
                <div class="wrap">
                    <img src="${product.imageUrl}" alt="">

                    <div class="detail">
                        <h3>${product.name}</h3>

                        <p class="price">$${product.price}</p>

                        <p class="content">${product.content}</p>

                        <form id="addToCartForm" action="AddCartController" method="post">
						    <div class="option">
						        <div class="count">
						            <div class="minus">
						                <button class="btn-minus" type="button">
						                    <i class='bx bx-minus'></i>
						                </button>
						            </div>
						
						            <input type="number" id="quantity" name="weight" value="1" min="1" max="${product.weight}">
						
						            <div class="plus">
						                <button class="btn-plus" type="button">
						                    <i class='bx bx-plus'></i>
						                </button>
						            </div>
						        </div>
						        
								<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
								<script>
								    $(document).ready(function () {
								        // Increase quantity
								        $(".btn-plus").on("click", function () {
								            updateQuantity("inc");
								        });
								
								        // Decrease quantity
								        $(".btn-minus").on("click", function () {
								            updateQuantity("dec");
								        });
								
								        function updateQuantity(action) {
								            var currentQuantity = parseInt($("#quantity").val(), 10);
								
								            // Use AJAX to send a request to the InDecController servlet
								            $.ajax({
								                type: "GET",
								                url: "IncDecButton",
								                data: {
								                    currentQuantity: currentQuantity,
								                    action: action
								                },
								                success: function (newQuantity) {
								                    // Update the quantity on the page
								                    $("#quantity").val(newQuantity);
								                },
								                error: function () {
								                    // Handle error if needed
								                    console.error("Error updating quantity");
								                }
								            });
								        }
								    });
								</script>
						
						        <c:if test="${product.weight == 0}">
						            <div class="out-of-stock">Out Of Stock</div>
						        </c:if>
						
						        <c:if test="${product.weight != 0}">
						            <div class="weight">${product.weight} kg</div>
						        </c:if>
						    </div>
						
						    <c:if test="${product.weight != 0}">
						        <c:if test="${account == null}">
								    <a href="" class="addToCart">Add to Cart</a>
								</c:if>
								
								<c:if test="${account != null && !account.isAdmin}">
								    <c:if test="${product.weight != 0}">
								        <button class="addToCartBtn" type="submit" onclick="checkWeight()">Add to Cart</button>
								    </c:if>
								</c:if>
								
								<c:if test="${account != null && account.isAdmin}">
								    <div class="adminMessage">Admin users cannot add items to the cart.</div>
								</c:if>
						    </c:if>
						</form>
						
						<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
						<script>
							// Báo lỗi nếu số lượng vượt quá weight của product
						    function checkWeight() {
						    	// Lấy giá trị của số lượng từ input
						        var quantity = parseInt($("#quantity").val(), 10);
						        
						        // Kiểm tra điều kiện (quantity <= product.weight)
						        if (quantity <= ${product.weight}) {
						            var productId = "${product.id}";
						            var url = "AddCartController?id=" + productId;

						            // Gán giá trị URL mới cho thuộc tính action của form
						            $("#addToCartForm").attr("action", url);

						            // Submit form
						            $("#addToCartForm").submit();
						        } else {
						            // Hiển thị thông báo hoặc xử lý khác nếu điều kiện không đáp ứng
						            alert("Số lượng không được lớn hơn weight = " + ${product.weight});
						        }
						    }
						</script>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc phần product -->

       	<jsp:include page="Footer.jsp"></jsp:include>
    </div>

    <!-- link css icon-icons -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!-- Script -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="./singleProduct-assest/js/singleProduct.js?version=3"></script>
</body>

</html>