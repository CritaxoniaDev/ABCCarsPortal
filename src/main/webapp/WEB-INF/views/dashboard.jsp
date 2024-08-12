<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="/css/dashboard.css">
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
</head>
<body>

<%@ include file="header.jsp"%>

  <!-- Dashboard Header -->
  <header class="dashboard-header text-center">
    <h1 class="heading-text">Welcome! <span id="span2">${name}</span></h1>
    <p class="sub-text">Find your dream car here in ABC Cars Pte Ltd!</p>
  </header>

  <!-- Dashboard Content -->
	<div class="dashboard-content">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" id="title">Search Cars</h5>
							<p class="card-text">Search for cars based on your
								preferences.</p>
							<a href="#" class="btn btn-primary"><i class="fas fa-search"></i>
								Search Now</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" id="title">Post a Car</h5>
							<p class="card-text">Sell your car quickly and easily.</p>
							<a href="carupload" class="btn btn-primary"><i class="fas fa-car"></i>
								Post Now</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" id="title">My Profile</h5>
							<p class="card-text">Update your profile information.</p>
							<a href="userprofile" class="btn btn-primary"><i class="fas fa-user"></i>
								View Profile</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<div class="container" id="container">
    <h1 class="mb-4 text-center" id="heading-text">Posted Cars For Sale</h1>
    
    <%-- Check if the list of cars is empty --%>
    <c:if test="${empty cars}">
        <div class="alert alert-warning" role="alert">
            No cars uploaded yet.
        </div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-3" style="margin-bottom: 5%;">
        <c:forEach items="${cars}" var="car">
            <%-- Check if the car status is ACTIVE and bidStatus is not APPROVED --%>
            <c:if test="${car.status eq 'ACTIVE' && car.carBidding[0].bidStatus ne 'APPROVED'}">
                <div class="col">
                    <div class="card" id="card">
                        <img src="data:image/jpeg;base64,${car.carPicture.image}" id="car-image" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title" id="card-title"><span class="text-value">${car.make} ${car.model}</span></h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="card-text" id="card-text">
                                        Year: <span class="text-value">${car.year}</span>
                                    </p>
                                    <p class="card-text" id="card-text">
                                        Price: <span class="text-value2">$${car.price}</span>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="card-text" id="card-text">
                                        Status: <span class="text-value">${car.status}</span>
                                    </p>
                                    <p class="card-text" id="card-text">
                                        Seller: <span class="text-value">${car.user.name}</span>
                                    </p>
                                </div>
                            </div>
                            <!-- Add any other car details you want to display -->

                            <!-- Button to redirect to updatecar.jsp -->
                            <c:if test="${car.user.userName eq userName}">
                                <a href="updatecar?carId=${car.carId}" class="btn btn-primary" id="btn">Update</a>
                                <!-- Form for toggling car status -->
                            </c:if>

                            <!-- Bid Now button for other cars -->
                            <c:if test="${car.user.userName ne userName}">
                                <form action="/carbidding" method="get" style="display: inline;">
                                    <input type="hidden" name="carId" value="${car.carId}">
                                    <button type="submit" class="btn btn-primary" id="btn">Bid Now</button>
                                </form>
                                
                                <!-- Test Drive button -->
                                <form action="testdrive" method="get" style="display: inline;">
                                    <input type="hidden" name="carId" value="${car.carId}">
                                    <button type="submit" class="btn btn-outline-secondary" id="btn">Test Drive</button>
                                </form>
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