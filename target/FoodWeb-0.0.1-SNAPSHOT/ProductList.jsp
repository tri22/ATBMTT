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
                                <a class="text-decoration-none" href="addpd.jsp">/ Product list</a>
                            </li>
                        </ol>
                    </nav>
                    <table class="row  px-3 rounded ">
                            <tr class="bg-white border-bottom" >
                                <td class="col-3" ><img class="p-3 " style="height: 250px;" src="img/snapedit_1715408934262.jpg" alt="" ></td>
                                <td class="col-6 px-3 pb-5 align-self-start"> 
                                    <p class="bold-text mb-4 "  style="width: fit-content">
                                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
                                    </p>
                                    <p >
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                    </p>
                                </td>
                                <td class="col-3 d-flex flex-column justify-content-between mt-4" style="width: 150px;">
                                    <h3 class="align-self-center mt-5" style="color: rgba(245, 128, 62,1);">$100</h3>
                                    <div class=" d-flex flex-column justify-content-between mb-5">
                                        <a class="m-2 align-self-center text-decoration-none bg-color-blue text-white p-2 rounded bold-text" href="" >Edit product</a>
                                        <a id="deleteButton" class="deleteBtn m-2 align-self-center text-decoration-none bg-color-blue text-white p-2 rounded bold-text" href="#" type="button" >Delete product</a>
                                    </div>
                                </td>
                            </tr>

                            <tr class="bg-white border-bottom">
                                <td class="col-3" ><img class="p-3 " style="height: 250px;" src="img/snapedit_1715408934262.jpg" alt="" ></td>
                                <td class="col-6 px-3 pb-5 align-self-start"> 
                                    <p class="bold-text mb-4 "  style="width: fit-content">
                                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
                                    </p>
                                    <p >
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                    </p>
                                </td>
                                <td class="col-3 d-flex flex-column justify-content-between mt-4" style="width: 150px;">
                                    <h3 class="align-self-center mt-5" style="color: rgba(245, 128, 62,1);">$100</h3>
                                    <div class=" d-flex flex-column justify-content-between mb-5">
                                        <a class="m-2 align-self-center text-decoration-none bg-color-blue text-white p-2 rounded bold-text" href="" >Edit product</a>
                                        <a id="deleteButton" class="deleteBtn m-2 align-self-center text-decoration-none bg-color-blue text-white p-2 rounded bold-text" href="#" type="button" >Delete product</a>
                                    </div>
                                </td>
                            </tr>
                    </table>
                    <div class="mt-3" style="margin-left: 15px;">
                        <ul class="pagination">
                          <li class="page-item disabled">
                            <a class="page-link"><i class="bi bi-caret-left"></i></a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2</a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#"><i class="bi bi-caret-right"></i></a>
                          </li>
                        </ul>
                    </div>   
                    <div id="deleteModal" class="modal">
                        <div class="modal-content" >
                            <div class="row">
                                <p class="col-10 align-self-center pl-0">Are you sure you want to delete this?</p>
                                <span class="close col-2 mb-3 pl-0" style="margin-left: -15px;">&times;</span>
                            </div>
                            <button class="modalCancel">Cancel</button>
                            <button class="modalSubmit">Submit</button>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>