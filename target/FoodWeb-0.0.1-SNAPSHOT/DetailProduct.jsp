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
    <link rel="stylesheet" href="./adminhub/css/style.css?version=1">
    <title>Detail Product</title>
</head>
<body>
	<form action="MyProductController" method="post" class="container border ">
        <div class="text-center">
            <h3>Detail Product</h3>
        </div>

		<div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">ID</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="id" value="${product.id}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Name</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="name" value="${product.name}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Img Url</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="imageUrl" value="${product.imageUrl}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Price</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="price" value="${product.price}" readonly aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Sale</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="sale" value="${product.sale}" readonly aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Category</label>
            </div>
            <div class="col-auto">
                <select class="form-select" name="cateId" aria-describedby="passwordHelpInline">
                	<c:forEach items="${cateList}" var="o">
	                    <option disabled="disabled" value="${o.cateId}" ${product.category.cateId == o.cateId ? 'selected' : ''}>${o.cateName}</option>
                	</c:forEach>
                </select>
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Content</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="content" value="${product.content}" readonly aria-describedby="passwordHelpInline">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Weight</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="weight" value="${product.weight}" readonly aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <input type="submit" value="My Product" class="bg-lightgreen no-border rounded p-1 px-2 ">
            </div>
            <div class="col-auto">
                <a href="EditProductController?id=${product.id}">
                	<input type="button" value="Edit Product" class="bg-lightgreen no-border rounded p-1 px-2 ">
                </a>
            </div>
        </div>
    </form>
</body>
</html>