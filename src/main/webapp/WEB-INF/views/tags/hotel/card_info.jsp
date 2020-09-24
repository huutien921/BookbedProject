<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="card mb-4 py-3 border-bottom-primary  ">
    <div class="card-body">
        <div class="text-center">
            <img class="border border-primary rounded-circle"
                src="${pageContext.request.contextPath }/uploads/images/rooms/${hotel.image} ">
        </div>

        <h5 class="text-center">${hotel.name }</h5>

        <c:if test="${hotel.accountByIdAcEmployee == null }">
            <p class="text-center status">
                <i class="fa fa-fw fa-hourglass"></i>
                <spring:message code="partner.hotel.awaiting" />
            </p>

        </c:if>
        <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == true }">
            <p class="text-muted text-center" style="color: #0033cc;">
                <i class="fa fa-fw fa-check-square"></i>
                <spring:message code="partner.hotel.active" />
            </p>

        </c:if>

        <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == false }">
            <p class="text-muted text-center" style="color: #ff0000;">
                <i class="fa fa-fw fa-times"></i>
                <spring:message code="partner.hotel.prohibit" />
            </p>

        </c:if>
        <c:set var="amountRoom" value="0"></c:set>
        <c:set var="roomAvailable" value="0"></c:set>
        <c:forEach var="room" items="${hotel.rooms }">
            <c:if test="${room.status !=null && room.status ==true}">
                <c:set var="amountRoom" value="${amountRoom + room.amountOfRoom }"></c:set>
            </c:if>
            <c:forEach var="orderdetail" items="${room.orderDetails }">
                <c:if
                    test="${orderdetail.checkOutDate > now and orderdetail.orders.status == true and orderdetail.checkInDate < now}">
                </c:if>
                <c:set var="roomAvailable" value="${roomAvailable + orderdetail.quantity }"></c:set>
            </c:forEach>
        </c:forEach>
        <ul class="list-group list-group-unbordered mb-3">
            <li class="list-group-item">
                <b>
                    <spring:message code="partner.hotel.rooms.partner" /></b> <a class="float-right">${ amountRoom}</a>
            </li>
            <li class="list-group-item">
                <b>
                    <spring:message code="partner.hotel.rooms.available" /></b> <a class="float-right">${amountRoom
                    -roomAvailable }</a>
            </li>
            <li class="list-group-item">
                <b>
                    <spring:message code="partner.hotel.rooms.service" /></b>
                <a class="float-right">
                    <c:forEach var="service" items="${hotel.serviceHotels }">
                        <c:if test="${service.startDate < now and  service.endDate > now and service.status == true}">


                            <span class="label label-danger"> ${service.service.name}</span>


                        </c:if>

                    </c:forEach>
                </a>
            </li>
        </ul>

        <a href="${pageContext.request.contextPath }/partnerManager/edit/${hotel.id}" class="btn btn-danger btn-block"><b>
            <i class="fas fa-edit"></i>  <spring:message code="button.update" /></b></a>
                <a href="${pageContext.request.contextPath }/roomManager/create/${hotel.id}" class="btn btn-primary btn-block"><b>
                    <i class="fas fa-plus"></i>   <spring:message code="button.addRoom" /></b></a>
    </div>
    <!-- /.card-body -->

</div>

<!-- About Me Box -->
<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title text-center">
            <spring:message code="partner.hotel.info" />
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">


        <h4><i class="fas fa-map-marker-alt mr-1"></i>
            <spring:message code="partner.hotel.location" />
        </h4>

        <p class="text-muted">${hotel.addressFull }</p>



        <hr>

        <h4><i class="fab fa-usps"></i>
            <spring:message code="partner.hotel.facilities" />
        </h4>

        <div>
            <c:if test="${hotel.wifi }">
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-wifi"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.wifi" /> </span>
                </div>
            </c:if>
            <c:if test="${hotel.parking }">
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fa fa-fw fa-car"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.parking" /> </span>
                </div>

            </c:if>
            <c:if test="${hotel.spa }">
                <div class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fa fa-fw fa-heart"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.spa" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.gym }">
                <div class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fa fa-fw fa-heartbeat"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.gym" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.carRental }">
                <div class="btn btn-primary btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fa fa-fw fa-car"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.carRental" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.airportTransfer }">
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fa fa-fw fa-plane"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.airportTransfer" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.freeBreakfast }">
                <div class="btn btn-warning btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-utensils"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.freeBreakfast" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.elevator }">
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-square"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.elevator" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.swimmingPool }">
                <div class="btn btn-info btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-swimmer"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.swimmingPool" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.receptionist }">
                <div class="btn btn-warning btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="far fa-user"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.receptionist" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.airConditioner }">
                <div class="btn btn-info btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-thermometer-empty"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.airConditioner" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.freeCancellation }">
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="far fa-window-close"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.freeCancellation" /></span>
                </div>

            </c:if>

            <c:if test="${hotel.assemblyFacilites }">
                <div class="btn btn-primary btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-users"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.assemblyFacilites" /></span>
                </div>

            </c:if>
            <c:if test="${hotel.driveway }">
                <div class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-bicycle"></i>
                    </span>
                    <span class="text">
                        <spring:message code="search.result.filter.driveway" /></span>
                </div>

            </c:if>


        </div>

    </div>
    <!-- /.card-body -->
</div>