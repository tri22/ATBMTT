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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./contact-assest/css/contact.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link rel="icon" href="./contact-assest/img/head-img/B-ion.jpg">
    <title>Brofoods</title>
</head>

<body>
    <div id="main">
        <jsp:include page="Header.jsp"></jsp:include>

        <!------------------------------ stactic-slider a.k.a slider tĩnh ---------------------------->
        <div id="static-slider">
            <div class="text-content">
                <p class="text-heading-container">
                    <span><a href="HomeController" class="link-home">HOME</a></span>
                    <span>/</span>
                    <span class="text-wish">Contact Us</span>
                </p>
                <h1 class="text-title">Contact Us</h1>
            </div>
        </div>
        <!------------------------------------- Kết thúc phần slider --------------------------------->

        <!------------------------------------------- Content ---------------------------------------->
        <article id="contact-article">
            <div class="contact-container">
                <div class="contact-info-list row">
                    <div class="info-container col-4">
                        <p>Address: 198 West 21th Street, Suite 721 New York NY 10016</p>
                    </div>
                    <div class="info-container col-4">
                        <p>Phone: <a href="tel:+ 1235 2355 98">+1235 2355 98</a></p>
                    </div>
                    <div class="info-container col-4">
                        <p>Email: <a href="mailto:brofoods@gmail.com">fttrat2003@gmail.com</a></p>
                    </div>
                    <div class="info-container col-4">
                        <p>Website: <a href="HomeController">brofoods.com</a></p>
                    </div>
                </div>

                <div class="contact-content-wrapper row">
                    <div class="map-wrapper col-2">
                        <iframe class="contact-map"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214594666049!2d106.7895730147193!3d10.87127639225722!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1669554323721!5m2!1svi!2s"
                            allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>

                    <div class="input-wrapper col-2">
                        <form action="SendContactController" method="post">
                            <ul class="input-list">
                                <div class="field-wrapper">
                                    <li>
                                    	<input class="input-field" type="text" name="name" id="contact-name" required
                                            placeholder="Your Name">
                                    </li>
                                </div>
                                <div class="field-wrapper">
                                    <li><input class="input-field" type="email" name="email" id="contact-email" required
                                            placeholder="Your Email">
                                    </li>
                                </div>
                                <div class="field-wrapper">
                                    <li><input class="input-field" type="text" name="subject" id="contact-subject" required
                                            placeholder="Subject">
                                    </li>
                                </div>
                                <div class="field-wrapper">
                                    <li><textarea name="content" id="contact-message" cols="30" rows="7" class="input-field"
                                            required placeholder="Message"></textarea>
                                    </li>
                                </div>
                                <div class="field-wrapper">
                                    <li>
                                    	<input class="input-submit-btn" type="submit" value="Send Message">
                                    </li>
                                </div>
                            </ul>
                        </form>
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