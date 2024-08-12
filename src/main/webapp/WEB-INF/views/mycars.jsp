<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/mycars.css">
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<title>My Cars</title>
</head>
<body>

<%@ include file="header.jsp"%>

<div class="container" id="container">
    <h1 class="mb-4" id="approve-headtext">My Cars</h1>

    <%-- Check if the list of cars is empty --%>
    <c:if test="${empty cars}">
        <div class="alert alert-warning" role="alert">No cars uploaded yet.</div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-3">
        <c:forEach items="${cars}" var="car">
            <c:if test="${not car.hasApprovedBid}">
                <div class="col">
                    <div class="card" id="card">
                        <img src="data:image/jpeg;base64,${car.carPicture.image}" id="car-image" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title">
                                <span class="text-value">${car.make} ${car.model}</span>
                            </h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="card-text">
                                        Year: <span class="text-value">${car.year}</span>
                                    </p>
                                    <p class="card-text">
                                        Price: <span class="text-value2">$${car.price}</span>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="card-text">
                                        Status: <span class="text-value">${car.status}</span>
                                    </p>
                                    <p class="card-text">
                                        Seller: <span class="text-value">${car.user.name}</span>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${car.status == 'ACTIVE'}">
                                <a href="updatecar?carId=${car.carId}" class="btn btn-primary" id="btn">Update</a>
                            </c:if>
                            
                            <form class="d-inline" action="toggleStatus" method="post">
                                <input type="hidden" name="carId" value="${car.carId}">
                                <button type="submit" id="btn" class="btn btn-outline-danger" ${car.status == 'INACTIVE' ? 'disabled' : ''}>
                                    Deactivate
                                </button>
                            </form>

                            <c:if test="${car.status == 'INACTIVE'}">
                                <div class="alert alert-info mt-2 text-center" role="alert">
                                    This car is currently deactivated. Please wait for admin approval.
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

	<%@ include file="footer.jsp"%>

</body>
</html>