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
<link rel="stylesheet" href="./shop-assest/css/shop-style.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link rel="icon" href="./shop-assest/img/head-img/B-ion.jpg">
<title>Brofoods</title>
</head>

<body>
	<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>

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
										<p>Contact</p>
									</div>
									<h1 class="product-header">Contact</h1>
								</div>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
		<!-- Kết thúc slider -->

		<!------------------------------------------- Content ---------------------------------------->
		<article>
			<div class="container">
				<div class="row px-3 g-3 py-4">
					<div class="col-3">
						<div
							class="h-100 rounded shadow d-flex align-items-center justify-content-center p-3">
							<p class="m-0 py-3 text-center">Address: 198 West 21th Street,
								Suite 721 New York NY 10016</p>
						</div>
					</div>
					<div class="col-3">
						<div
							class="h-100 rounded shadow d-flex align-items-center justify-content-center p-3">
							<p class="m-0 py-3 text-center">
								Phone: <a href="tel:+1235235598">+1235 2355 98</a>
							</p>
						</div>
					</div>
					<div class="col-3">
						<div
							class="h-100 rounded shadow d-flex align-items-center justify-content-center p-3">
							<p class="m-0 py-3 text-center">
								Email: <a href="mailto:brofoods@gmail.com">fttrat2003@gmail.com</a>
							</p>
						</div>
					</div>
					<div class="col-3">
						<div
							class="h-100 rounded shadow d-flex align-items-center justify-content-center p-3">
							<p class="m-0 py-3 text-center">
								Website: <a href="HomeController">brofoods.com</a>
							</p>
						</div>
					</div>
				</div>



				<div class="container py-5">
					<div class="row">
						<!-- Bản đồ -->
						<div class="col-md-6">
							<iframe class="contact-map w-100 h-100"
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214594666049!2d106.7895730147193!3d10.87127639225722!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1669554323721!5m2!1svi!2s"
								allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>

						<!-- Form liên hệ -->
						<div class="col-md-6">
							<form action="SendContactController" method="post"
								class="bg-light p-4 rounded shadow">
								<div class="mb-3">
									<input class="form-control" type="text" name="name"
										id="contact-name" required placeholder="Your Name">
								</div>
								<div class="mb-3">
									<input class="form-control" type="email" name="email"
										id="contact-email" required placeholder="Your Email">
								</div>
								<div class="mb-3">
									<input class="form-control" type="text" name="subject"
										id="contact-subject" required placeholder="Subject">
								</div>
								<div class="mb-3">
									<textarea name="content" id="contact-message" cols="30"
										rows="5" class="form-control" required placeholder="Message"></textarea>
								</div>
								<div class="d-grid">
									<input class="btn btn-outline-success px-4" type="submit"
										value="Send Message">
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</article>
		<!------------------------------------------ End content ---------------------------------------->

		<jsp:include page="Footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script src="./contact-assest/js/contact.js"></script>
	</div>
</body>

</html>