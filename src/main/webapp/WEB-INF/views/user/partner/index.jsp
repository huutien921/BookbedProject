<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Partner</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/resources/partner/vendor/bootstrap/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/resources/partner/css/scrolling-nav.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav">
        <div class="container">
            <a href="${pageContext.request.contextPath }/home/index">
                <img alt="logo" src="${pageContext.request.contextPath }/resources/user/logos/bookbed_logo.png"
                    style="width: 150px" height="50px" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#started">Get started</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#how-to">How to partner</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section id="started">
        <div class="container">
            <div class="row align-items-center my-5">
                <div class="col-lg-7">
                  <img class="img-fluid rounded mb-4 mb-lg-0" src="${pageContext.request.contextPath }/uploads/images/slide/${panel.imageSrc}" alt="">
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-5">
                  <h1 class="font-weight-light">${panel.title}</h1>
                  <p>${panel.content}</p>
                  <a class="btn btn-primary" href="${pageContext.request.contextPath }/partner/createHotel">Get started</a>
                </div>
                <!-- /.col-md-4 -->
              </div>
        </div>
    </section>

    <section id="how-to" class="bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 order-lg-2">
                  <div class="p-5">
                    <img class="img-fluid rounded-circle" src="https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/74785068_2472417629713139_292938609495900160_n.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=If69aruH4boAX-qaKz1&_nc_ht=scontent.fhan2-1.fna&oh=d7feead07a5296a5224af27e0072cd1c&oe=5F5DC094" alt="">
                  </div>
                </div>
                <div class="col-lg-6 order-lg-1">
                  <div class="p-5">
                    <h2 class="display-4">For those about to rock...</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                  </div>
                </div>
              </div>
              <div class="row align-items-center">
                <div class="col-lg-6 ">
                  <div class="p-5">
                    <img class="img-fluid rounded-circle" src="https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/74785068_2472417629713139_292938609495900160_n.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=If69aruH4boAX-qaKz1&_nc_ht=scontent.fhan2-1.fna&oh=d7feead07a5296a5224af27e0072cd1c&oe=5F5DC094" alt="">
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="p-5">
                    <h2 class="display-4">For those about to rock...</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                  </div>
                </div>
              </div>
        </div>
    </section>

    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 my-auto">
                  <div class="device-container">
                    <div class="device-mockup iphone6_plus portrait white">
                      <div class="device">
                        <div class="screen">
                          <!-- Demo image for screen mockup, you can put an image here, some HTML, an animation, video, or anything else! -->
                          <img class="img-fluid " src="https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/74785068_2472417629713139_292938609495900160_n.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=If69aruH4boAX-qaKz1&_nc_ht=scontent.fhan2-1.fna&oh=d7feead07a5296a5224af27e0072cd1c&oe=5F5DC094" alt="">
                        </div>
                        <div class="button">
                          <!-- You can hook the "home button" to some JavaScript events or just remove it -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-8 my-auto">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="feature-item" >
                            <img class="img-fluid rounded-circle" src="https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/74785068_2472417629713139_292938609495900160_n.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=If69aruH4boAX-qaKz1&_nc_ht=scontent.fhan2-1.fna&oh=d7feead07a5296a5224af27e0072cd1c&oe=5F5DC094" alt="" style="width: 50px;">
                          <h3>Device Mockups</h3>
                          <p class="text-muted">Ready to use HTML/CSS device mockups, no Photoshop required!</p>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="feature-item">
                          <i class="icon-camera text-primary"></i>
                          <h3>Flexible Use</h3>
                          <p class="text-muted">Put an image, video, animation, or anything else in the screen!</p>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="feature-item">
                          <i class="icon-present text-primary"></i>
                          <h3>Free to Use</h3>
                          <p class="text-muted">As always, this theme is free to download and use for any purpose!</p>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="feature-item">
                          <i class="icon-lock-open text-primary"></i>
                          <h3>Open Source</h3>
                          <p class="text-muted">Since this theme is MIT licensed, you can use it commercially!</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/partner/vendor/jquery/jquery.min.js"></script>
    <script
        src="${pageContext.request.contextPath }/resources/partner/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script
        src="${pageContext.request.contextPath }/resources/partner/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom JavaScript for this theme -->
    <script src="${pageContext.request.contextPath }/resources/partner/js/scrolling-nav.js"></script>

</body>

</html>