<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <!-- Bootstrap CSS -->
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/contactus.css">
</head>
<body class="body">

<%@ include file="header.jsp"%>

    <div class="container" id="contact-container">
        <h1 class="text-center" id="head-text">Contact Us</h1>
        <h2 class="text-center" id="sub-text">Feel free to reach out to us for any inquiries or feedback!</h2>
        <div class="row">
            <!-- Contact Form -->
            <div class="col-md-6">
                <form>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Your Name" id="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="Your Email" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <textarea class="form-control" id="message" placeholder="Message Here" rows="5" required></textarea>
                    </div>
                    <div class="text-center">
                    <button type="submit" id="button" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
            <!-- Google Map -->
            <div class="col-md-6">
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3318.593027149648!2d-122.08425988487315!3d37.42284827979905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808580abaa80880f%3A0x6d24bb1a32b0cf7d!2sGolden%20Gate%20Bridge!5e0!3m2!1sen!2sus!4v1649776893333!5m2!1sen!2sus" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>

<%@ include file="footer.jsp"%>

</body>
</html>