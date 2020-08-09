<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
$(document).ready(function(){

	setTimeout(function(){
		$('#message').hide();
	}, 10000);
	if (GetURLParameter("href")=="mail-pay") {
		$('#my_form').submit();
	} 

})

</script>
<div class="container-fluid" style="padding-top: 5em;padding-bottom: 5em;">
	
<div class="row justify-content-center" id="message">
<div class="col-md-6">	<c:if test="${ms == 'payok' }">

	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-check"></i><spring:message code="statusOrder.message.payok.title" />
		</h4>
		<spring:message code="statusOrder.message.payok.content" />
	</div>
</c:if>
		<c:if test="${ms == 'payfailed' }">

	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-check"></i><spring:message code="statusOrder.message.payfailed.title" />
		</h4>

		<spring:message code="statusOrder.message.payfailed.content" />
	</div>
</c:if>
<c:if test="${ms == 'pay'}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-warning"></i> <spring:message code="statusOrder.message.pay.title" />
		</h4>
		<spring:message code="statusOrder.message.pay.content" />
	</div>

</c:if>
<c:if test="${ms == 'ok' }">

	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-check"></i> <spring:message code="statusOrder.message.ok.title" />
		</h4>
		<spring:message code="statusOrder.message.ok.content" />
	</div>
</c:if>
<c:if test="${ms == 'failed'}">
	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-warning"></i> <spring:message code="statusOrder.message.ok.title" />
		</h4>
		<spring:message code="statusOrder.message.ok.content" />
	</div>

</c:if>

</div>

