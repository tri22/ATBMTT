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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<style>
.bg-light-green {
	background-color: #82ae46 !important;
}

/* topbar */
.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 576px) {
	.container {
		max-width: 540px;
	}
}

@media ( min-width : 768px) {
	.container {
		max-width: 720px;
	}
	#header1 .container-head1 .inf {
		flex-basis: 0;
		flex-grow: 1;
	}
}

@media ( min-width : 992px) {
	.container {
		max-width: 960px;
	}
}

@media ( min-width : 1200px) {
	.container {
		max-width: 1140px;
	}
}

.topbar {
	padding-right: 15px;
	padding-left: 15px;
	display: flex !important;
	margin-right: -30px;
	margin-left: -30px;
}

.topbar .inf {
	font-size: 10px;
	letter-spacing: 1px;
	padding-right: 24px;
	align-items: center;
	display: flex;
	width: 100%;
	padding-left: 15px;
}

@media ( max-width : 768px) {
	.topbar .inf {
		margin-bottom: 10px;
	}
	.topbar {
		display: flex;
		flex-wrap: wrap;
	}
}

.topbar .inf .head1-icon {
	margin-right: 0.5rem;
	color: #fff;
}

/* Kết thức topbar */

/* Bắt đầu header */
/* xử lí script */
#header.sticky {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 2;
	margin-top: -130px;
	background: #fff;
	box-shadow: 0 0 10px 0 rgb(0 0 0/ 10%);
}

#header.sticky.visible {
	transition: 0.3s all ease;
	margin-top: 0;
}

#header.sticky .brofoods {
	color: #000;
}

#header.sticky.visible .list-head2 .list-item-head2 .nav-link {
	padding-top: 14px;
	padding-bottom: 14px;
}

#header.sticky.visible .list-head2 .list-item-head2 .nav-link {
	padding-top: 14px;
	padding-bottom: 14px;
}

#header.sticky.visible .list-head2 .list-item-head2 .nav-link.shop {
	color: #82ae46;
}

#header.sticky.visible .list-head2 .list-item-head2 .nav-link.icon-cart
	{
	background-color: #82ae46;
	color: #fff;
}




@media ( max-width : 992px) {
	#header.sticky.visible button {
		outline: none;
		color: gray;
	}
	#header.sticky.visible .list-head2 .list-item-head2 .nav-link {
		color: #000;
	}
}

/* end script */
#header>.container {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
}

#header .brofoods {
	color: #82ae46;
	font-weight: 800;
	text-transform: uppercase;
	font-size: 20px;
	transition: .3s all ease;
	text-decoration: none;
}

#header .brofoods:hover {
	color: #000000;
}

@media ( max-width : 992px) {
	#header {
		background-color: #000;
		padding: 10px 15px;
		display: flex;
		align-content: center;
		flex-wrap: wrap;
	}
	#header .brofoods {
		color: #fff;
		margin-right: 16px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	#header button {
		border: none;
		background-color: transparent;
		color: rgba(255, 255, 255, 0.5);
		cursor: pointer;
		padding: 4px 0px 4px 12px;
		font-size: 15px;
		text-transform: uppercase;
		letter-spacing: 2px;
	}
	#header button i {
		font-size: 22px;
		position: relative;
		display: inline-block;
		top: 2px;
	}
	#header .list-display-none {
		display: none;
		flex-grow: 1;
		flex-basis: 100%;
	}
	#header .list-display-none .list-head2 {
		flex-direction: column;
	}
	#header .list-display-none .list-head2>.list-item-head2>.nav-link {
		padding-left: 0;
		padding-right: 0;
		padding-top: 14px !important;
		padding-bottom: 14px !important;
		color: rgba(255, 255, 255, 0.7);
		transition: 0.3s all ease;
	}
	#header .list-display-none .list-head2 .nav-link:hover {
		transition: 0.3s all ease;
		color: #fff;
	}
	#header li:hover .wrap-shop-list {
		position: unset !important;
	}
	#header .list-display-none .list-head2>.list-item-head2>.shop {
		color: #fff;
	}
	#header .list-display-none .list-head2 .icon-cart {
		background-color: #82ae46;
		color: #fff !important;
	}
	#header .list-display-none .list-head2 .js-login {
		background-color: transparent;
	}
}

#header .list-display-none .list-head2 {
	margin-left: auto;
	display: flex;
	list-style: none;
}

#header .list-display-none .list-head2 .nav-link {
	font-size: 10px;
	padding-top: 24px;
	padding-bottom: 24px;
	padding-left: 20px;
	padding-right: 20px;
	color: #000;
	text-transform: uppercase;
	letter-spacing: 2px;
	display: block;
	text-decoration: none;
	cursor: pointer;
}

