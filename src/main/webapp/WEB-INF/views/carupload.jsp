<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/carupload.css">
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<title>Post A Car</title>
</head>

<body>

<%@ include file="header.jsp"%>

<div class="container" id="container">
    <h1 class="heading-text">Post A Car</h1>
    <form action="/uploadCar" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="make" class="form-label">Make</label>
                    <input type="text" class="form-control" placeholder="Enter Make" id="make" name="make" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="model" class="form-label">Model</label>
                    <input type="text" class="form-control" placeholder="Enter Model" id="model" name="model" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="year" class="form-label">Year</label>
                    <input type="text" class="form-control" placeholder="Enter Year" id="year" name="year" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="text" class="form-control" placeholder="Enter Price" id="price" name="price" required>
                </div>
            </div>
        </div>
        <!-- Car picture upload section -->
        <div class="mb-3">
            <label for="file" class="form-label">Car Picture</label>
            <input type="file" class="form-control" id="file" name="file" accept="image/*" required>
        </div>
        <!-- End of car picture upload section -->
        <div class="text-center">
        <button type="submit" id="button" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>
    
<%@ include file="footer.jsp"%>
</body>
</html>