</div>
	<div class="row justify-content-center">
		
		<div class="col-md-10">
		
				<c:forEach var="orderdetai" items="${orderdetails }">

					<c:if test="${orderdetai.checkOutDate > now }">
							<div class="row container" style="background-color: #E6E6E6;">
								<div class="col-md-3 col-sm-6 " style="text-align: center;">
									<br> <img alt="room"
										src="${pageContext.request.contextPath }/uploads/images/rooms/${orderdetai.room.hotel.image}"
										style="max-width: 150px; max-height: 130px ; border-radius: 5pt;">
									<hr>
									 <h5 style="text-align: center;">
										${orderdetai.room.hotel.name }</h5>
									<h5>Code: <span style="font-weight: bold;">${orderdetai.orders.id}</span></h5>

								</div>
								<div class="col-md-3 col-sm-6">
									<br>
									<h4>
										<i class="fa fa-info" style="color: #2E64FE;"></i><spring:message code="statusOrder.info" />
									</h4>
									<hr>
									<p>
										<span style="font-weight: bold;"><spring:message code="booking.room.name" /></span> <span>${orderdetai.room.name }</span>
									</p>
									<span style="font-weight: bold;"><spring:message code="search.checkin" /></span> <span>${orderdetai.checkInDate}</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="search.checkout" /></span> <span>${orderdetai.checkOutDate}</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="booking.quantity.room" /></span> <span>${orderdetai.quantity}</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6">
									<br>
									<h4>
										<i class="fa fa-home" style="color: #58ACFA;"></i><spring:message code="statusOrder.room" />
									</h4>
									<hr>
									<p>
										<span style="font-weight: bold;"><spring:message code="hotel.category" /> </span> <span
											class="badge badge-info">
											<c:choose>
										<c:when test="${orderdetai.room.roomCategory.name == 'vip' }">
											<spring:message code="hotel.category.vip" />
										</c:when>
										<c:when test="${orderdetai.room.roomCategory.name  == 'highclass' }">
											<spring:message code="hotel.category.highclass" />
										</c:when>
										<c:when test="${orderdetai.room.roomCategory.name == 'common' }">
											<spring:message code="hotel.category.highclass" />
										</c:when>
									
										<c:otherwise>
											<spring:message code="hotel.updating" />
										</c:otherwise>
									</c:choose>
											</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="hotel.bedtype" /> </span> <span
											class="badge badge-secondary">
											<c:choose>
												<c:when test="${orderdetai.room.roomType.name  == 'single' }">
													<spring:message code="hotel.bedtype.single" />
												</c:when>
												<c:when test="${orderdetai.room.roomType.name  == 'double' }">
													<spring:message code="hotel.bedtype.queen" />
												</c:when>
												<c:when test="${orderdetai.room.roomType.name == 'double' }">
													<spring:message code="hotel.bedtype.double" />
												</c:when>
												<c:when test="${orderdetai.room.roomType.name == 'team' }">
													<spring:message code="hotel.bedtype.team" />
												</c:when>
												<c:otherwise>
													<spring:message code="hotel.updating" />
												</c:otherwise>
											</c:choose>
										</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="hotel.capacity" /> </span> <span
											class="badge badge-light">${orderdetai.room.capacity }</span>
									</p>
								</div>
								<c:set var="day"
									value="${orderdetai.checkOutDate.getTime() - orderdetai.checkInDate.getTime() }"></c:set>
								<div class="col-md-3 col-sm-6">
									<br>
									<h4>
										<i class="fa fa-check" style="color: #74DF00;"></i><spring:message code="statusOrder.payment" />
									</h4>
									<hr>
									<p>
										<span style="font-weight: bold;"><spring:message code="statusOrder.status" /></span>
										<c:if test="${orderdetai.orders.payment != 'payathotel'  }">
											<span class="badge badge-success"><spring:message code="statusOrder.payment.yes" /></span>
										</c:if>

										<c:if test="${orderdetai.orders.payment == 'payathotel' }">
											<span class="badge badge-danger"><spring:message code="statusOrder.payment.no" /></span>

											<form method="post" id="my_form"
												action="${pageContext.request.contextPath }/user/back/pay">
												<input type="hidden" value="${orderdetai.id }" name="idOrder">
												
												<img  src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-medium.png" alt="Check out with PayPal" onclick="document.getElementById('my_form').submit(); return false;"  />
											</form>

										</c:if>

									</p>
									<p>


										<span style="font-weight: bold;"><spring:message code="statusOrder.price" /></span> <span
											style="color: #0080FF; font-weight: bold; font-size: 15px">
											$ ${orderdetai.room.price * orderdetai.quantity * day/86400000 }
										</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="statusOrder.price.sale" /></span> <span
											style="color: #0080FF; font-weight: bold; font-size: 15px;">-
											$ 
											<c:set var="totalPrice" value="${orderdetai.room.price * orderdetai.quantity * day/86400000}"></c:set>
											<c:if test="${orderdetai.orders.sale != null}">
												<fmt:formatNumber type="number"
											value="${(totalPrice * ( orderdetai.room.copponRoom.sale + orderdetai.room.hotel.copponHotel.sale) /100) + (totalPrice * orderdetai.orders.sale.sales/100)  }
											" maxFractionDigits ="3" />
												
											</c:if>
											<c:if test="${orderdetai.orders.sale == null}">
												<fmt:formatNumber type="number"
											value="	${(totalPrice * ( orderdetai.room.copponRoom.sale + orderdetai.room.hotel.copponHotel.sale))/100 }
											" maxFractionDigits ="3" />
										
											</c:if>
											
										</span>
									</p>
									<p>
										<span style="font-weight: bold;"><spring:message code="statusOrder.price.final" /></span> <span
											style="color: #0431B4; font-weight: bold; font-size: 30px">$
											<c:if test="${orderdetai.orders.sale != null}">
												<fmt:formatNumber type="number"
											value="${(totalPrice * (1 - (orderdetai.room.copponRoom.sale + orderdetai.room.hotel.copponHotel.sale) /100)) *(1 - orderdetai.orders.sale.sales/100)  }
											" maxFractionDigits ="3" />
												
											</c:if>
											<c:if test="${orderdetai.orders.sale == null}">
												<fmt:formatNumber type="number"
											value="	${totalPrice * (1 - ( orderdetai.room.copponRoom.sale + orderdetai.room.hotel.copponHotel.sale)/100) }
											" maxFractionDigits ="3" />
										
											</c:if>
											</span>
									</p>

									<hr>
								</div>

							</div>
						
						<br>
					</c:if>

				</c:forEach>
			

		</div>
		
	</div>
	<!-- end status -->

	<h3 style="text-align: center;padding-top: 3em; padding-bottom: 1em;">
		<i class="fa fa-calendar" style="color: #BDBDBD;"></i><spring:message code="statusOrder.history" />
	</h3>
	<div class="row justify-content-center">
		
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-12" style="background-color: #E6E6E6;">
					<div class="container mt-3">
						
						<p><spring:message code="statusOrder.search" /></p>
						<input class="form-control" id="myInput" type="text"
							placeholder="Search.."> <br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th><spring:message code="statusOrder.hotel" /></th>
									<th><spring:message code="statusOrder.price" /></th>
									<th><spring:message code="search.checkin" /></th>
									<th><spring:message code="search.checkout" /></th>
									<th><spring:message code="statusOrder.status" /></th>
								</tr>
							</thead>
							<tbody id="myTable">

								<c:forEach var="orderdetai" items="${history }">
									<c:set var="day"
										value="${orderdetai.checkOutDate.getTime() - orderdetai.checkInDate.getTime() }"></c:set>
									<tr>

										<td>${orderdetai.room.hotel.name }</td>
										
										<td>$ ${orderdetai.orders.totalPrice}</td>
										<td>${orderdetai.checkInDate }</td>
										<td>${orderdetai.checkOutDate }</td>
										<td>
											<c:if test="${orderdetai.orders.status}">
											<span style="color: green;"><spring:message code="statusOrder.success" /></span>
										</c:if>
										<c:if test="${!orderdetai.orders.status}">
											<span style="color: red;"><spring:message code="statusOrder.error" /></span>
										</c:if>
									</td>
									</tr>
								</c:forEach>


							</tbody>
							<thead>
								<tr>
									<th><spring:message code="statusOrder.hotel" /></th>
									<th><spring:message code="statusOrder.price" /></th>
									<th><spring:message code="search.checkin" /></th>
									<th><spring:message code="search.checkout" /></th>
									<th><spring:message code="statusOrder.status" /></th>
								</tr>
							</thead>
						</table>


					</div>

					<script>
						$(document)
								.ready(
										function() {
											$("#myInput")
													.on(
															"keyup",
															function() {
																var value = $(
																		this)
																		.val()
																		.toLowerCase();
																$("#myTable tr")
																		.filter(
																				function() {
																					$(
																							this)
																							.toggle(
																									$(
																											this)
																											.text()
																											.toLowerCase()
																											.indexOf(
																													value) > -1)
																				});
															});
										});
					</script>
				</div>
			</div>
		</div>

	</div>

</div>