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
	<link rel="icon" href="${pageContext.request.contextPath }/resources/user/images/bed.png">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
		integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top" style="border-bottom: 1px solid #d9dfe9;" id="mainNav">
        <div class="container">
          <a href="${pageContext.request.contextPath }/home/index">
            <img alt="logo" src="${pageContext.request.contextPath }/resources/user/logos/bookbed_logo.png" style="width: 150px" height="50px"/>
          </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        Dan Thy
                    </li>
                
                </ul>
            </div>
        </div>
    </nav>

	<!-- END nav -->

	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<!-- footer -->
	
	<!-- loader -->


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

	<script src="${pageContext.request.contextPath }/resources/user/js/main.js"></script>

</body>

</html>