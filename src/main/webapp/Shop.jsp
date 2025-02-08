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
<title>Shop</title>
<link rel="stylesheet" href="./shop-assest/css/shop-style.css?version=7">

<!-- Đặt icon cho trang web -->
<link rel="icon" href="./shop-assest/img/head-img/B-ion.jpg">

<!-- Link css bootstrap-icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<!-- link css boxicons -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script> -->
</head>

<body>
	<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- Bắt đầu slider -->
		<div id="slider">
			<div class="container">
				<div class="content text-shadow">
					<div class="content-info">
						<a href="HomeController" class="home-card">Home /</a>
						<p>Products</p>
					</div>
					<h1 class="product-header">Products</h1>
				</div>
			</div>
		</div>
		<!-- Kết thúc slider -->

		<!-- Bắt đầu nội dung của shop -->
		<div id="content-shop">
			<div class="container">
				<!-- Phần menu -->
				<div class="menu-content">
					<ul class="category">
						<li><a href="ShopController"
							class="${empty cateTag ? 'category-link' : ''}">All</a></li>
						<c:forEach items="${cateList}" var="o">
							<li><a href="CategoryController?cateId=${o.cateId}"
								class="${cateTag == o.cateId ? 'category-link' : ''}">${o.cateName}</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- End menu -->

				<!-- Phần sản phẩm -->
				<div class="product">
					<c:forEach items="${productList}" var="o">
						<div class="products-select">
							<div class="img-wrapper">
								<div class="product-img">
									<a href="SingleController?id=${o.id}"> 
									<img src="data:image/jpeg;base64,${o.imageBase64}" alt="${o.name}" style="height:240px"/>
									</a>
									<c:if test="${o.sale != 0}">
										<p class="product-status">
											<fmt:formatNumber type="percent" maxIntegerDigits="10"
												value=" ${o.sale}"></fmt:formatNumber>
										</p>
									</c:if>

								</div>

								<div class="product-cost">
									<h3 class="product-name">
										<a href="SingleController?id=${o.id}">${o.name}</a>
									</h3>
									<div class="price">
										<c:if test="${o.sale != 0}">
											<p class="price-sale">
												<fmt:setLocale value="en_US" />
												<fmt:formatNumber value="${o.price}" type="currency" />
											</p>
										</c:if>
										<p class="price-origin">
											<fmt:setLocale value="en_US" />
											<fmt:formatNumber value="${o.price * (1 - o.sale)}"
												type="currency" />
										</p>
									</div>

									<c:if test="${o.weight == 0}">
										<div class="out-of-stock">
											<p>Out Of Stock</p>
										</div>
									</c:if>

									<c:if test="${o.weight != 0}">
										<div class="option">
											<div class="wrap-option">
												<a href="" class="icon-menu"> <i class="bi-list"></i>
												</a> <a href="" class="icon-shopping"> <i class="bi-cart4"></i>
												</a> <a href="" class="icon-like"> <i class="bi-heart-fill"></i>
												</a>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

						<!-- Nút Previous -->
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="ShopController?page=${currentPage - 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<!-- Số trang -->
						<c:forEach begin="1" end="${totalPages}" var="page">
							<li class="page-item ${page == currentPage ? 'active' : ''}">
								<a class="page-link" href="ShopController?page=${page}">${page}</a>
							</li>
						</c:forEach>

						<!-- Nút Next -->
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="ShopController?page=${currentPage + 1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>

					</ul>
				</nav>

			</div>
		</div>
		<!-- Kết thúc nội dung của shop -->

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="./shop-assest/js/shop-jquery.js?version=1"></script>

	<!-- link css icon-icons -->
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>