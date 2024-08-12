<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Car</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
</head>
<style>
#heading {
	font-family: "Manrope", sans-serif;
	font-size: 45px;
}

.form-label {
	font-family: "Roboto Condensed", sans-serif;
	font-weight: 600; 
}

#container {
	margin-top: 80px;
	margin-bottom: 100px;
}

#button {
	padding: 8px;
    width: 24%;
    border-radius: 30px;
    font-family: "Alatsi", sans-serif;
}
</style>
<body>

<%@ include file="header.jsp"%>

<div class="container" id="container">
    <h1 class="text-center" id="heading">Update Car</h1>
    <form action="updateCar" method="post" enctype="multipart/form-data">
        <input type="hidden" name="carId" value="${car.carId}">
        <div class="row mb-4 mt-4">
            <div class="col-md-6">
                <label for="make" class="form-label">Make</label>
                <input type="text" class="form-control" id="make" name="make" placeholder="New Make" value="${car.make}">
            </div>
            <div class="col-md-6">
                <label for="model" class="form-label">Model</label>
                <input type="text" class="form-control" id="model" name="model" placeholder="New Model" value="${car.model}">
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-md-6">
                <label for="year" class="form-label">Year</label>
                <input type="text" class="form-control" id="year" name="year" placeholder="New Year" value="${car.year}">
            </div>
            <div class="col-md-6">
                <label for="price" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" disabled name="price" placeholder="New Price" value="${car.price}">
            </div>
        </div>
        <!-- Car picture upload section -->
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="file" class="form-label">Car Picture</label>
                <input type="file" class="form-control" id="file" name="file" accept="image/*" required>
            </div>
        </div>
        <!-- End of car picture upload section -->
        <div class="row">
            <div class="col text-center mt-3">
                <button type="submit" id="button" class="btn btn-outline-primary">Save changes</button>
            </div>
        </div>
    </form>
</div>


<%@ include file="footer.jsp"%>

</body>
</html>