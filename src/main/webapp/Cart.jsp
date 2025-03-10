<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<link rel="stylesheet" href="./cart-assest/css/cart-style.css?version=4">

<!-- Link css bootstrap-icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

<!-- link css boxicons -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="icon" href="./cart-assest/img/head-img/B-ion.jpg">

</head>
<body>
	<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- Bắt đầu slider -->
		<c:forEach items="${sliderImages}" var="img">
			<c:choose>
				<c:when test="${fn:contains(img.name, 'slider-img-1')}">
					<div id="slider"
						style="background: url('data:image/jpeg;base64,${img.imageBase64}') no-repeat center center; background-size: cover; height: 400px;">
						<div class="container">
							<div class="subnav">
								<div class="content">
									<div class="content-info">
										<a href="" class="home-card">Home/ </a>
										<p>Cart</p>
									</div>
									<h1 class="product-header">My Cart</h1>
								</div>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
		<!-- Kết thúc slider -->

		<div id="cart-content">
			<div class="container">
				<!-- class cart list khi css thì thêm overflow-x = scroll vào để khỏi cần tạo thêm class bên dưới như mẫu -->
				<div class="content-cart-part1">
					<table class="table  text-center align-middle" >
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

						<tbody class="table-body">
							<c:forEach items="${cartItems}" var="item">
								<tr>
									<!-- Xóa sản phẩm -->
									<td class="product-remove"><a
										href="DeleteCartController?id=${item.product.id}"
										onclick="deleteCart()"> <i class="bi-x"></i>
									</a></td>

									<!-- Hình ảnh sản phẩm -->
									<td >
									<a href="SingleController?id=${o.id}"> <img
										src="data:image/jpeg;base64,${item.product.imageBase64}" alt="${item.product.name}"
										style="height: 100px" />
									</a>
									</td>

									<!-- Tên sản phẩm -->
									<td class="product-name">
										<h3>${item.product.name}</h3>
									</td>

									<!-- Giá sản phẩm -->
									<td class="product-price"><fmt:setLocale value="en_US" />
										<fmt:formatNumber value="${item.product.price}"
											type="currency" /></td>

									<!-- Số lượng sản phẩm -->
									<td class="product-quantity">
										<div class="quantity-wrapper">
											<input id="quantity-edit-${index}" type="number"
												name="weight" class="quantity-form" value="${item.weight}" min="1">
											<button type="button" class="btn-update"
												data-id="${item.product.id}">
												<i class="bi bi-check"></i>
											</button>
										</div>
									</td>



									<!-- Tổng tiền -->
									<td class="product-total"><fmt:setLocale value="en_US" />
										<fmt:formatNumber
											value="${item.weight * item.product.price}"
											type="currency" /></td>
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
									<input type="text" class="info-form-input" name="firstName"
										value="${user.firstName}" readonly>
								</div>
								<div class="info-form">
									<p>Last name</p>
									<input type="text" class="info-form-input" name="lastName"
										value="${user.lastName}" readonly>
								</div>
								<div class="info-form">
									<p>Birthday</p>
									<input type="date" class="info-form-input" name="birthDay"
										value="${user.birthDay}" readonly>
								</div>
							</div>
						</div>

						<div class="cart-part2-wrapper">
							<div class="cart-total">
								<h3>Information User</h3>
								<div class="info-form">
									<p>Address</p>
									<input type="text" class="info-form-input" name="address"
										value="${user.address}" readonly>
								</div>

								<div class="info-form">
									<p>Email</p>
									<input type="email" class="info-form-input" name="email"
										value="${user.email}" readonly>
								</div>

								<div class="info-form">
									<p>Phone</p>
									<input type="tel" class="info-form-input" name="phone"
										value="${user.phone}" readonly>
								</div>
							</div>

							<a href="EditUserController" class="button-apply">Edit User's
								Information</a>
						</div>

						<div class="cart-part2-wrapper">
							<div class="cart-total checkout">
								<h3>Cart total</h3>
								<c:forEach items="${listProduct}" var="o">
									<p>
										<span>${o.name}</span> <span> <fmt:setLocale
												value="en_US" /> <fmt:formatNumber
												value="${o.cost(o.weight)}" type="currency" />
										</span>
									</p>
								</c:forEach>

								<p class="total-price">
									<span>TOTAL</span> <span> <fmt:setLocale value="en_US" />
										<fmt:formatNumber value="${totalPrice}" type="currency" />
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
	<script>
	$(document).ready(function () {
	    $(".btn-update").off("click").on("click", function () {
	        let productId = $(this).data("id");
	        let index = $(this).data("index"); // Lấy chỉ số của sản phẩm
	        let quantityInput = $(`#quantity-edit-${index}`); // Chọn input theo index
	        let newQuantity = parseInt(quantityInput.val());
			console.log(newQuantity)

	        if (quantityInput.length === 0) {
	            alert(`❌ Không tìm thấy input `);
	            return;
	        }

	        
	        if (isNaN(newQuantity) || newQuantity < 1) {
	            alert("❌ Số lượng không hợp lệ! Vui lòng nhập số hợp lệ.");
	            return;
	        }

	        $.ajax({
	            type: "POST",
	            url: "CartController",
	            data: { productId: productId, quantity: newQuantity },
	            dataType: "json",
	            success: function (response) {
	                console.log("AJAX Response:", response);
	                if (response.status === "success") {
	                    alert("✅ Cập nhật giỏ hàng thành công!");
	                } else {
	                    alert(response.message);
	                }
	            },
	            error: function () {
	                alert("❌ Có lỗi xảy ra, vui lòng thử lại!");
	            }
	        });
	    });
	});

</script>
	<script src="./cart-assest/js/cart-jquery.js?version=1"></script>
</body>
</html>