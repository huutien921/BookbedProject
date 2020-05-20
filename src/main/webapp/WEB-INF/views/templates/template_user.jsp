<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacation - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/style.css">
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Vacation<span>Travel
					Agency</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.html"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="destination.html"
						class="nav-link">Destination</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				<li class="nav-item dropdown">
      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Languages
      </a>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
        <a class="dropdown-item" href="https://v4-alpha.getbootstrap.com/">v4 Alpha 6</a>
        <a class="dropdown-item" href="https://getbootstrap.com/docs/3.3/">v3.3.7</a>
        <a class="dropdown-item" href="https://getbootstrap.com/2.3.2/">v2.3.2</a>
      </div>
    </li>

					<li class="nav-item cta"><a href="#" class="nav-link">Book
							Now</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<!-- footer -->
	<footer class="ftco-footer bg-bottom"
		style="background-image: url(${pageContext.request.contextPath }/resources/user/images/footer-bg.jpg);">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Vacation</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Infromation</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Online Enquiry</a></li>
							<li><a href="#" class="py-2 d-block">General Enquiries</a></li>
							<li><a href="#" class="py-2 d-block">Booking Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
							<li><a href="#" class="py-2 d-block">Refund Policy</a></li>
							<li><a href="#" class="py-2 d-block">Call Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Experience</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Adventure</a></li>
							<li><a href="#" class="py-2 d-block">Hotel and
									Restaurant</a></li>
							<li><a href="#" class="py-2 d-block">Beach</a></li>
							<li><a href="#" class="py-2 d-block">Nature</a></li>
							<li><a href="#" class="py-2 d-block">Camping</a></li>
							<li><a href="#" class="py-2 d-block">Party</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/google-map.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/user/js/main.js"></script>

</body>
</html>