<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Custom styles for error page */
        body {
            padding-top: 5rem;
            padding-bottom: 5rem;
            background-color: #f8f9fa;
            text-align: center;
        }

        .error-container {
            margin-bottom: 2rem;
        }

        /* Style for the image */
        .broken-robot {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <!-- Image of a destroyed robot -->
        <img src="https://example.com/destroyed_robot_image.jpg" alt="Destroyed Robot" class="broken-robot">
        <h1 class="display-4">404 Error</h1>
        <p class="lead">Page not found</p>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>