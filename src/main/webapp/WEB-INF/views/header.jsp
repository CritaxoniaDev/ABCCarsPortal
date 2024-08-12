<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/header.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - ABC</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
</head>
<body>

<%-- Common part for both navigation bars --%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container">
        <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
            <a class="navbar-brand" href="dashboard">ABC Cars</a>
        </sec:authorize>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center"
             id="navbarNav">
            <ul class="navbar-nav">
                <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                    <li class="nav-item">
                        <a href="userprofile" class="nav-link">
                            <i class="fas fa-user"></i> Profile
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCar"
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-car"></i> Car Listing
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownCar">
                            <li><a class="dropdown-item" href="carupload"><i class="fas fa-upload"></i> Upload Car</a></li>
                            <li><a class="dropdown-item" href="mycars"><i class="fas fa-car"></i> My Cars</a></li>
                            <li><a class="dropdown-item" href="approvecars"><i class="fas fa-check"></i> Sold Cars</a></li>
                        </ul>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                    <li class="nav-item">
                        <a href="aboutus" class="nav-link">
                            <i class="fas fa-info-circle"></i> About Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="contactus" class="nav-link">
                            <i class="fas fa-envelope"></i> Contact Us
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-cogs"></i> Management
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="carmanagement"><i class="fas fa-car"></i> Car Management</a></li>
                            <li><a class="dropdown-item" href="usermanagement"><i class="fas fa-users"></i> User Management</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </ul>
        </div>
        <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
            <form action="search" method="get" class="d-flex" id="search-bar">
                <input class="form-control me-2" type="search" name="keyword"
                       placeholder="Search Make, Model, Year, or Price"
                       aria-label="Search">
                <button class="btn btn-success" id="search-btn" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
            <form action="logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}">
                <div class="navbar-nav ms-auto">
                    <button id="btn" class="btn btn-outline-danger" role="button">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </div>
            </form>
        </sec:authorize>
    </div>
</nav>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</html>