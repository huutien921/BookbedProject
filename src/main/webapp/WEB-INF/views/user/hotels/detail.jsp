<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script>
	function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++){
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}
	$(document).ready(function () {
		
		$('#btBookNow').on('click', function () {
			$('html, body').animate({
				scrollTop: parseInt($("#roomOur").offset().top - 40)
			}, 500);
		
		})
		$('.text .p-3 .text-center').tooltip();
		// load rooms ajax
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath }/hotel/room',
			data : {
				checkin_date : GetURLParameter('checkin_date'),
				checkout_date : GetURLParameter('checkout_date'),
				rooms : GetURLParameter('rooms'),
				idHotel : GetURLParameter('idHotel')

			},
			dataType : 'json',
			contentType : 'application/json',
			success : function(result){
			var s ='';
			for (var i = 0; i < result.length; i++) {

				s += '<div class="col-sm col-md-4 ftco-animate fadeInUp ftco-animated">';
			s += '<div class="room">';
			s += '<a href="" data-toggle="modal" data-target="#roomImages'+result[i].id+'" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/uploads/images/rooms/'+result[i].image+')">';
		
			s += '<div class="icon d-flex justify-content-center align-items-center">';
			s += '<span class="icon-search2"></span>';
			s += '</div> </a>';
			s += '<div class="text p-3 text-center">';
			s += '<h3 class="mb-3"><a href="rooms.html">'+result[i].name+'</a></h3>';
			if (result[i].sale != null ) {
				s += '<p><span class="price mr-2"> <span style="text-decoration: line-through; padding-right: 10px;">'+result[i].price+'</span> '+result[i].priceCoppon+' </span> <span class="per"><spring:message code="hotel.pernight" /></span></p>';
			}else{
				s += '<p><span class="price mr-2">'+result[i].price+'</span> <span class="per"><spring:message code="hotel.pernight" /></span></p>';
			}
			s += '<hr>';
			if (result[i].status) {
				s += '<p class="pt-1"><a data-toggle="modal" data-target="#roomImages'+result[i].id+'" class="btn-custom">Booking now </a></p>';
			}else{
				s += '<img style="max-height: 50px;" src="${pageContext.request.contextPath}/resources/user/images/sold-out2.png" />';
	
			}
				s += '</div></div></div>';
			s += '<div class="modal fade" id="roomImages'+result[i].id+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="display: none;">';
			s += '<div class="modal-dialog modal-dialog-centered modal-lg">';
			s += '<div class="modal-content">';
			s += '<div class="modal-header">';
			s += '<h5 class="modal-title" id="exampleModalLongTitle">'+result[i].name+'</h5>';
			s += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
			s += '<span aria-hidden="true"> × </span> </button></div>';
			s += '<div class="modal-body"><div class="row"><div class="col-md-8 col-sm"><div data-spy="scroll" data-offset="10" style="height: 400px; overflow-y: scroll; padding: 5px; border: 1px solid #ccc;">';
				for(j = 0 ; j < result[i].images.length ; j ++){
			s += '<img src="${pageContext.request.contextPath}/uploads/images/rooms/'+result[i].images[j]+'" style="width: 100%" alt="image '+result[i].name+'"><hr>';
				}
		
			s += '</div></div><div class="col-md-4 col-sm">';
			
			switch (result[i].roomType) {
				case "single":
				s += '<p><spring:message code="hotel.roomtype" />  : <span class="badge badge-primary"><spring:message code="hotel.roomtype.single" /> </span> </p> ';
					break;
					case "double":
				s += '<p><spring:message code="hotel.roomtype" /> : <span class="badge badge-primary"> <spring:message code="hotel.roomtype.double" /> </span> </p> ';
					break;
					case "team":
				s += '<p><spring:message code="hotel.roomtype" /> : <span class="badge badge-primary"> <spring:message code="hotel.roomtype.team" /> </span> </p> ';
					break;
				default:
					break;
			}
			switch (result[i].roomCategory) {
				case "vip":
				s += '<p><spring:message code="hotel.category" />  : <span class="badge badge-primary"> <spring:message code="hotel.category.vip" /> </span> </p> ';
					break;
					case "highclass":
				s += '<p><spring:message code="hotel.category" />  : <span class="badge badge-primary"> <spring:message code="hotel.category.highclass" /> </span> </p> ';
					break;
					case "common":
				s += '<p><spring:message code="hotel.category" />  : <span class="badge badge-primary"> <spring:message code="hotel.category.common" /> </span> </p> ';
					break;
				default:
					break;
			}
			s += '<p><spring:message code="hotel.bedsum" />  : <span class="badge badge-primary">'+result[i].amountOfBed+'</span> </p> ';
			switch (result[i].bedType) {
				case "single":
				s += '<p><spring:message code="hotel.bedtype" />  : <span class="badge badge-primary"> <spring:message code="hotel.bedtype.single" /></span> </p> ';
					break;
					case "queen":
				s += '<p><spring:message code="hotel.bedtype" />: <span class="badge badge-primary"><spring:message code="hotel.bedtype.queen" /></span> </p> ';
					break;
					case "double":
				s += '<p><spring:message code="hotel.bedtype" />   : <span class="badge badge-primary"> <spring:message code="hotel.bedtype.double" /> </span> </p> ';
					break;
					case "team":
				s += '<p><spring:message code="hotel.bedtype" />: <span class="badge badge-primary"> <spring:message code="hotel.bedtype.team" /></span> </p> ';
					break;
				default:
					break;
			}
			s += '<p><spring:message code="hotel.capacity" /> : <span class="badge badge-primary"> '+result[i].capacity+'</span> </p> ';
			s += '<hr/>';
			if (result[i].sale != null) {
				s += '<h3 style="color: green;">Sale '+parseInt(result[i].sale, 10)+' %</h3>';
				s += '<h5 style="text-decoration: line-through;">'+result[i].price+'<span>/night</span></h5>';
				s += '<h5 style="color: #2E64FE">'+result[i].priceCoppon+' <span>/night</span></h5>';
	}else{
		s += '<h5 style="color: #2E64FE">'+result[i].price+' <span>/night</span></h5>';
	}
		
			s += ' </div></div></div>';
			s += '<div class="modal-footer">';
			 if (result[i].status) {
				s +='<a href="${pageContext.request.contextPath}/booking?roomid='+result[i].id+'&checkin_date='+GetURLParameter("checkin_date")+'&checkout_date='+GetURLParameter('checkout_date')+'&rooms='+GetURLParameter("rooms")+'" class="btn btn-primary" ><spring:message code="hotel.payment.go" /> ></a></div>';
			 } else {
				 s +='<img src="${pageContext.request.contextPath}/resources/user/images/sold-out2.png" /></div>';
			 }
			
			s +='</div></div></div>';
			}
			
			$('#roomsHotel').html(s);
			}
			

		});
		
	})
	
