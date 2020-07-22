<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	$(document).ready(function () {
		$('#btCodeCheck').on("click", function () {
			$.ajax({
				type: 'GET',
				url: '${pageContext.request.contextPath}/booking/api/code',
				data: { valueCode: $('#codeCheck').val() },
				dataType: 'json',
				contentType: 'application/json',
				success: function (result) {
					$('#resultSale').text(result.sales);
					var finalPriceAfterSale = parseFloat('${finalPrice}') * (1 - (result.sales / 100));
					$('#finalPrice').text((Math.round((finalPriceAfterSale + Number.EPSILON) * 100) / 100));
					$('#codeSuccess').text(result.code);
					$('#giftCode').val(result.code);
					alert("thanh cong  ban duoc giam ");

				},
				error: function (err) {
					alert("deo nhe ");
				}

			});

		});
		$('#nameStayingView').on("change", function () {

			$('#nameStaying').val($(this).val());
		})
		$('#emailView').on("change", function () {

			$('#email').val($(this).val());
		})
		$('#noteView').on("change", function () {

			$('#note').val($(this).val());
		})
		$('#btnPayAtHotel').on("click", function(){
			$('#formPay').attr('action','${pageContext.request.contextPath }/booking').submit();
		})
		$('#btnPayPal').on("click", function(){
			$('#formPay').attr('action','${pageContext.request.contextPath }/user/pay').submit();
		})

	}
	);

