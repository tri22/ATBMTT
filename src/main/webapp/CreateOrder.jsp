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
    <link rel="stylesheet" href="./adminhub/admin/main.css">
    <title>Create Order</title>
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
                    <li><a class="text-black" href="addPd.jsp">Add a product</a></li>
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
                    <li><a class="text-black" href="addVoucher.jsp">Add a vocher</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div class="col-10">
        <div class="row">
            <div class="col-10 flex-column  rounded mt-3 mb-2 ">
                <nav aria-label="breadcrumb pb-5" style="background-color: #edf2f9; margin: 0 -12px;">
                    <ol class="breadcrumb mb-0" style="padding: 25px;">
                        <li class="breadcrumb-item active bold-text font-25" aria-current="page" >
                            <a class="text-decoration-none" href="index.jsp">Home</a>
                            <a class="text-decoration-none" href="addpd.jsp">/ Add Employee</a>
                        </li>
                    </ol>
                </nav>
                <div class="bg-white rounded">
                    <div class="px-5 pt-4">
                        <label for="inputPassword5" class="form-label">Employee name</label>
                        <input type="text" id="" class="form-control">
                    </div>
                    <div class="px-5 pt-4" >
                        <label for="inputPassword5" class="form-label">Position</label>
                        <select class="form-select" aria-label="Default select example" >
                            <option selected>Select Position</option>
                            <option value="1">Cashier</option>
                            <option value="2">Cleaning staff</option>
                            <option value="3">Kitchen staff</option>
                            <option value="4">Waiter/ Waitress</option>
                            <option value="5">Maneger</option>
                        </select>
                    </div>
                    <div class="px-5 pt-4" >
                        <label for="inputPassword5" class="form-label">Employee ID</label>
                        <input type="text" id="" class="form-control">
                    </div>
                    <div class="px-5 pt-4">
                        <label for="inputPassword5" class="form-label">Phone number</label>
                        <input type="tel" id="" class="form-control">
                    </div>
                    <div class="px-5 pt-4">
                        <label for="inputPassword5" class="form-label">Email</label>
                        <input type="email" id="" class="form-control">
                    </div>
                    <div class="px-5 pt-4">
                        <label for="inputPassword5" class="form-label">Address</label>
                        <input type="text" id="" class="form-control">
                    </div>
                    <div class="px-5 py-4">
                        <input type="submit" id="" class="form-control" style="background-color: #2c7be5;">
                    </div>
                </div>
            </div>
            <div class="col-2">
                <button id="avatar" type="button" class="btn"><i class="bi bi-person-circle" style="font-size: 32px;"></i></button>
                <div class="col profile-dropdown mt-0 d-none">
                    <div class="row justify-content-start m-0 py-2 border-bottom">
                        <p class="" style="width: fit-content;">Hello</p>
                        <p class="m-0 p-0" style="width: fit-content;">$(i.name)</p>
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
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="./adminhub/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>