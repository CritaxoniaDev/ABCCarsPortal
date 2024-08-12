<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sold Cars</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<link rel="stylesheet" href="/css/mycars.css">
</head>
<body>

<%@ include file="header.jsp"%>

<div class="container" id="container">
    <h1 class="mb-4" id="approve-headtext">Approved Cars</h1>
    <c:choose> 
    	<c:when test="${!userHasPostedCars}">
            <div class="alert alert-info" style="margin-bottom: 23%;" role="alert">You Need to Upload A Car First. Thank you!</div>
        </c:when>
        <c:when test="${userHasDeniedOrEmptyStatusCars}">
            <div class="alert alert-info" style="margin-bottom: 23%;" role="alert">No cars are approved.</div>
        </c:when>
        <c:otherwise>
            <div class="row">
                <c:forEach items="${approvedCars}" var="car">
                    <%-- Check if the current car's seller ID is equal to the logged-in user's ID --%>
                    <c:if test="${car.user.id == loggedInUserId}">
                        <div class="col-md-4">
                            <div class="card">
                                <img src="data:image/jpeg;base64,${car.carPicture.image}" class="card-img-top" alt="Car Image">
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
                                                Bid Price: <span class="text-value2">$${car.carBidding[0].bidPrice}</span>
                                            </p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="card-text">
                                                Bid Date: <span class="text-value">${car.carBidding[0].bidDate}</span>
                                            </p>
                                            <p class="card-text">
                                                Bidder Name: <span class="text-value">${car.carBidding[0].bidName}</span>
                                            </p>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="alert alert-danger text-center" role="alert">
                                        <strong>This car is now sold out!</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>