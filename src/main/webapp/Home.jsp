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
    <title>Home</title>
    <link rel="stylesheet" href="./home-assest/css/home-style.css?version=1">

    <!-- Đặt icon cho trang web -->
    <link rel="icon" href="./home-assest/img/head-img/B-ion.jpg">

    <!-- Link css bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <!-- link css boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>
        <!-- Bắt đầu slider -->
        <div class="slider" id="slider1" style="background: url('./home-assest/img/Slide-img/bg_2.jpg');
        background-size: cover;
    	background-repeat: no-repeat;
    	background-position: center center;">
            <div class="container">
                <div class="content text-shadow">
                    <h1 class="slider-title">We serve Fresh Vegetables & Fruits</h1>
                    <h2 class="slider-content">We deliver organic vegetables & fruits</h2>
                    <p class="viewDetails">View details</p>
                </div>
            </div>
        </div>
        <div class="slider" id="slider2" style="background-image: url('./home-assest/img/Slide-img/bg_3.jpg');">
            <div class="container">
                <div class="content text-shadow">
                    <h1 class="slider-title">Discover Our Fresh Produce</h1>
                    <h2 class="slider-content">We source the finest fruits and vegetables</h2>
                    <p class="viewDetails">View details</p>
                </div>
            </div>
        </div>
        <!-- Kết thúc slider -->

        <!-- bắt đầu element -->
        <div id="element">
            <div class="container">
                <div class="element-wrap">
                    <div class="element-content">
                        <div class="element-icon icon1">
                            <img src="./home-assest/img/icon-img/shipped.png" alt="">
                        </div>

                        <div class="element-describe">
                            <h4>Free shipping</h4>
                            <p>on order over $100</p>
                        </div>
                    </div>

                    <div class="element-content">
                        <div class="element-icon icon2">
                            <img src="./home-assest/img/icon-img/diet.png" alt="">
                        </div>

                        <div class="element-describe">
                            <h4> Always fresh</h4>
                            <p>product well package</p>
                        </div>
                    </div>

                    <div class="element-content">
                        <div class="element-icon icon3">
                            <img src="./home-assest/img/icon-img/award.png" alt="">
                        </div>

                        <div class="element-describe">
                            <h4>Superior quality</h4>
                            <p>Quality products</p>
                        </div>
                    </div>

                    <div class="element-content">
                        <div class="element-icon icon4">
                            <img src="./home-assest/img/icon-img/customer-service.png" alt="">
                        </div>

                        <div class="element-describe">
                            <h4>Support</h4>
                            <p>24/7 Support</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- kết thúc element -->

        <!-- Bắt đầu category -->
        <div id="category">
            <div class="container">
                <div class="category-wrap">
                    <div class="category-cotent">
                        <div class="category-product category-product-img1"
                            style="background-image: url(./home-assest/img/category-img/category-1.jpg)">
                            <div class=" category-product-title">
                                <h2>Fruits</h2>
                            </div>
                        </div>
                        <div class="category-product category-product-img2"
                            style="background-image: url(./home-assest/img/category-img/category-2.jpg);">
                            <div class="category-product-title">
                                <h2>Vegetables</h2>
                            </div>
                        </div>
                    </div>

                    <div class="category-cotent-mid">
                        <div class="category-product category-product-img5"
                            style="background-image: url(./home-assest/img/category-img/category-5.jpg);">
                            <h2>Vegetables</h2>
                            <p>Protect the health of every home</p>
                            <a href="ShopController">Shop now</a>
                        </div>
                    </div>

                    <div class="category-cotent">
                        <div class="category-product category-product-img3"
                            style="background-image: url(./home-assest/img/category-img/category-3.jpg);">
                            <div class="category-product-title">
                                <h2>Juices</h2>
                            </div>
                        </div>
                        <div class="category-product category-product-img4"
                            style="background-image: url(./home-assest/img/category-img/category-4.jpg);">
                            <div class="category-product-title">
                                <h2>Dried</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc category -->

        <!-- Bắt đầu products -->
        <div id="products">
            <div class="container">
                <div class="products-heading">
                    <p class="products-subheading">Featured Products</p>
                    <h2> Our Products</h2>
                    <p class="products-subcontent">Far far away, behind the word mountains, far from the countries
                        Vokalia and
                        Consonantia</p>
                </div>
            </div>
            
            <div class="container">
                <!-- Phần sản phẩm -->
                <div class="product">
                    <c:forEach items="${productList}" var="o" begin="0" end="7">
                        <div class="products-select">
                            <div class="img-wrapper">
                                <div class="product-img">
                                	<a href="SingleController?id=${o.id}">
				                    	<img src="${o.imageUrl}">
				                    </a>
								    <c:if test="${o.sale != 0}">
								        <p class="product-status">
											<fmt:formatNumber type="percent" maxIntegerDigits="10" value="${o.sale}"></fmt:formatNumber>
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
				                            	<fmt:setLocale value="en_US"/>
				                            	<fmt:formatNumber value="${o.price}" type="currency"/>
				                            </p>
				                        </c:if>
				                        <p class="price-origin">
				                        	<fmt:setLocale value="en_US"/>
				                            <fmt:formatNumber value="${o.discount()}" type="currency"/>
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
	                                            <a href="" class="icon-menu">
	                                                <i class="bi-list"></i>
	                                            </a>
	                                            <a href="" class="icon-shopping">
	                                                <i class="bi-cart4"></i>
	                                            </a>
	                                            <a href="" class="icon-like">
	                                                <i class="bi-heart-fill"></i>
	                                            </a>
	                                        </div>
	                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End sản phẩm -->
            </div>
        </div>
        <!-- Kết thúc products -->

        <!-- Bắt đầu phần dealtime -->
        <div id="dealtime" style="background-image: url(./home-assest/img/Slide-img/bg_3.jpg);">
            <div class="container">
                <div class="dealtime-content">
                    <span class="dealtime-subheading">Best Price For You</span>
                    <h2 class="dealtime-heading">Deal of the day</h2>
                    <p class="dealtime-subcontent">Far far away, behind the word mountains, far from the countries
                        Vokalia and Consonantia</p>
                    <h3 class="name">Spinach</h3>
                    <p class="dealtime-price">$10 <span>now $5 only</span></p>
                    <div class="dealtime-time">
                        <div class="time" id="days">
                        </div>

                        <div class="time" id="hours">
                        </div>

                        <div class="time" id="minutes">
                        </div>

                        <div class="time" id="seconds">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc phần dealtime -->

        <!-- Bắt đầu phần testimony -->
        <div id="testimony">
            <div class="container">
                <div class="testimony-content">
                    <span>Testimony</span>
                    <h2>Our satisfied customer says</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                        live the blind texts. Separated they live in</p>
                </div>

                <div class="testimony-person">
                    <div class="testimony-list">
                        <div class="item">
                            <div class="user-img"
                                style="background-image: url(./home-assest/img/user-img/person_1.jpg);">
                                <i class='bx bxs-quote-left'></i>
                            </div>

                            <div class="user-content">
                                <p class="user-subcontent">Far far away, behind the word mountains, far from the
                                    countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="user-name">Garreth Smith</p>
                                <span class="user-position">System Analyst</span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="user-img"
                                style="background-image: url(./home-assest/img/user-img/person_2.jpg);">
                                <i class='bx bxs-quote-left'></i>
                            </div>

                            <div class="user-content">
                                <p class="user-subcontent">Far far away, behind the word mountains, far from the
                                    countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="user-name">Garreth Smith</p>
                                <span class="user-position">System Analyst</span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="user-img"
                                style="background-image: url(./home-assest/img/user-img/person_3.jpg);">
                                <i class='bx bxs-quote-left'></i>
                            </div>

                            <div class="user-content">
                                <p class="user-subcontent">Far far away, behind the word mountains, far from the
                                    countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="user-name">Garreth Smith</p>
                                <span class="user-position">System Analyst</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc phần testimony -->

        <!-- Bắt đầu phần cooperate -->
        <div id="cooperate">
            <div class="container">
                <div class="cooperate-wrap">
                    <div class="cooperate-img">
                        <img src="./home-assest/img/cooperate-img/coop-1.png" alt="">
                    </div>

                    <div class="cooperate-img">
                        <img src="./home-assest/img/cooperate-img/coop-2.png" alt="">
                    </div>

                    <div class="cooperate-img">
                        <img src="./home-assest/img/cooperate-img/coop-3.png" alt="">
                    </div>

                    <div class="cooperate-img">
                        <img src="./home-assest/img/cooperate-img/coop-4.png" alt="">
                    </div>

                    <div class="cooperate-img">
                        <img src="./home-assest/img/cooperate-img/coop-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc phần cooperate -->
        
        <jsp:include page="Footer.jsp"></jsp:include>
    </div>

    <!-- Script cho phần home -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="./home-assest/js/home.js?version=3"></script>

    <!-- link css icon-icons -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>