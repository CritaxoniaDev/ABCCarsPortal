<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Management</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<link rel="stylesheet" href="/css/carmanagement.css">
</head>
<body>

<%@ include file="header.jsp"%>

<div class="jumbotron" id="head-text">
    <h3 class="text-center" id="text">ABC Cars</h3>
    <h1 class="text-center" id="heading">Car Management</h1>
</div>

<div class="container" id="container">
    <h2 class="head-table">User Cars</h2>
    <table class="table">
    <thead>
        <tr class="heading-usercartext">
            <th scope="col">Car ID</th>
            <th scope="col">Make</th>
            <th scope="col">Model</th>
            <th scope="col">Price</th>
            <th scope="col">Year</th>
            <th scope="col">Poster</th>
            <th scope="col">Status</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="car" items="${userCars}">
            <c:if test="${car.status != 'ACTIVE' || not car.hasApprovedBid}">
                <tr>
                    <td class="text">${car.carId}</td>
                    <td class="text">${car.make}</td>
                    <td class="text">${car.model}</td>
                    <td class="price-table">$${car.price}</td>
                    <td class="text">${car.year}</td>
                    <td class="text">${car.user.name}</td>
                    <td class="text">${car.status}</td>
                    <td>
                        <form action="/toggleadminStatus" method="post">
                            <input type="hidden" name="carId" value="${car.carId}">
                            <button type="submit" id="btn"
                                class="btn ${car.status == 'ACTIVE' ? 'btn-outline-danger' : 'btn-outline-success'}">
                                ${car.status == 'ACTIVE' ? 'Deactivate' : 'Activate'}</button>
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>

<h2 class="head-table">Test Drives</h2>
<table class="table">
    <thead>
        <tr class="heading-usercartext">
            <th scope="col">Test Drive ID</th>
            <th scope="col">Test Drive Date</th>
            <th scope="col">User</th>
            <th scope="col">Car</th>
            <th scope="col">Status</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="testDrive" items="${testDrives}">
            <tr>
                <td class="text">${testDrive.testDriveId}</td>
                <td class="text">${testDrive.date}</td>
                <td class="text">${testDrive.user.name}</td>
                <td class="text">${testDrive.car.make} ${testDrive.car.model}</td>
                <td class="text">${testDrive.testDriveStatus}</td>
                <td>
                    <c:choose>
                        <c:when test="${testDrive.testDriveStatus eq 'APPROVED'}">
                            <button type="button" class="btn btn-success" disabled>Approved</button>
                        </c:when>
                        <c:when test="${testDrive.testDriveStatus eq 'DENIED'}">
                            <button type="button" class="btn btn-danger" disabled>Denied</button>
                        </c:when>
                        <c:otherwise>
                            <form action="approveTestDrive" method="post" style="display: inline;">
                                <input type="hidden" name="testDriveId" value="${testDrive.testDriveId}">
                                <button type="submit" id="btn" class="btn btn-outline-success"><i class="bi bi-check-circle"></i> Approve</button>
                            </form>
                            <form action="denyTestDrive" method="post" style="display: inline;">
                                <input type="hidden" name="testDriveId" value="${testDrive.testDriveId}">
                                <button type="submit" id="btn" class="btn btn-outline-danger"><i class="bi bi-x-circle"></i> Deny</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    
    <h2 class="head-table">List of Bidders</h2>
    <table class="table">
        <thead>
            <tr class="heading-usercartext">
                <th scope="col">Bidding Id</th>
                <th scope="col">Car</th>
                <th scope="col">Seller</th>
                <th scope="col">Bidder Name</th>
                <th scope="col">Bidder Price</th>
                <th scope="col">Date</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bid" items="${biddings}">
                <tr>
                    <td class="text">${bid.idCarBid}</td>
                    <td class="text">${bid.car.make} ${bid.car.model}</td>
                    <td class="text">${bid.car.user.name}</td>
                    <td class="text">${bid.bidName}</td>
                    <td class="price-table">$${bid.bidPrice}</td>
                    <td class="text">${bid.bidDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${bid.bidStatus eq 'APPROVED'}">
                                <button type="button" id="btn" class="btn btn-success" disabled>Bidding Approved</button>
                            </c:when>
                            <c:when test="${bid.bidStatus eq 'DENIED'}">
                                <button type="button" id="btn" class="btn btn-danger" disabled>Bidding Denied</button>
                            </c:when>
                            <c:otherwise>
                                <form action="/approveBid" method="post" style="display: inline;">
                                    <input type="hidden" name="bidId" value="${bid.idCarBid}">
                                    <button type="submit" id="btn" class="btn btn-outline-success"><i class="bi bi-check-circle"></i> Approve</button>
                                </form>
                                <form action="/denyBid" method="post" style="display: inline;">
                                    <input type="hidden" name="bidId" value="${bid.idCarBid}">
                                    <button type="submit" id="btn" class="btn btn-danger"><i class="bi bi-x-circle"></i> Deny</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>