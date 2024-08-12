<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>ABC Cars Portal</title>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">ABC Cars</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a href="login" class="btn btn-outline-primary" role="button">Log In</a>
                    </li>
                    <li class="nav-item" id="button">
                        <a href="registration" class="btn btn-primary" role="button">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid h-100" id="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="col-md-6 text-center">
                <div class="jumbotron">
                    <h1 class="heading-text-1">Welcome to ABC Cars Portal</h1>
                    <p class="subtext text-muted">Where you can Post, Sell and Bid, and buy a car today!</p>
                    <a class="btn btn-primary btn-lg" href="login" role="button" id="button-join-now">Join Now!</a>
                </div>
            </div>
        </div>
    </div>

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h1 class="heading-text">Bid and Post your Used Car</h1>
                                    <p class="lead">Find your dream car or Start Selling today! With our exclusive deals
                                        and personalized service, you'll find the perfect vehicle tailored to your
                                        needs.</p>
                                    <a class="btn btn-outline-primary btn-lg" href="#" role="button"
                                        id="get-started-button">Get Started!</a>
                                </div>
                                <div class="col-md-6">
                                    <img src="/images/main-pic.jpg" class="img-fluid" alt="Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Second carousel item with similar layout -->
            <div class="carousel-item">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h1 class="heading-text">Start Selling Cars Today at ABC</h1>
                                    <p class="lead">Discover the ABC difference in car sales. Don't miss out on the
                                        opportunity to own your dream car today.</p>
                                    <a class="btn btn-outline-primary btn-lg" href="#" role="button">Sell Cars Today </a>
                                </div>
                                <div class="col-md-6">
                                    <img src="/images/pic-2.jpg" class="img-fluid" alt="Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Third Carousel -->
            <div class="carousel-item">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h1 class="heading-text">See some used Cars</h1>
                                    <p class="lead">Discover the ABC in some posted used cars with their price.</p>
                                    <a class="btn btn-outline-primary btn-lg" href="#" role="button">See Posts</a>
                                </div>
                                <div class="col-md-6">
                                    <img src="/images/pic-2.jpg" class="img-fluid" alt="Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <footer class="text-center text-lg-start text-white" id="footer">
        <!-- Grid container -->
        <div class="container p-4 pb-0">
            <!-- Section: Links -->
            <section class="">
                <!--Grid row-->
                <div class="row">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">
                            ABC Cars pte ltd
                        </h6>
                        <p>
                            Welcome to ABC Cars Pte Ltd, your premier destination for buying and selling quality used
                            cars. Our mission is to provide customers with a seamless car shopping experience by
                            offering a wide selection of vehicles, transparent pricing, and exceptional customer
                            service.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">SERVICES</h6>
                        <p>
                            <a class="text-white">Buy</a>
                        </p>
                        <p>
                            <a class="text-white">Bidding</a>
                        </p>
                        <p>
                            <a class="text-white">BrandFlow</a>
                        </p>
                        <p>
                            <a class="text-white">Selling</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">
                            Useful links
                        </h6>
                        <p>
                            <a class="text-white">Your Account</a>
                        </p>
                        <p>
                            <a class="text-white">Become an Affiliate</a>
                        </p>
                        <p>
                            <a class="text-white">Shipping Rates</a>
                        </p>
                        <p>
                            <a class="text-white">Help</a>
                        </p>
                    </div>

                    <!-- Grid column -->
                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Contact Us</h6>
                        <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                        <p><i class="fas fa-envelope mr-3"></i> abc@gmail.com</p>
                        <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-fax mr-3"></i> + 01 234 567 89</p> <!-- Changed from fa-print to fa-fax -->
                    </div>
                    <!-- Grid column -->
                </div>
                <!--Grid row-->
            </section>
            <!-- Section: Links -->

            <hr class="my-3">

            <!-- Section: Copyright -->
            <section class="p-3 pt-0">
                <div class="row d-flex align-items-center">
                    <!-- Grid column -->
                    <div class="col-md-7 col-lg-8 text-center text-md-start">
                        <!-- Copyright -->
                        <div class="p-3">
                            © 2024 Copyright:
                            <a class="text-white" href="#">ABC Cars Pte Ltd</a>
                        </div>
                        <!-- Copyright -->
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
                        <!-- Facebook -->
                        <a class="btn btn-outline-light btn-floating m-1" aria-hidden="true" class="text-white"
                            role="button"><i class="fab fa-facebook-f"></i></a>

                        <!-- Twitter -->
                        <a class="btn btn-outline-light btn-floating m-1" aria-hidden="true" class="text-white"
                            role="button"><i class="fab fa-twitter"></i></a>

                        <!-- Google -->
                        <a class="btn btn-outline-light btn-floating m-1" aria-hidden="true" class="text-white"
                            role="button"><i class="fab fa-google"></i></a>

                        <!-- Instagram -->
                        <a class="btn btn-outline-light btn-floating m-1" aria-hidden="true" class="text-white"
                            role="button"><i class="fab fa-instagram"></i></a>
                    </div>
                    <!-- Grid column -->
                </div>
            </section>
            <!-- Section: Copyright -->
        </div>
        <!-- Grid container -->
    </footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</html>