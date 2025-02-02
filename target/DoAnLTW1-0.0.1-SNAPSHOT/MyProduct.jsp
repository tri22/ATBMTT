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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./adminhub/css/style.css?version=3">
    <title>My Product</title>
</head>
<body>
	<div class="container-fluid text-center">
        <div class="row">
            <section id="sidebar" class="col-sm-2 text-start pad-none">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <div class="nav-link active text-dark p-5 border-bottom username" aria-current="page" href="#">
                            <img src="" alt="Logo" width="30" height="24"
                                class="d-inline-block align-text-top rounded-circle">${sessionScope.account.username}
						</div>
                    </li>
                    <li class="nav-item hover-green">
                        <a class="nav-link active text-dark p-4" aria-current="page" href="HomeController"><i
                                class="bi bi-house"></i>
                            Home</a>
                    </li>
                    <li class="nav-item hover-green">
                        <a class="nav-link active text-dark p-4" aria-current="page" href="MyProductController"><i
                                class="bi bi-shop-window"></i> MyProduct</a>
                    </li>
                    <li class="nav-item hover-green">
                        <a class="nav-link active text-dark p-4" aria-current="page" href="MyOrderController"><i
                                class="bi bi-receipt"></i></i> MyOrder</a>
                    </li>
                    <li class="nav-item hover-green">
                        <a class="nav-link active text-dark p-4" aria-current="page" href="LogoutController"><i
                                class="bi bi-power"></i>
                            LogOut</a>
                    </li>
                </ul>
            </section>
            <div class="col-sm-10 pad-none">
                <div class=" bg-container">
                    <nav aria-label="breadcrumb ">
                        <ol class="breadcrumb mar-none">
                            <li class="breadcrumb-item "><a class="ps-lg-3 text-decoration-none" href="HomeController">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">MyProduct</li>
                        </ol>
                    </nav>
                </div>
                <div>
                    <div class="bg-light">
                        <p class="mar-none text-start ps-3 font-25">
                            MyProduct
                        </p>
                    </div>
                    <div>
                        <p class="mar-none mt-3 text-start ps-3 font-17">
                            Thêm sản phẩm <a href="AddProductController"><i class="bi bi-plus-square"></i></a>
                        </p>
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th class="imageTitle">Ảnh sản phẩm</th>
                            <th>Giá</th>
                            <th>Khối lượng</th>
                            <th>Chỉnh sửa</th>
                        </tr>
                        <c:forEach items="${listProduct}" var="o">
                            <tr>
                                <td class="align-middle">${o.id}</td>
                                <td class="align-middle"><a href="DetailProductController?id=${o.id}">${o.name}</a></td>
                                <td class="imageUrl align-middle"><img src="${o.imageUrl}" alt="${o.name}"></td>
                                <td class="align-middle">${o.price}</td>
                                <td class="align-middle">${o.weight}</td>
                                <td class="align-middle">
                                	<a href="EditProductController?id=${o.id}"><i class="bi bi-pencil-square"></i></a>
                               		<a href="DeleteController?id=${o.id}"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item ">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item "><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>