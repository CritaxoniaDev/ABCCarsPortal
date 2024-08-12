<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/login.css">
    <title>Login</title>
</head>
<body>

<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <h1 class="heading">ABC Cars</h1>
                    <div class="card-body d-flex justify-content-between" id="heading-content">
                        <h5 class="card-title mb-4" id="heading-text">Login</h5>
                        <a id="a" href="index" class="btn btn-link"><i
                                class="fas fa-arrow-left"></i> Back to Home</a>
                    </div>
                    <div class="card-body">
                        <form method="post" action="login">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username:</label>
                                <input type="text" name="username" class="form-control" id="username" placeholder="Enter your username" required="true">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <div class="input-group">
                                    <input type="password" name="password" class="form-control" id="password"
                                        placeholder="Enter your password" required="true">
                                    <button title="button" class="btn btn-outline-secondary" type="button"
                                        id="togglePassword">
                                        <i class="far fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="text-center">
                                <button id="btn" type="submit" class="btn btn-outline-primary">Log In</button>
                            </div>
							<c:if test="${error_string != null}">
								<p class="text-danger mt-2 text-center">${error_string}</p>
							</c:if>
							<p class="mt-3 mb-0">Don't have an account? <a class="a"
                                    href="registration">Register Now!</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="/js/login.js"></script>
</html>