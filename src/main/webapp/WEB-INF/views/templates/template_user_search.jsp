<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>${title}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/user/images/bed.png">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/animate.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/magnific-popup.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/aos.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/ionicons.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/jquery.timepicker.css">


	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/search/style.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
		integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function () {

			var pathname = $(location).attr('href');
			pathname = pathname.replace('#searchR', '');
			pathname = pathname.replace('#', '');
			pathname = pathname.replace('?lang=vi', '');
			pathname = pathname.replace('?lang=us', '');
			pathname = pathname.replace('?lang=fr', '');
			pathname = pathname.replace('&lang=vi', '');
			pathname = pathname.replace('&lang=us', '');
			pathname = pathname.replace('&lang=fr', '');
			var checkPa = pathname.indexOf("?");
			var param = "?";
			if (checkPa > 1) {
				param = "&";
			}
			$('#vi').on('click', function () {

				location.href = pathname + param + 'lang=vi';

			})
			$('#us').on('click', function () {
				location.href = pathname + param + 'lang=us';

			})
			$('#fr').on('click', function () {
				location.href = pathname + param + 'lang=fr';

			})
		})
	</script>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
						<a href="${pageContext.request.contextPath }/home/index">
		<img alt="logo" src="${pageContext.request.contextPath }/resources/user/logos/bookbed_logo.png"style="width: 150px; height: 50px"/>
	</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${pageContext.request.contextPath }/home/index"
							class="nav-link">
							<spring:message code="nav.home"></spring:message>
						</a></li>
				
					<li class="nav-item"><a href="${pageContext.request.contextPath }/promotions" class="nav-link">
							<spring:message code="nav.promotions"></spring:message>
						</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/blog" class="nav-link">
							<spring:message code="nav.blog"></spring:message>
						</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/contact" class="nav-link">
							<spring:message code="nav.contact"></spring:message>
						</a></li>
					<li class="nav-item dropdown"><a class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<spring:message code="dropdown.language"></spring:message>
						</a>
						<div class="dropdown-menu dropdown-menu-right" id="dropdownLanguage"
							aria-labelledby="bd-versions">
							<a class="dropdown-item" href="#" id="vi">
								<spring:message code="dropdown.language.vietnamese"></spring:message>
							</a> <a class="dropdown-item" id="us" href="#">
								<spring:message code="dropdown.language.english"></spring:message>
							</a> <a class="dropdown-item" id="fr" href="#">
								<spring:message code="dropdown.language.french"></spring:message>
							</a>

						</div>
					</li>
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item cta"><a href="${pageContext.request.contextPath }/account/login"
								class="nav-link">
								<i class="fas fa-sign-in-alt"></i>
								<spring:message code="nav.login"></spring:message>
							</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item cta dropdown"><a class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="far fa-user-circle"></i>
								<sec:authentication property="name" />
								<!-- <spring:message code="nav.login"></spring:message> -->
							</a>
							<div class="dropdown-menu " aria-labelledby="dropdownMenu2">
								<a href="${pageContext.request.contextPath }/user/account/profile"><button
										class="dropdown-item" type="button"><i class="fas fa-user-cog"></i>
										<spring:message code="tag.account.change" /></button></a>
								<a href="${pageContext.request.contextPath }/user/account/surplus"><button
										class="dropdown-item" type="button"><i
											class="fas fa-credit-card"></i>
										<spring:message code="tag.account.surplus" /> </button></a>
								<a href="${pageContext.request.contextPath }/user/account/statusOrder"><button
										class="dropdown-item" type="button"><i class="far fa-file-alt"></i>
										<spring:message code="tag.account.booked" /></button></a>
								<a href="${pageContext.request.contextPath}/user/account/purchase/list"><button
										class="dropdown-item" type="button"><i
											class="fas fa-clipboard-list"></i>
										<spring:message code="tag.account.purchase" /> </button></a>
								<a href="${pageContext.request.contextPath}/user/account/editEmailNotification"><button
										class="dropdown-item" type="button"><i
											class="far fa-envelope"></i>
										<spring:message code="tag.account.promotion" /> </button></a>
										<a href="${pageContext.request.contextPath}/partner"><button
											class="dropdown-item" type="button"><i class="far fa-handshake"></i>
											<spring:message code="nav.partner" /> </button></a>
								<a href="${pageContext.request.contextPath }/account/logout"><button
										class="dropdown-item" type="button"><i class="fas fa-power-off"></i>
										<spring:message code="tag.account.logout" /></button></a>
							</div>
						</li>

					</sec:authorize>



				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap"
		style="background-image: url('${pageContext.request.contextPath }/uploads/images/slide/${panel.imageSrc == null ? "default.jpg" : panel.imageSrc }');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
				<div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">

				</div>
			</div>
		</div>
	</div>

	<tiles:insertAttribute name="content"></tiles:insertAttribute>

	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	<!-- loader -->
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/scrollax.min.js"></script>

	<script src="${pageContext.request.contextPath }/resources/user/search/main.js"></script>

</body>

</html>