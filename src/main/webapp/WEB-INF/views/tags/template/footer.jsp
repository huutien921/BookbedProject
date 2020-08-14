<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<footer class="ftco-footer bg-bottom"
    style="background-image: url('${pageContext.request.contextPath }/uploads/images/footer/${about.image}');">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2"><img alt="logo"
                            src="${pageContext.request.contextPath }/resources/user/logos/bookbed_logo.png"
                            style="width: 150px ;height: 50px"></h2>
                    <a href="${pageContext.request.contextPath }/partner" class="partner_a">
                        <div
                            style="border: 2px solid #fff;padding: 8px;border-radius: 10px;width: 230px;align-items: center;">
                            <div><img 
                                    src="${pageContext.request.contextPath }/resources/user/images/partner.png"
                                    style="width: 36px; height: 36px;">
                                <span><spring:message code="footer.partner" /></span>
                            </div>
                        </div>
                    </a>

                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate fadeInUp ftco-animated"><a href="${about.twitter}"><span
                                    class="icon-twitter"></span></a></li>
                        <li class="ftco-animate fadeInUp ftco-animated"><a href="${about.facebook}"><span
                                    class="icon-facebook"></span></a></li>
                        <li class="ftco-animate fadeInUp ftco-animated"><a href="${about.instagram}"><span
                                    class="icon-instagram"></span></a></li>
                        <li class="ftco-animate fadeInUp ftco-animated"><a href="${about.instagram}"><span
                                    class="icon-youtube"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-5">
                    <h2 class="ftco-heading-2"><spring:message code="footer.about.bookbed" /></h2>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath }/blog/about-us" class="py-2 d-block"><spring:message code="footer.about" /></a></li>
                        <li><a href="${pageContext.request.contextPath }/promotion" class="py-2 d-block"><spring:message code="footer.promotion" /></a></li>
                        <li><a href="${pageContext.request.contextPath }/blog" class="py-2 d-block"><spring:message code="footer.blog" /></a></li>
                        <li><a href="${pageContext.request.contextPath }/contact" class="py-2 d-block"><spring:message code="footer.contact" /></a></li>
                        <li><a href="${pageContext.request.contextPath }/hotel/category" class="py-2 d-block"><spring:message code="footer.popularHotel" /></a></li>
                        <li><a href="${pageContext.request.contextPath }/hotel/apartment" class="py-2 d-block"><spring:message code="footer.apartment" /></a></li>
                       
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2"><spring:message code="footer.other" /></h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block"><spring:message code="footer.other.booking" /></a></li>
                        <li><a href="#" class="py-2 d-block"><spring:message code="footer.other.security" /></a></li>
                        <li><a href="#" class="py-2 d-block"><spring:message code="footer.other.rules" /></a></li>
                      
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2"><spring:message code="footer.headquarters" /></h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">${about.address}</span></li>
                            <li><span class="icon icon-phone"></span><span class="text">${about.phone}</span></li>
                            <li><span class="icon icon-envelope"></span><span
                                        class="text">${about.email}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="ftco-footer-widget mb-4">
                    <h2 style="margin-bottom: 5px;"><spring:message code="footer.app" /></h2>
                    <div class="block-23 mb-3">
                        <ul>
                           
                            <li style="margin-bottom: 0px;"><a href="${about.android}"><img alt="logo"
                                src="${pageContext.request.contextPath }/resources/user/images/android.png"
                                style="width: 112px;height: 33px;"></a></li>
                            <li><a href="${about.ios}"><img alt="logo"
                                src="${pageContext.request.contextPath }/resources/user/images/ios.png"
                                style="width: 112px;height: 33px;"></a></li>
                         
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  
        <div class="row">
            <div class="col-md-12 text-center">

                <p>
                  
                    Copyright ©
                    <script>document.write(new Date().getFullYear());</script> Bookbed 
                   
                </p>
            </div>
        </div>
    </div>
</footer>