<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="/css/aboutus.css">
	<link rel="icon" type="image/x-icon" href="/images/favicon.png">
	<title>About Us</title>
</head>
<body class="body">

<%@ include file="header.jsp"%>

<section class="py-3 py-md-5 py-xl-8">
  <div class="container">
    <div class="row">
      <div class="col-12 col-md-10 col-lg-8">
        <h3 class="fs-5 mb-2 text-secondary text-uppercase">About ABC Cars Portal</h3>
					<h2 class="display-5 mb-4">
						We are<span id="span-1"> dedicated</span> on pushing the
						boundaries of<span id="span-3"> automotive</span> innovation,<span
							id="span-2"> embracing</span> the unknown, and<span id="span-4">
							cultivating</span> a culture of<span id="span-5"> perpetual
							learning</span>. Our core values drive us to<span id="span-6">
							constantly</span> explore new <span id="span-7"> horizons</span> and
						pioneer groundbreaking<span id="span-8"> solutions</span> in the<span
							id="span-2"> automotive </span>industry.
					</h2>
			   </div>
    	</div>
  </div>

  <div class="container" id="container">
    <div class="row gy-3 gy-md-4 gy-lg-0">
      <div class="col-12 col-lg-6">
        <div class="card bg-light p-3 m-0">
          <div class="row gy-3 gy-md-0 align-items-md-center">
            <div class="col-md-5">
              <img src="./assets/img/about-img-2.jpg" class="img-fluid rounded-start" alt="Why Choose Us?">
            </div>
            <div class="col-md-7">
              <div class="card-body p-0">
                <h2 class="card-title h4 mb-3">Why Choose Us?</h2>
                <p class="card-text lead">With years of experience and deep industry knowledge, we have a proven track record of success and are pushing ourselves to stay ahead of the curve.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-lg-6">
        <div class="card bg-light p-3 m-0">
          <div class="row gy-3 gy-md-0 align-items-md-center">
            <div class="col-md-5">
              <img src="./assets/img/about-img-1.jpg" class="img-fluid rounded-start" alt="Visionary Team">
            </div>
            <div class="col-md-7">
              <div class="card-body p-0">
                <h2 class="card-title h4 mb-3">Visionary Team</h2>
                <p class="card-text lead">With a team of visionary engineers, developers, and creative minds, we embark on a journey to transform complex challenges into ingenious technological solutions.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="footer.jsp"%>

</body>
</html>