#header li:hover .wrap-shop-list {
	margin-top: 2px;
	display: block;
	position: absolute;
	padding: 0.5rem 0;
	background-color: #fff;
	box-shadow: 0px 10px 34px -20px rgb(0 0 0/ 41%);
}

#header .list-item-head2 .wrap-shop-list {
	display: none;
	z-index: 1;
}

#header .list-item-head2 .wrap-shop-list li {
	padding: 4px 24px;
	display: block;
	line-height: normal;
	width: 160px;
}

#header .wrap-shop-list .shop-list a {
	font-size: 14px;
	width: 100%;
	display: block;
	text-decoration: none;
	color: #000;
	line-height: 1.8;
}

@media ( min-width : 992px) {
	#header button {
		display: none;
	}
	#header .list-display-none {
		display: block !important;
	}
}

@media ( max-width : 270px) {
	#header {
		height: 92px;
	}
	#header {
		margin-top: -12px;
	}
}

#header .list-item-head2 .bi-cart-fill {
	font-style: normal;
}

#header .list-item-head2 .js-login {
	background: #fff;
	border: none;
	cursor: pointer;
}

#header .list-item-head2 .js-login .bi-person-fill {
	font-size: 15px;
	line-height: 15px;
}
</style>
</head>
<body>

	<div class="bg-light-green py-2">
		<div class="container">
			<div
				class="topbar d-flex justify-content-between text-white align-items-center">

				<!-- Thông tin số điện thoại -->
				<div class="inf d-flex align-items-center">
					<i class="head1-icon bi-telephone-fill"></i>
					<p class="mb-0">+1235 2355 98</p>
				</div>

				<!-- Thông tin email -->
				<div class="inf d-flex align-items-center">
					<i class="head1-icon bi-cursor-fill"></i>
					<p class="mb-0">BROFOOD@EMAIL.COM</p>
				</div>

				<!-- Thông tin giao hàng -->
				<div class="inf d-flex align-items-center">
					<p class="mb-0">3-5 BUSINESS DAYS DELIVERY & FREE RETURNS</p>
				</div>

			</div>
		</div>
	</div>

	<!-- Kết thúc topbar -->

	<!-- Bắt đầu header  -->
	<div id="header">
		<div
			class="container d-flex justify-content-between align-items-center py-1">
			<!-- Thẻ Vegefoods liên kết-->
			<a href="HomeController" class="brofoods">Brofoods</a>

			<form action="Search" method="get" class="d-flex">
				<input name="search" type="search" class="form-control me-2 "
					placeholder="Search..." style="width: 300px"> <input
					type="submit" value="Search" class="btn bg-light-green text-light">
			</form>

			<button class="btn">
				<i class="bi-list"></i> Menu
			</button>

			<div class="list-display-none">
				<ul class="list-head2 mb-0 d-flex">
					<li class="list-item-head2"><a href="HomeController"
						class="nav-link">Home</a></li>

					<li class="list-item-head2 shop-active position-relative"><a
						class="nav-link shop">Shop <i class="bi-caret-down-fill"></i></a>
						<ul class="wrap-shop-list">
							<li class="shop-list"><a href="ShopController">Shop</a></li>
							<li class="shop-list"><a href="CartController">Cart</a></li>
							<li class="shop-list"><a href="CheckOutController">Checkout</a></li>
						</ul></li>

					<li class="list-item-head2"><a href="ContactController"
						class="nav-link">Contact</a></li>

					<li class="list-item-head2">
						<a href="CartController" class="nav-link icon-cart">
							<i class="bi-cart-fill"></i>
						</a>
					</li>

					<!-- Trường hợp nếu đã đăng nhập -->
					<c:if test="${sessionScope.user != null}">
						<c:choose>
							<c:when test="${sessionScope.user.role eq 'admin'}">
								<li class="list-item-head2"><a
									href="MyProductController?accId=${sessionScope.user.userId}"
									class="nav-link"> ${sessionScope.user.username} </a></li>
							</c:when>
							<c:otherwise>
								<li class="list-item-head2"><a
									href="DetailUserController?accId=${sessionScope.user.userId}"
									class="nav-link"> ${sessionScope.user.username} </a></li>
							</c:otherwise>
						</c:choose>
						<li class="list-item-head2"><a href="LogoutController"
							class="nav-link">LogOut</a></li>
					</c:if>

					<!-- Trường hợp nếu chưa đăng nhập -->
					<c:if test="${sessionScope.user == null}">
						<li class="list-item-head2"><a href="LoginController"
							class="nav-link">LogIn</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<!-- Kết thức header  -->

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
