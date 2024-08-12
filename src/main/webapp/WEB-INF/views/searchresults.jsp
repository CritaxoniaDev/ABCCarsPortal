<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/searchresults.css">
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<title>Search Results</title>
</head>
<body>

<%@ include file="header.jsp"%>

<div class="container" id="container2">
    <h1 class="mb-4" id="heading-text">Search Results:</h1>
    <c:choose>
        <c:when test="${empty activeSearchResults}">
            <div class="alert alert-danger" style="margin-bottom: 23%;" role="alert">
                No cars found. Please try again!
            </div>
        </c:when>
        <c:otherwise>
            <div class="row row-cols-1 row-cols-md-3">
                <c:forEach items="${activeSearchResults}" var="car">
                    <c:if test="${not empty car.getCarBidding()}">
                        <c:forEach var="carBidding" items="${car.getCarBidding()}">
                            <c:if test="${carBidding.bidStatus eq 'APPROVED'}">
                                <c:set var="approvedBid" value="true" />
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty approvedBid}">
                        <div class="col mb-4">
                            <div class="card">
                                <img src="data:image/jpeg;base64,${car.carPicture.image}" id="car-image" class="card-img-top" alt="Car Image">
                                <div class="card-body">
                                    <h5 class="card-title"><span class="text-value">${car.make} ${car.model}</span></h5>
                                    <p class="card-text">Year: <span class="text-value">${car.year}</span></p>
                                    <p class="card-text">Price: <span class="text-value2">$${car.price}</span></p>
                                    <p class="card-text">Name of Seller: <span class="text-value">${car.user.name}</span></p>
                                    <!-- Bidding Button -->
                                    <form action="/carbidding" method="get">
                                        <input type="hidden" name="carId" value="${car.carId}">
                                        <button type="submit" id="button" class="btn btn-primary">Bid Now</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <c:if test="${noActiveCarsFound}">
                <div class="alert alert-danger" style="margin-bottom: 23%;" role="alert">
                    No cars found. Please try again!
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>