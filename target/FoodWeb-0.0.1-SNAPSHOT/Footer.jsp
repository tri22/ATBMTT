<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Font Awesome for social icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<!-- Custom CSS -->
<style>
.bg-light-green{
	background-color: #82ae46 !important;
}

/* Css Home Subribe */
#home-subcribe {
    background-color: #f7f6f2;
}

#home-subcribe h2 {
    font-size: 1.375rem;
    line-height: 1.5;
    font-weight: 400;
    letter-spacing: 1px;
}

#home-subcribe p {
    font-size: 0.9375rem;
    color: #808080;
    font-weight: 400;
    line-height: 1.5;
    letter-spacing: .5px;
}

#home-subcribe .subcribe-container {
    flex-wrap: wrap;
    padding-top: 75px;
    padding-bottom: 75px;
    margin: 0 15px;
}

#home-subcribe .subcribe-input {
    outline-style: none;
    font-size: 0.9375rem;
    width: 447px;
    border: none;
    padding: 6px 15px;
}

#home-subcribe .form-group {
    height: 52px;
}

#home-subcribe .subcribe-submit {
    background-color: #82ae46;
    border-style: none;
    cursor: pointer;
    width: 92px;
    line-height: 52px;
    text-align: center;
    text-decoration: none;
    color: #fff;
    font-size: 1rem;
    font-weight: 400;
}
.colum-subcribe{
	 display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}


#home-subcribe .subcribe-input {
    outline-style: none;
    font-size: 0.9375rem;
    width: 447px;
    border: none;
    padding: 6px 15px;
}

/* End Home Subcribe */

#footer {
	padding: 96px 0 24px 0;
	background-color: #fff;
	position: relative;
}

#footer .scoll-btn-wrapper {
	position: absolute;
	background-color: #82ae46;
	height: 60px;
	width: 60px;
	top: -30px;
	left: 50%;
	transform: translateX(-50%);
	border-radius: 50%;
	transition-delay: 0.3s;
}

#footer .scoll-icon {
	color: #fff;
	font-size: 20px;
	padding: 0 20px;
	line-height: 60px;
}

#footer .scoll-icon-wheel {
	animation: 1.6s ease infinite wheel-up-down;
}

@
keyframes wheel-up-down { 100% {
	margin-top: -8px;
	opacity: 1;
}

30
%
{
opacity
:
1;
}
0
%
{
margin-top
:
10px;
opacity
:
0;
}
}
#footer .footer-container {
	margin: 0 100px;
}

#footer .footer-content-wrapper {
	justify-content: space-evenly;
	margin: 0 0 80px 0;
}

#footer .footer-discription {
	flex-basis: 250px;
}

#footer .footer-menu {
	flex-basis: 160px;
}

#footer .footer-help {
	flex-basis: 300px;
}

#footer .footer-question {
	flex-basis: 240px;
}

#footer .help-content .help-left-content {
	flex-basis: 170px;
	flex-wrap: nowrap;
}

#footer .dsc-content, #footer .menu-content, #footer .help-content,
	#footer .question-content, #footer .footer-copyright {
	font-weight: 500;
	line-height: 1.8;
	font-size: 1rem;
}

#footer .dsc-content p {
	margin-bottom: 16px;
}

#footer .menu-content a {
	padding: 8px 0;
	display: block;
}

#footer .help-content a {
	display: block;
}

#footer h2 {
	margin-bottom: 20px;
	font-weight: 550;
	font-size: 1rem;
	line-height: 1.5;
	letter-spacing: 1px;
}

#footer li, #footer a {
	text-decoration: none;
	list-style: none;
	color: black;
}

#footer .footer-social-icon {
	margin: 48px 0 16px -60px;
}

#footer .fb-icon-wrapper, #footer .tw-icon-wrapper, #footer .ins-icon-wrapper
	{
	height: 50px;
	width: 50px;
	background: rgba(0, 0, 0, 0.02);
	border-radius: 50%;
	margin-right: 16px;
}

#footer .fb-icon-wrapper span {
	line-height: 50px;
	font-size: 1.625rem;
	padding: 0 16px;
}

#footer .tw-icon-wrapper span, #footer .ins-icon-wrapper span {
	line-height: 50px;
	font-size: 1.625rem;
	padding: 0 13px;
}

