<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <link rel="stylesheet" type="text/css" href="/css/registration.css">
    <title>Register</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <h1 class="heading">ABC Cars</h1>
                    <div class="card-body d-flex justify-content-between">
                        <h5 class="card-title mb-4" id="heading-text">Registration</h5>
                        <a id="back-to-home" href="index" class="btn btn-link"><i
                                class="fas fa-arrow-left"></i> Back to Home</a>
                    </div>
                    <div class="card-body">
                        <form id="registrationForm" action="registration" method="post">
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="name" class="form-label">Name:</label>
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Enter your name"
                                        required>
                                </div>
                                <div class="col">
                                    <label for="username" class="form-label">Username:</label>
                                    <input type="text" name="userName" class="form-control" id="username"
                                        placeholder="Enter your username" pattern="^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$" required>
                                    <div class="invalid-feedback">Username must be 8-16 characters long and contain at
                                        least, one number, and one special character.</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="email" class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="example@gmail.com"
                                        required>
								</div>
                                <div class="col">
                                    <label for="phone" class="form-label">Phone Number: <span
                                            class="text-muted">(Optional)</span></label>
                                    <input type="tel" name="phoneNumber" class="form-control" id="phone" placeholder="+63" pattern="[0-9]+"
                                        title="Please enter only numbers in the phone number field">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="password" class="form-label">Password:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="password" id="password"
                                            placeholder="Enter your password" required pattern=".{8,}"
                                            title="Password must be at least 8 characters long.">
                                        <button title="button" class="btn btn-outline-secondary" type="button"
                                            id="togglePassword">
                                            <i class="far fa-eye"></i>
                                        </button>
                                    </div>
                                    <div class="invalid-feedback">Password must be at least 8 characters long.</div>
                                </div>
                                <div class="col">
                                    <label for="confirmPassword" class="form-label">Confirm Password:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="confirmPassword"
                                            placeholder="Confirm your password" required>
                                        <button title="button" class="btn btn-outline-secondary" type="button"
                                            id="toggleConfirmPassword">
                                            <i class="far fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="terms" required>
                                I agree to the <a href="#" id="show-terms-modal" data-bs-toggle="modal" data-bs-target="#termsModal">Terms of Service</a> of ABC Cars Pte Ltd
                            </div>
							<c:if test="${not empty error}">
								<div class="text-danger text-center mb-2">${error}</div>
							</c:if>
                            <div class="text-center">
                                <button id="btn" type="submit" class="btn btn-primary">Register</button>
                            </div>
                            <p class="mt-3 mb-0">Already have an account? <a class="a"
                                    href="login">Go
                                    to Login</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="termsModalLabel">Terms of Service</h5>
                </div>
                <div class="modal-body">
  				    <p>Welcome to ABC Cars Pte Ltd. These terms and conditions outline the rules and regulations for the use of ABC Cars Pte Ltd's Website.</p>
    				<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use ABC Cars Pte Ltd's website if you do not agree to take all of the terms and conditions stated on this page.</p>
				</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btn">Close</button>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="/js/registration.js"></script>
</html>