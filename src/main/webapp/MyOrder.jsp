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
    <link rel="stylesheet" href="./user-asset/user.css?version=3">
    <title>My Order</title>
</head>
<body>
        <div class="container">
            <div class="row">
                <div class="flex-column  rounded mb-2 ">
                   	<nav aria-label="breadcrumb pb-5" style="background-color: #edf2f9; margin: 0 -12px;">
                        <ol class="breadcrumb mb-0" style="padding: 25px;">
                            <li class="breadcrumb-item active bold-text font-25" aria-current="page" >
                                <a class="text-decoration-none" href="index.jsp">Home</a>
                                <a class="text-decoration-none" href="addpd.jsp">/ Order list</a>
                            </li>
                        </ol>
                    </nav>
                    <table class="row  px-3 rounded ">
                     <c:forEach items="${orders}" var="o">
                        <tr class="bg-white border-bottom">
                                <td class="col-3 text-center" >
                                    <p><b>${o.id}</b></p>
									<p>${o.orderDate}</p>
                                </td>
                                <td class="col-3 px-3  align-self-start"> 
                                    <p class="bold-text mb-3 pt-2"  style="width: fit-content">
                                        ${o.user.lastName}
                                    </p>
                                    <p >
                                        ${o.user.address}
                                    </p>
              <td class="col-3" style="width: 250px;">
                <c:choose>
                    <c:when test="${o.deliveryStatus == 'pending'}">
                        <div class="progress-container">
                            <div class="progress-bar">
                                <div class="progress" style="width: ${o.progress}%;"></div>
                            </div>
                            <div class="progress-steps">
                                <div class="step ${o.progress >= 33 ? 'completed' : ''}">
                                    <div class="circle">1</div>
                                    <div class="label">Cửa hàng</div>
                                </div>
                                <div class="step ${o.progress >= 66 ? 'completed' : ''}">
                                    <div class="circle">2</div>
                                    <div class="label">Vận chuyển</div>
                                </div>
                                <div class="step ${o.progress == 100 ? 'completed' : ''}">
                                    <div class="circle">3</div>
                                    <div class="label">Hoàn thành</div>
                                </div>
                           </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center deliverStatus" style="width: 150px; margin: 0 15px 0 30px;">
                            ${o.deliveryStatus}
                        </div>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="col-3 my-5 ml-5 d-flex justify-content-center" style="width: 300px;">
                <a class="col-4 m-2 deleteBtn text-center text-decoration-none bg-color-blue text-white py-2 rounded bold-text" href="#" type="button">Delete order</a>
            </td>
            </c:forEach>
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
            </div>
        </div>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            const statuses = document.querySelectorAll(".deliverStatus");
            const editButtons = document.querySelectorAll(".editBtn");
            const deleteButtons = document.querySelectorAll(".deleteBtn");

            statuses.forEach((status, index) => {
                if (status.innerText.trim() === "Complete") {
                    status.classList.add("complete");
                    editButtons[index].style.opacity = "0.6";
                    editButtons[index].style.pointerEvents = "none";
                    deleteButtons[index].style.opacity = "0.6";
                    deleteButtons[index].style.pointerEvents = "none";
                } else {
                    status.classList.add("pending");
                }
            });
        });
        </script>
         <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Get modal
                var modal = document.getElementById("deleteModal");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // Get the cancel and submit buttons inside the modal
                var cancelBtn = document.getElementsByClassName("modalCancel")[0];
                var submitBtn = document.getElementsByClassName("modalSubmit")[0];

                // Get all delete buttons
                var deleteButtons = document.getElementsByClassName("deleteBtn");

                // Loop through all delete buttons and add event listeners
                for (var i = 0; i < deleteButtons.length; i++) {
                    deleteButtons[i].onclick = function (event) {
                        event.preventDefault(); // Prevent the default link behavior
                        modal.style.display = "block";
                    }
                }

                // When the user clicks on <span> (x), close the modal
                span.onclick = function () {
                    modal.style.display = "none";
                }

                // When the user clicks on the cancel button, close the modal
                cancelBtn.onclick = function () {
                    modal.style.display = "none";
                }

                // When the user clicks on the submit button, perform the action and close the modal
                submitBtn.onclick = function () {
                    alert("Object has been deleted.");
                    modal.style.display = "none";
                }

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            });
        </script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="./adminhub/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>