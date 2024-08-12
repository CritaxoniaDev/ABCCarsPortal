<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
	<link rel="stylesheet" href="/css/userprofile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body class="body">

<%@ include file="header.jsp"%>

	<div id="container">

		<c:if test="${not empty successMessage}">
			<div id="successMessage"
				class="alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x"
				role="alert" style="margin-top: 5%;">
				<strong>Success! ${successMessage}</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>

		<div class="row align-items-center">
			<div class="col-xl-12 col-lg-12 col-md-12 col-12">
				<!-- Bg -->
				<div class="pt-20 rounded-top" id="background-profile"></div>
				<div class="card rounded-bottom smooth-shadow-sm">
					<div
						class="d-flex align-items-center justify-content-between
          pt-4 pb-6 px-4">
						<!-- avatar -->
						<div class="d-flex align-items-center">
							<div
								class="avatar-xxl avatar-indicators avatar-online me-2
              position-relative d-flex justify-content-end
              align-items-end mt-n10">
								<c:if test="${not empty profilePicture}">
									<!-- Render user's profile picture if profilePicture is not empty -->
									<img
										src="data:${profilePicture.fileType};base64,${profilePicture.image}"
										class="avatar-xxl rounded-circle border border-2"
										alt="Profile Picture">
								</c:if>
								<c:if test="${empty profilePicture}">
									<!-- Render default profile picture if profilePicture is empty -->
									<img src="/images/default-pic.jpg"
										class="avatar-xxl rounded-circle border border-2"
										alt="Default Profile Picture">
								</c:if>
								<a href="updateprofilepicture"
									class="position-absolute top-0 right-0 me-2 text-decoration-none">
									<i class="fas fa-camera" style="color: #715AFF; font-size: 27px;"></i>
								</a>
							</div>
							<!-- content -->
							<div class="lh-1">
								<h2 class="mb-2" id="name">${user.name}</h2>
								<p class="mb-0 d-block">${user.email}</p>
							</div>
						</div>
						<div>
							<!-- button -->
							<a href="editprofile"
								class="btn btn-outline-primary
              d-none d-md-block"
								id="button">Edit Profile</a>
						</div>
					</div>
					<!-- nav -->
					<ul class="nav nav-lt-tab px-4" id="pills-tab" role="tablist">
						<li class="nav-item"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Posted Cars Container -->
<div class="container" id="car-container">
    <h3 class="car-heading">Posted Cars</h3>

    <c:if test="${empty postedCars}">
        <div class="alert alert-danger" role="alert">You haven't posted any cars yet.</div>
    </c:if>

    <c:if test="${not empty postedCars}">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Car Id</th>
                        <th>Make</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${postedCars}" var="car">
                        <tr>
                            <td>${car.carId}</td>
                            <td>${car.make}</td>
                            <td>${car.model}</td>
                            <td>${car.year}</td>
                            <td>$${car.price}</td>
                            <td>${car.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>
	<%@ include file="footer.jsp"%>
  
</body>
</html>