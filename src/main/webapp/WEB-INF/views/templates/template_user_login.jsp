<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${title}</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/user/images/bed.png">
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

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
		integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/css/style.css">
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="${pageContext.request.contextPath }/home/index">
		<img alt="logo" src="${pageContext.request.contextPath }/resources/user/logos/bookbed_logo.png" style="width: 150px" height="50px"/>
	</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${pageContext.request.contextPath }/home/index"
						class="nav-link"><spring:message code="nav.home"></spring:message></a></li>
				
					<li class="nav-item"><a href="${pageContext.request.contextPath }/promotions"
						class="nav-link"><spring:message code="nav.promotions"></spring:message></a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/blog" class="nav-link"><spring:message
								code="nav.blog"></spring:message></a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/contact" class="nav-link"><spring:message
								code="nav.contact"></spring:message></a></li>
					<li class="nav-item dropdown"><a
						class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<spring:message code="dropdown.language"></spring:message>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="bd-versions">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }${requestScope['javax.servlet.forward.request_uri']}?lang=vi"><spring:message
									code="dropdown.language.vietnamese"></spring:message></a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath }${requestScope['javax.servlet.forward.request_uri']}?lang=us"><spring:message
									code="dropdown.language.english"></spring:message></a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath }${requestScope['javax.servlet.forward.request_uri']}?lang=fr"><spring:message
									code="dropdown.language.french"></spring:message></a>

						</div></li>

				
					

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		src="${pageContext.request.contextPath }/resources/user/js/main.js"></script>

</body>
</html>