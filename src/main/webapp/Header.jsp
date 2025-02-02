<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<div id="header1">
    <div class="container">
        <div class="head1-subnav">
            <div class="inf">
                <i class="head1-icon bi-telephone-fill"></i>
                <p>+ 1235 2355 98</p>
            </div>

            <div class="inf">
                <i class="head1-icon bi-cursor-fill"></i>
                <p>BROFOOD@EMAIL.COM</p>
            </div>

            <div class="inf">
                <p>3-5 BUSINESS DAYS DELIVERY & FREE RETURNS</p>
            </div>
        </div>
    </div>
</div>
<!-- Kết thúc header đầu tiên -->

<!-- Bắt đầu header 2 -->
<div id="header2">
    <div class="container">
        <!-- Thẻ Vegefoods liên kết-->
        <a href="HomeController" class="brofoods">Brofoods</a>

		<form action="Search" method = "get" >
			<input  name="search" type="search"  style=" padding: 10px 10px 10px 10px; width: 300px">
		 	<input  type="submit" value="Search" style=" padding: 10px 15px 10px 15px; background-color :#82ae46;border-witdh:1px; color :#fff">
		</form>

        <button class="btn">
            <i class="bi-list"></i>Menu
        </button>

        <div class="list-display-none">
            <ul class="list-head2">
                <li class="list-item-head2">
                    <a href="HomeController" class="nav-link">Home</a>
                </li>

                <li class="list-item-head2 shop-active">
                    <a class="nav-link shop">
                        Shop
                        <i class="bi-caret-down-fill"></i>
                    </a>

                    <ul class="wrap-shop-list">
                        <li class="shop-list"><a href="ShopController">Shop</a></li>
                        <li class="shop-list"><a href="CartController">Cart</a></li>
                        <li class="shop-list"><a href="CheckOutController">Checkout</a></li>
                    </ul>
                </li>
				
				<li class="list-item-head2">
                    <a href="ContactController" class="nav-link">Contact</a>
                </li>

                <li class="list-item-head2">
                    <a href="CartController" class="nav-link icon-cart">
                        <i class="bi-cart-fill">[0]</i>
                    </a>
                </li>
				
				<!-- Trường hợp nếu đã đăng nhập vào -->
				<c:if test="${sessionScope.account != null}">
					<c:choose>
			            <c:when test="${sessionScope.account.isAdmin}">
				            <li class="list-item-head2">
				                <a href="MyProductController?accId=${sessionScope.account.accId}" class="nav-link">
				                	${sessionScope.account.username}
				                </a>
				            </li>
			            </c:when>
			            
			            <c:otherwise>
				            <li class="list-item-head2">
				                <a href="DetailUserController?accId=${sessionScope.account.accId}" class="nav-link">
				                	${sessionScope.account.username}
				                </a>
				            </li>
			            </c:otherwise>
			        </c:choose>
					<li class="list-item-head2">
	                    <a href="LogoutController" class="nav-link">LogOut</a>
	                </li>
				</c:if>
				
				<!-- Trường hợp nếu chưa đăng nhập vào -->
				<c:if test="${sessionScope.account == null}">
					<li class="list-item-head2">
	                    <a href="LoginController" class="nav-link">LogIn</a>
	                </li>
				</c:if>
            </ul>
        </div>
    </div>
</div>
<!-- Kết thức header 2 -->