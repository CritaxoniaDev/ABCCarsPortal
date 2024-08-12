<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Upload Picture</title>
	<link rel="stylesheet" href="/css/updateprofilepicture.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp"%>

<div class="container" id="container">
    <h1 class="heading-text">Upload a Profile Picture</h1>
    
    <!-- Profile Picture Upload Form -->
    <form action="uploadProfilePicture" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="mb-3">
            <label for="profilePicture" class="form-label">Choose Profile Picture:</label>
            <input type="file" class="form-control" id="profilePicture" name="profilePicture" required>
        </div>
        <button type="submit" id="button3" class="btn btn-outline-primary">Upload</button>
    </form>
</div>

<%@ include file="footer.jsp"%>


</body>
</html>