</script>
<div style="padding-top: 5em; padding-bottom: 5em;">

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="card">
					<h5 class="card-header"><spring:message code="booking.detail" /></h5>
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col-2">
									<img src="${pageContext.request.contextPath }/uploads/images/rooms/${room.hotel.image}"
										style="width: 40px; height: 40px ; border-radius: 5pt;">
								</div>
								<div class="col-10">

									<p style="position: absolute;">
									<h5>${room.hotel.name} </h5>

									<span> <span style="color:blue; font-weight: bold;">$
											<fmt:formatNumber type="number" value="${room.price }" pattern="###,###" />
										</span>
										<spring:message code="hotel.pernight" />
									</span>

									</p>

								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-6 col-md-6">
									<span style="font-weight: bold;"><spring:message code="booking.room.name" /></span>
								</div>
								<div class="col-6 col-md-6">

									${room.name }
								</div>
								<div class="col-6 col-md-6">
									<span style="font-weight: bold;">
										<spring:message code="hotel.roomtype" /></span>
								</div>
								<div class="col-6 col-md-6">
									<c:choose>
										<c:when test="${room.roomType.name == 'single' }">
											<spring:message code="hotel.roomtype.single" />
										</c:when>
										<c:when test="${room.roomType.name == 'double' }">
											<spring:message code="hotel.roomtype.double" />
										</c:when>
										<c:when test="${room.roomType.name == 'team' }">
											<spring:message code="hotel.roomtype.team" />
										</c:when>
										<c:otherwise>
											<spring:message code="hotel.updating" />
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-6 col-md-6">
									<span style="font-weight: bold;"><spring:message code="hotel.bedtype" /></span>
								</div>
								<div class="col-6 col-md-6">
									<c:choose>
										<c:when test="${room.bedType.name  == 'single' }">
											<spring:message code="hotel.bedtype.single" />
										</c:when>
										<c:when test="${room.bedType.name  == 'double' }">
											<spring:message code="hotel.bedtype.queen" />
										</c:when>
										<c:when test="${room.bedType.name == 'double' }">
											<spring:message code="hotel.bedtype.double" />
										</c:when>
										<c:when test="${room.bedType.name == 'team' }">
											<spring:message code="hotel.bedtype.team" />
										</c:when>
										<c:otherwise>
											<spring:message code="hotel.updating" />
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<hr>



							<div class="row">

								<div class="col-6 col-md-6">
									<small style="font-weight: bold;"><spring:message code="search.checkin" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small>${checkin} | 14:00 </small>
								</div>


								<div class="col-6 col-md-6">
									<small style="font-weight: bold;"><spring:message code="search.checkout" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small>${checkout} | 12:00 </small>
								</div>
								<div class="col-6 col-md-6">
									<small style="font-weight: bold;"><spring:message code="booking.durationofstay" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small style="color: green;">${days } <spring:message code="booking.night" /></small>
								</div>
							</div>
							<div class="row">
								<div class="col-6 col-md-6">
									<small style="font-weight: bold;"><spring:message code="booking.quantity.room" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small style="color: green;">${roomquan }</small>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-6 col-md-6">
									<small style="font-weight: bold; color: green;"><spring:message code="booking.discount.hotel" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small style="color: green;">-
										${room.hotel.copponHotel.sale } %</small>
								</div>
							</div>
							<div class="row">
								<div class="col-6 col-md-6">
									<small style="font-weight: bold; color: green;"><spring:message code="booking.discount.room" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small style="color: green;">- ${room.copponRoom.sale == null ?0 :
										room.copponRoom.sale }
										%</small>
								</div>
							</div>
							<div class="row">
								<div class="col-6 col-md-6">
									<small style="font-weight: bold; color: green;"><spring:message code="booking.discount.code" /></small>
								</div>
								<div class="col-6 col-md-6">
									<small style="color: green;">-<span id="resultSale">
											0</span> % <span style="color: black;" id="codeSuccess"></span>
									</small>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-6 col-md-6">
									<h5 style="font-weight: bold; color: #2E64FE;"><spring:message code="booking.price.final" /></h5>

								</div>
								<div class="col-6 col-md-6">
									<h4 style="color: #2E64FE;">
										$<span id="finalPrice"> ${finalPrice}</span>
									</h4>


								</div>
							</div>

							<div class="input-group mb-2">
								<input type="text" class="form-control" id="codeCheck" name="giftcode"
									placeholder="Gift code">
								<div class="input-group-append">
									<button class="btn btn-success" id="btCodeCheck" type="button"><spring:message code="booking.code.update" /></button>

								</div>
							</div>
							<span style="color: red" id="resFail"></span>

						</div>



					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<!-- hotels -->
				<div class="card">
					<h5 class="card-header"><spring:message code="booking.info" /></h5>
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col-10">
									<label for="inputPassword5"><spring:message code="booking.contact.name" /> <span style="color: red">*</span></label>
									<input type="text" value="${user.fullname }" id="nameStayingView"
										class="form-control" name="namestaying" aria-describedby="nameHelpBlock"> <small
										id="nameHelpBlock" class="form-text text-muted"> <spring:message code="booking.contact.name.meta" /> </small>
								</div>
								<div class="col-10">
									<label for="inputPassword5">Email <span style="color: red">*</span></label>
									<input type="email" value="${user.email }" id="emailView" class="form-control"
										aria-describedby="emailHelpBlock">
									<small id="inputEmail" class="form-text text-muted">
										e.g.: email@example.com </small>
								</div>

								<div class="col-10">

									<div class="form-group">
										<label for="comment"><spring:message code="booking.contact.note" /></label>
										<textarea class="form-control" rows="5" id="noteView"
											placeholder='<spring:message code="booking.note" />'></textarea>
									</div>

								</div>


							</div>


						</div>
					</div>
				</div>
				<div class="card">
					<h5 class="card-header"><spring:message code="booking.payment.method" /></h5>
					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<form method="post" id="formPay">
								<input type="hidden" id="idRoom" value="${room.id}" name="idRoom" />
								<input type="hidden" id="checkIn_date" value="${checkin}" name="checkIn_date" />
								<input type="hidden" id="checkOut_date" value="${checkout}" name="checkOut_date" />
								<input type="hidden" id="rooms" value="${roomquan}" name="rooms" />
								<input type="hidden" id="nameStaying" value="${user.fullname}" name="nameStaying" />
								<input type="hidden" id="email" value="${user.email}" name="email" />
								<input type="hidden" id="note" name="note" />
								<input type="hidden" id="giftCode" name="giftCode" />
								
	
							</form>
							<button type="button" id="btnPayAtHotel" class="btn btn-info btn-lg" style="border-radius: 5%;">Pay at
								hotel</button>
						</div>
							<div class="col-md-3">	
								
									<img id="btnPayPal" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_200x51.png"
								alt="Check out with PayPal">
							
							</div>

						</div>
						

				

					</div>

				</div>
			</div>
		</div>
	</div>

</div>