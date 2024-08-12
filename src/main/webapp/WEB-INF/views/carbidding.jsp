<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/carbidding.css">
<title>Car Biddings</title>
</head>
<body>

<%@ include file="header.jsp"%>
<div class="container" id="container">
    <h1 class="heading-text">Car Bidding</h1>

    <!-- Car Details and Bid Form -->
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="heading">Car Details</h2>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="data:image/jpeg;base64,${car.carPicture.image}" class="img-fluid" alt="Car Image">
                        </div>
                        <div class="col-md-8">
                            <p class="text">
                                Make: <strong class="strong-text">${car.make}</strong>
                            </p>
                            <p class="text">
                                Model: <strong class="strong-text">${car.model}</strong>
                            </p>
                            <p class="text">
                                Year: <strong class="strong-text">${car.year}</strong>
                            </p>
                            <p class="text">
                                Price: <strong class="strong-text" id="price">$${car.price}</strong>
                            </p>
                            <p class="text">
                                Seller: <strong class="strong-text">${car.user.name}</strong>
                            </p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="heading">Place A Bid</h2>
                </div>
                <div class="card-body">
                    <form action="/placeBid" method="post">
                        <input type="hidden" name="carId" value="${car.carId}">
                        <div class="mb-3">
                            <label for="bidName" class="form-label">Bidder Name</label>
                            <input type="text" class="form-control" placeholder="Enter Name" id="bidName" name="bidName" required>
                        </div>
                        <div class="mb-3">
                            <label for="bidPrice" class="form-label">Bidder Price</label>
                            <input type="number" class="form-control" placeholder="Enter Price" id="bidPrice" name="bidPrice" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" id="button" class="btn btn-outline-primary mb-2">Submit Bid</button>
                        </div>
                    </form>
						<!-- Error message display -->
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger mt-2 text-center" role="alert">
							${errorMessage}</div>
					</c:if>
				</div>
            </div>
        </div>
    </div>
    
<!-- Display Current Bids -->
<div class="row mt-4">
    <div class="col">
        <h2 class="heading">Current Bids</h2>
        
        <!-- Check if there are any bids for the car -->
        <c:if test="${empty carBiddings}">
            <div class="alert alert-info" role="alert" style="margin-bottom: 5%;">
                No bids have been placed for this car yet.
            </div>
        </c:if>
        
        <c:if test="${not empty carBiddings}">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Bidder Name</th>
                        <th scope="col">Bidder Price</th>
                        <th scope="col">Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bid" items="${carBiddings}">
                        <c:if test="${bid.bidStatus ne 'DENIED'}">
                            <tr>
                                <td>${bid.bidName}</td>
                                <td>$${bid.bidPrice}</td>
                                <td>${bid.bidDate}</td>
                                <td>
                                    <!-- Add action buttons if needed -->
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</div>

	
<%@ include file="footer.jsp"%>

</body>
</html>