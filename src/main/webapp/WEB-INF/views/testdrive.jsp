<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="/images/favicon.png">
<title>Test Drive</title>
</head>
<style>
#button {
	padding: 10px;
	margin-top: 10px;
	width: 35%;
	border-radius: 30px;
	font-family: "Alatsi", sans-serif;
}

#heading {
	font-family: "Manrope", sans-serif;
}
</style>

<body>

<%@ include file="header.jsp"%>

    <div class="container" style="margin-top: 7%; margin-bottom: 14%;">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Check for success message -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success text-center" role="alert">
                        ${successMessage}
                    </div>
                </c:if>
                <h1 class="mb-4 text-center" id="heading">Schedule Test Drive for<br> <span style="color: blue;">${carMake} ${carModel}</span></h1>
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center" style="margin-top: 1%; margin-bottom: 1%;">
                        <!-- Display car image -->
                        <img src="data:${imageFileType};base64,${carImage}" class="img-fluid"
                            alt="Car Image" style="max-height: 200px;">
                    </div>
                </div>
                <form action="scheduleTestDrive" method="post">
                    <div class="mb-3">
                        <label for="testDriveDate" class="form-label">Test Drive Date</label>
                        <input type="date" class="form-control" id="testDriveDate" name="testDriveDate" required>
                    </div>
                    <input type="hidden" name="carId" value="${carId}">
                    <input type="hidden" name="userId" value="${userId}">
                    <div class="text-center">
                        <button type="submit" id="button" class="btn btn-outline-primary btn-block">Schedule Test Drive</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<%@ include file="footer.jsp"%>

</body>
</html>