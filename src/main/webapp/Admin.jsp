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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="jquery-3.7.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./adminhub/main.css?version=3">
    <link rel="stylesheet" href="./adminhub/admin/admin.css?version=3">
    <title>Admin Dashboard</title>
</head>
<body>
	 <div class="row mx-0 ">
        <nav class="col-2 flex-column px-4" >
            <ul class="flex-column list-unstyled ">
                <li class="row border-bottom justify-content-center pt-3 pb-3">
                    <img src="./adminhub/logo.png" alt="" style="width: 70px; height: 50px; margin-left: -40px;">
                    <h3 class="col-10 p-0 align-self-center mb-0" style="font-size: 20px; width: fit-content; color: rgba(44, 123, 229,1)">The G Pizza</h3>
                </li>
                <li class="justify-content-center ">
                    <a href="dashboard.jsp" class="btn">Dashboard</a>
                </li>
                <li class="justify-content-center">
                    <button id="product" type="button"  class="btn">Product <i class="bi bi-caret-down-fill"></i></button>
                    <ul class="product-list list-unstyled pl-4 d-none border-bottom" style="width: fit-content">
                        <li><a class="text-black" href="pdList.jsp">Product list</a></li>
                        <li><a class="text-black" href="AddProduct.jsp">Add a product</a></li>
                    </ul>
                </li>
                <li class="justify-content-center">
                    <button id="order" type="button"  class="btn">Order <i class="bi bi-caret-down-fill"></i></button>
                    <ul class="order-list list-unstyled pl-4 d-none border-bottom" style="width: fit-content">
                        <li><a class="text-black" href="orderList.jsp">Order list</a></li>
                        <li><a class="text-black" href="createOrder.jsp">Create order</a></li>
                    </ul>
                </li>
                <li class=" justify-content-center">
                    <button id="employee" type="button"  class="btn">Employee <i class="bi bi-caret-down-fill"></i></button>
                    <ul class="employee-list list-unstyled d-none border-bottom" style="width: fit-content">
                        <li><a class="text-black" href="employeeList.jsp">Employee list</a></li>
                        <li><a class="text-black" href="addEmployee.jsp">Add an employee</a></li>
                    </ul>
                </li>
                <li class="justify-content-center">
                    <button id="voucher" type="button"  class="btn">Voucher <i class="bi bi-caret-down-fill"></i></button>
                    <ul class="voucher-list list-unstyled pl-4 d-none border-bottom" style="width: fit-content">
                        <li><a class="text-black" href="voucherList.jsp">Voucher list</a></li>
                        <li><a class="text-black" href="addVoucher.jsp">Add a voucher</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="col-10">
            <div class="row">
                <div class="col-10 flex-column bg-white rounded mb-2">
                    <nav aria-label="breadcrumb pb-5" style="background-color: #edf2f9; margin: 0 -12px;">
                        <ol class="breadcrumb" style="padding: 25px;">
                            <li class="breadcrumb-item active bold-text font-25" aria-current="page" >
                                <a class="text-decoration-none" href="index.jsp">Home</a>
                                <a class="text-decoration-none" href="admin.jsp">/ Dashboard</a>
                            </li>
                        </ol>
                    </nav>
                    <div class="welcome-admin">
                        <h3 style="color: rgba(44, 123, 229,1);"> Welcome, ${Name}</h3>
                        <p>Here's what happening with your store today</p>
                        <div class="row border-bottom">
                            <div class="col-3">
                                <p >Today's visit</p>
                                <p class="bold-text" style="font-size: 30px;">4,209</p>
                            </div>
                            <div class="col-3">
                                <p >Today's total sales</p>
                                <p class="bold-text" style="font-size: 30px;">$21,349</p>
                            </div>
                        </div>
                    </div>
                    <div class="row border-bottom  ">
                        <i class="pl-0 bi bi-check-circle-fill" style="width: fit-content;"></i>
                        <p class="bold-text p-0" style="width: fit-content;">7 orders</p><p  style="width: fit-content;">have payments that need to be captured</p>
                    </div>
                    <div class="row ">
                        <i class=" bi bi-check-circle-fill" style="width: fit-content;"></i>
                        <p class="bold-text p-0" style="width: fit-content;">50+ orders</p><p style="width: fit-content;">need to be fulfilled</p>
                    </div>
                </div>
                <div class="col-2">
                    <button id="avatar" type="button" class="btn"><i class="bi bi-person-circle" style="font-size: 32px;"></i></button>
                    <div class="col profile-dropdown mt-0 d-none">
                        <div class="row justify-content-start m-0 py-2 border-bottom">
                            <p class="" style="width: fit-content;">Hello</p>
                            <p class="m-0 p-0" style="width: fit-content;">${username}</p>
                        </div>
                        <div class="row justify-content-start m-2 pb-2 border-bottom">
                            <a href=""><i class="bi bi-gear"></i> Setting</a>
                        </div>
                        <div class="row justify-content-start m-2 pb-2 ">
                            <a href=""><i class="bi bi-power"></i> Logout</a>
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="row mx-0 my-2 col-10 p-0 ">
                <div class="col-6 px-0 ">
                    <div class=" weekly-sale bg-white rounded mr-2">
                        <div class="row mx-0 pt-2"> 
                            <p class="col-6 pl-5 bold-text mb-0 align-self-center">Weekly Sales</p>
                            <div class="row col-6">
                                <p class="col-6 mb-0 align-self-center font-20">$47K</p>
                                <div class="col-6 px-2 rounded-pill align-self-center mt-1"style="background-color: #d9f8eb;color: #00894f;">
                                    +3.5%
                                </div>
                            </div>
                        </div>
                        <canvas class="weekly-sale-chart col-7 mt-3 px-3" id="saleChart"></canvas>
                    </div>
                </div>
                <div class="col-6 px-0">
                    <div class=" total-order bg-white rounded ml-2 ">
                        <div class="row mx-0 pt-2"> 
                            <p class="col-6 pl-5 bold-text mb-0 align-self-center">Total Order</p>
                            <div class="row col-6">
                                <p class="col-6 mb-0 align-self-center" style="font-size: 20px;">58.4K</p>
                                <div class="col-6 px-2 rounded-pill align-self-center mt-1" style="background-color: #d9f8eb; width: fit-content; color: #00894f;">+13.5%</div>
                            </div>
                        </div>
                        <canvas class="total-order-chart col-8 px-3" id="orderChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="mx-0 my-2 col-10  p-0 ">
                <div class="salemom-container bg-white rounded">
                    <p class="p-5 pb-0 bold-text mt-3 pt-5" style="font-size: 20px;">Total Sales</p>
                    <canvas class="px-4 pb-5" id="salemom"></canvas>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="./adminhub/admin/dashboard.js"></script>
<script src="./adminhub/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>