#footer .question-address {
	display: flex;
}

#footer .question-address span, #footer .question-mail span, #footer .question-phone span
	{
	margin-right: 8px;
}

#footer .footer-copyright {
	margin-top: 60px;
	letter-spacing: 1px;
}
</style>
</head>
<body>

	<!-- Start Home Subscribe Section -->
	<div id="home-subcribe">
		<div class="subcribe-container text-center">
			<h2 class="subcribe-heading">Subscribe to our Newsletter</h2>
			<p class="subcribe-content">Get e-mail updates about our latest
				shops and special offers</p>

			<form action="#"
				class="form-group d-flex justify-content-center mt-3">
				<input name="search" type="search" class="form-control me-2 " 
					placeholder="Enter email address" style="width: 300px"> 
					<input type="button"
					class="btn bg-light-green text-light" value="Subscribe">
			</form>
		</div>
	</div>
	<!-- End Home Subscribe Section -->

	<!-- Footer Section -->
<footer id="footer">
    <div class="footer-container text-center">
        <!-- Scroll to top button -->
        <div class="scoll-btn-wrapper mb-3">
            <a href="#" class="scoll-btn">
                <div class="scoll-icon-wheel">
                    <span class="bi bi-chevron-up scoll-icon"></span>
                </div>
            </a>
        </div>

        <!-- Footer content -->
        <div class="footer-content-wrapper row justify-content-evenly">
            <!-- Description Section -->
            <div class="col-md-3 footer-discription text-start">
                <h2 class="dsc-title fw-bold fs-5">Brofoods</h2>
                <p class="dsc-content">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                <div class="footer-social-icon d-flex justify-content-evenly">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <!-- Menu Section -->
            <div class="col-md-2 footer-menu text-start">
                <h2 class="menu-title fw-bold fs-5">Menu</h2>
                <ul class="menu-list list-unstyled">
                    <li><a href="#" class="menu-link fw-medium">Shop</a></li>
                    <li><a href="#" class="menu-link fw-medium">About</a></li>
                    <li><a href="#" class="menu-link fw-medium">Journal</a></li>
                    <li><a href="#" class="menu-link fw-medium">Contact Us</a></li>
                </ul>
            </div>

            <!-- Help Section -->
            <div class="col-md-3 footer-help text-start">
                <h2 class="help-title fw-bold fs-5">Help</h2>
                <div class="help-content row">
                    <div class="col help-left-content">
                        <ul class="list-unstyled">
                            <li><a href="#" class="help-link">Shipping Information</a></li>
                            <li><a href="#" class="help-link">Returns & Exchange</a></li>
                            <li><a href="#" class="help-link">Terms & Conditions</a></li>
                            <li><a href="#" class="help-link">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <div class="col help-right-content">
                        <ul class="list-unstyled">
                            <li><a href="#" class="help-link">FAQs</a></li>
                            <li><a href="#" class="help-link">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Contact Section -->
            <div class="col-md-3 footer-question text-start">
                <h2 class="question-title fw-bold fs-5">Have a Question?</h2>
                <div class="question-content">
                    <div class="question-address d-flex align-items-start mb-2">
                        <i class="bi bi-geo-alt-fill me-2"></i>
                        <p class="mb-0 ">203 Fake St. Mountain View, San Francisco, California, USA</p>
                    </div>
                    <div class="question-phone mb-2 d-flex align-items-start">
                        <i class="bi bi-telephone-fill me-2"></i>
                        <a href="tel:+23923929210" class="mb-0 ">+2 392 3929 210</a>
                    </div>
                    <div class="question-mail d-flex align-items-start">
                        <i class="bi bi-envelope-fill me-2"></i>
                        <a href="mailto:brofoods@gmail.com" class="mb-0 " >brofoods@gmail.com</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

			<!-- Copyright -->
			<div
				class="footer-copyright d-flex justify-content-center align-items-center my-5">
				<p class="mb-0 me-2 fw-medium ">Copyright ©2022 All rights reserved | From
					Brofoods with love</p>
				<i class="bi bi-heart-fill" style="color: red;"></i>
			</div>
		</div>
	</footer>
	<!-- End Footer Section -->

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
