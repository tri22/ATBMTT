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
    <title>Add product</title>
</head>
<body>
	<form action="AddController" method="post" class="container border" enctype="multipart/form-data">
        <div class="text-center">
            <h3>Add New Product</h3>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Name</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="name" aria-describedby="passwordHelpInline">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
		    <div class="col-auto">
		        <label class="col-form-label width-100">Image Upload</label>
		    </div>
		    <div class="col-auto">
		        <input type="file" class="form-control" name="imageFile" aria-describedby="passwordHelpInline">
		    </div>
		</div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Img Url</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="imageUrl" aria-describedby="passwordHelpInline">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Price</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="price" aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Sale</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="sale"aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>

        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Category</label>
            </div>
            <div class="col-auto">
                <select class="form-select" name="cateId" aria-describedby="passwordHelpInline">
                	<c:forEach items="${cateList}" var="o">
	                    <option value="${o.cateId}">${o.cateName}</option  >
                	</c:forEach>
                </select>
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Content</label>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" name="content" aria-describedby="passwordHelpInline">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <label class="col-form-label width-100">Weight</label>
            </div>
            <div class="col-auto">
                <input type="number" class="form-control" name="weight"aria-describedby="passwordHelpInline" step="any">
            </div>
        </div>
        
        <div class="row g-3 justify-content-center align-items-center p-1">
            <div class="col-auto">
                <input type="submit" value="Submit" class="bg-lightgreen no-border rounded p-1 px-2 ">
            </div>
            <div class="col-auto">
                <input type="submit" value="Cancel" class="bg-lightgreen no-border rounded p-1 px-2 ">
            </div>
        </div>
    </form>
</body>
</html>