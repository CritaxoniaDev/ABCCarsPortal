<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit</title>
	<link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/editprofile.css">
</head>
<body>

<%@ include file="header.jsp"%>

	<div class="container" id="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header" id="header">
                        <h5 class="card-title mb-0 p-2" id="heading-text">Edit Profile</h5>
                    </div>
                    <div class="card-body">
                        <form:form action="editprofile" modelAttribute="user" method="post">
                        <input type="hidden" name="id" value="${user.id}" />
                            <div class="row mb-1">
                                <div class="col">
                                    <label for="id" class="form-label" id="id">User ID</label>
                                    <input type="text" value="${user.id}" class="form-control" id="id" disabled>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" value="${user.name}" name="name" class="form-control" id="name">
                                </div>
                            </div>
							<div class="row mb-3">
                                <div class="col">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" value="${user.userName}" name="userName" class="form-control" id="username">
                                </div>
                                <div class="col">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" value="${user.email}" name="email" class="form-control" id="email" disabled>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="tel" value="${user.phoneNumber}" name="phoneNumber" class="form-control" id="phone">
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" id="button" class="btn btn-outline-primary">Save Changes</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="footer.jsp"%>

</body>
</html>