</script>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-md-12 ftco-animate">

						<div class="single-slider owl-carousel">
							<c:forEach var="room" items="${hotel.rooms}">

								<div class="item">
									<div class="room-img"
										style="background-image: url(${pageContext.request.contextPath}/uploads/images/rooms/${room.srcIcon});">
									</div>
								</div>

							</c:forEach>
						</div>
					</div>

				</div>
			</div> <!-- .col-md-8 -->
			<div class="col-lg-4 sidebar ftco-animate">

				<div class="sidebar-box ftco-animate">
					<div class="categories">
						<h2>${hotel.name}</h2>
						<h3><i>
								<c:forEach var="star" begin="1" end="${ hotel.starRating.amount }" step="1">
									<i class="fa fa-star" style="color: orange;"></i>

								</c:forEach>
							</i>
							<c:set var="numstar" value="${ 0 }"></c:set>
							<c:forEach var="evaluate" items="${hotels.evaluates }">

								<c:set var="numstar" value="${ numstar + evaluate.numberOfStars }"></c:set>

							</c:forEach>
							<c:if test="${numstar/ evaluate.size() > 3.5 }">
								<span style="color: blue; padding-left: 15pt;"><spring:message code="hotel.impressive" /></span>

							</c:if>
						</h3>
						<p>
							<i class="fa fa-map-marker" style="color: #B1293E"> </i> ${hotel.addressFull }
						</p>


						<p>${hotel.description}</p>
						<button id="btBookNow" class="btn btn-primary"><spring:message code="hotel.chooseroom" /></button>
					</div>
				</div>


			</div>
		</div>
		<h3> <spring:message code="search.result.facilities" /></h3>
		<div class="row" style="padding-top: 15pt;" style="text-align: center;">
			<c:if test="${hotel.wifi == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/wifi.PNG" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.wifi" /></p>

					</div>
				</div>
			</c:if>
			<c:if test="${hotel.parking == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/transportation.PNG" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.parking" /></p>

					</div>
				</div>
			</c:if>
			<c:if test="${hotel.gym == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/gym.PNG" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.gym" /></p>

					</div>
				</div>
			</c:if>
			<c:if test="${hotel.swimmingPool == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/swimming-pool.png" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.swimmingPool" /></p>

					</div>
				</div>
			</c:if>
			<c:if test="${hotel.assemblyFacilites == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/Assemblyroom.png" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.assemblyFacilites" /></p>

					</div>
				</div>
			</c:if>
			<c:if test="${hotel.driveway == true }">
				<div class="col-md-2 col-4  ftco-animate" style="text-align: center;">
					<div class="media block-6 services d-block">

						<img alt="" src="/resources/user/images/way.PNG" style="max-height: 50px;">
						<p><spring:message code="search.result.filter.driveway" /></p>

					</div>
				</div>
			</c:if>

		</div>
		<p style="text-align: center; color: blue;" class="ftco-animate"><a data-toggle="modal"
				data-target="#exampleModal"> <spring:message code="hotel.facilities.more" /></a></p>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">${hotel.name}</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="modal-body">
							<div class="container">
								<div class="row">
									<div class="col-md-6">
										<h5><spring:message code="search.result.facilities" /></h5>
										<ul>
											<c:if test="${hotel.wifi == true }">
												<li><spring:message code="search.result.filter.wifi" /></li>
											</c:if>
											<c:if test="${hotel.parking == true }">
												<li><spring:message code="search.result.filter.parking" /></li>
											</c:if>
											<c:if test="${hotel.gym == true }">
												<li><spring:message code="search.result.filter.gym" /></li>
											</c:if>
											<c:if test="${hotel.swimmingPool == true }">
												<li><spring:message code="search.result.filter.swimmingPool" /></li>
											</c:if>
											<c:if test="${hotel.elevator == true }">
												<li><spring:message code="search.result.filter.elevator" /></li>
											</c:if>
											<c:if test="${hotel.receptionist == true }">
												<li><spring:message code="search.result.filter.receptionist" /></li>
											</c:if>
											<c:if test="${hotel.airConditioner == true }">
												<li><spring:message code="search.result.filter.airConditioner" /></li>
											</c:if>
											<c:if test="${hotel.assemblyFacilites == true }">
												<li><spring:message code="search.result.filter.assemblyFacilites" /></li>
											</c:if>
											<c:if test="${hotel.driveway == true }">
												<li><spring:message code="search.result.filter.driveway" /></li>
											</c:if>
										</ul>

									</div>
									<div class="col-md-6">
										<h5><spring:message code="search.result.service" /></h5>

										<ul>

											<c:if test="${hotel.spa == true }">
												<li><spring:message code="search.result.filter.spa" /></li>
											</c:if>
											<c:if test="${hotel.carRental == true }">
												<li><spring:message code="search.result.filter.carRental" /></li>
												<c:if test="${hotel.airportTransfer == true }">
													<li><spring:message code="search.result.filter.airportTransfer" /></li>
												</c:if>
												<c:if test="${hotel.freeBreakfast == true }">
													<li><spring:message code="search.result.filter.freeBreakfast" /></li>
												</c:if>
												<c:if test="${hotel.payAtHotel == true }">
													<li><spring:message code="search.result.filter.payAtHotel" /></li>
												</c:if>
												<c:if test="${hotel.freeCancellation == true }">
													<li><spring:message code="search.result.filter.freeCancellation" /></li>
												</c:if>

											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end Facilities -->
		<div id="roomOur">
			<h3 style="padding-top: 25pt;"><spring:message code="hotel.rooms" /></h3>
			<div class="row" id="roomsHotel" style="padding-top: 15pt; padding-bottom: 15pt;">
				
			</div>
		</div>
		<!-- end rooms our -->
		<div class="row">
			<div class="col-md-12 tour-wrap">
				<div class="pt-5">
					<h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;">${hotel.evaluates.size()} <spring:message code="hotel.review" /></h3>
					<ul class="comment-list">
						<c:forEach var="evaluate" items ="${hotel.evaluates}">
						<li class="comment">
							<div class="vcard bio">
								<img src="${pageContext.request.contextPath}/uploads/images/user/${evaluate.account.avatar}" alt="user">
							</div>
							<div class="comment-body">
								<h3> <small>
									<c:forEach var="star" begin="1"
								end="${ evaluate.numberOfStars }" step="1">
								<i class="fa fa-star" style="color: orange;"></i>
								</c:forEach>
										</small>
										
										</h3>
								<div class="meta"> ${evaluate.create } </div>
								<p>${evaluate.content}</p>
								
							</div>

							
						</li>
					</c:forEach>
					</ul>
					<!-- END comment-list -->

				</div>
			</div>
		</div>
		<!-- het -->
	</div>
</section> <!-- .section -->