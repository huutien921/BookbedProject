<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
  </script>

<script>
$(function($){
	
	$( "#address" ).autocomplete({
	  source: function( request, response ) {
		 
		  $.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath }/api/search/address',
				data : {
					key : $( "#address" ).val()
				},
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {
					response( $.grep( result, function( item ){
			              return item ;
			          }) );
				}
				
			});
	      }
	     
	});
});
$(function(){
	$('#rooms , #guests').bind('keypress', function(e){
		var keyCode = (e.which)?e.which:event.keyCode
		return !(keyCode>31 && (keyCode<48 || keyCode>57)); 
	});
	$('#rooms').on('change',function(){
		if(parseInt($(this).val()) >8 ){
			 $("#errmsgr").html("max 8").show().fadeOut("slow");
			$(this).val(8);
			
			}
		if(parseInt($(this).val()) ==0 ){
			$(this).val(1);
			}
		})
			$('#guests').on('change',function(){
		if(parseInt($(this).val()) >30 ){
			 $("#errmsgg").html("max 30").show().fadeOut("slow");
			$(this).val(30);
			
			}
		if(parseInt($(this).val()) ==0 ){
			$(this).val(1);
			}
		})
});

	$(document).ready(function() {
	$('.search-property-1 .form-control').on('change',function(){
			$(this).removeClass("red-border");
					});
		//link cho search
		$('#btSearch').on('click',function(){
			if(valFormSearch()){
				sessionStorage.setItem("page", 1);
				sessionStorage.removeItem("dataform");
			 location.href = "${pageContext.request.contextPath }/search/spec="+$('#address').val() + "." +$('#checkin_date').val()+"."+$('#checkout_date').val() +"."+$('#rooms').val()+"."+$('#guests').val() ;
					
				}});
			
//khong duoc dat truoc qua 1 nam
		$('.checkin_date').datepicker({
			dateFormat : 'dd-mm-yyyy',
			'autoclose' : true,
			startDate : '+1d',
			endDate : '+1y'

		});
	
	
		
		$('.checkout_date').prop('disabled', true);
		$('.checkin_date').on('change', function() {
			if ($(this).val() != '') {
				//reset lai datePicker checkout
				$('.checkout_date').datepicker("remove");
				$('.checkout_date').prop('disabled', false);
				var checkOutStart = new Date(toDate($(this).val()).setDate(toDate($(this).val()).getDate() +1));
				var checkOutEnd = new Date(toDate($(this).val()).setDate(toDate($(this).val()).getDate() +30));
				
				$('.checkout_date').datepicker({
					dateFormat : 'dd-mm-yyyy',
					'autoclose' : true,
					startDate : checkOutStart,
					endDate :  checkOutEnd

					}

				)
				
			} else {
				$('.checkout_date').prop('disabled', true);
				$('.checkout_date').val(null);
			}

		})

	});
	

	function toDate(dateStr) {
		  var parts = dateStr.split("/")
		  return new Date(parts[2], parts[0] - 1, parts[1])
		}
	//check validationm search
	function valFormSearch(){
		var address = $('#address').val();
		var checkin_date = $('#checkin_date').val();
		var checkout_date =$('#checkout_date').val();
		var rooms =$('#rooms').val();
		var guests =$('#guests').val();
		// kiem tra ngay tra phong lon hon ngay dat
		
		if(toDate(checkin_date).getTime() > toDate(checkout_date).getTime() ){
			 $('#checkout_date').addClass("red-border");
			 $('.checkout_date').val(null);
		    	return false;
			}
		switch ('')
		{
		    case address : {
		    	 $('#address').addClass("red-border");
		        return false;
		    }
		    case checkin_date : {
		    	 $('#checkin_date').addClass("red-border");
		    	return false;
		    }
		    case checkout_date : {
		    	 $('#checkout_date').addClass("red-border");
		    	return false;
		    }
		    case rooms : {
		    	 $('#rooms').addClass("red-border");
		    	return false;
		    }
		    case guests : {
		    	 $('#guests').addClass("red-border");
		    	return false;
		    }
		    default : {
		    	return true;
		    }
		}
		
		}
	 
</script>



<div class="hero-wrap js-fullheight"
	style="background-image: url('${pageContext.request.contextPath }/uploads/images/slide/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 text text-center ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
				<a href="https://vimeo.com/45830194"
					class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
					<span class="ion-ios-play"></span>
				</a>
				<p class="caps"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Travel
					to the any corner of the world, without going around in circles</p>
				<h1 data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Make
					Your Tour Amazing With Us</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-no-pb ftco-no-pt" >
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="search-wrap-1 ftco-animate p-4"  >
					<form action="#" class="search-property-1">
						<div class="row">
							<div class="col-lg align-items-end">

								<div class="form-group">
									<span class=" icon-map-marker"></span> <label for="#"><spring:message
											code="search.destination"></spring:message></label> <input
										type="text" class="form-control"  id="address"
										placeholder="<spring:message code="search.destination" ></spring:message>">
										
								</div>
							</div>
							<div class="col-lg align-items-end">
								<div class="form-group">
									<span class="ion-ios-calendar"></span> <label for="#"><spring:message
											code="search.checkin"></spring:message></label> <input type="text"
										class="form-control checkin_date" id="checkin_date"
										placeholder="mm/dd/yyyy">
								</div>
							</div>
							<div class="col-lg align-items-end">
								<div class="form-group">
									<span class="ion-ios-calendar"></span> <label for="#"><spring:message
											code="search.checkout"></spring:message></label> <input type="text" id="checkout_date"
										class="form-control checkout_date"
										placeholder="mm/dd/yyyy">

								</div>
							</div>
							<div class="col-lg align-items-end">
								<div class="form-group">
									<span class="ion-ios-people"></span> <label for="#"><spring:message
											code="search.guests"></spring:message> <span id="errmsgg" style="color: red"></span></label> <input id="guests"
										class="form-control" value="1" 
										placeholder="<spring:message code="search.guests.max"></spring:message>">
								</div>
							</div>
							<div class="col-lg align-items-end">
								<div class="form-group">
									<span class="ion-ios-home"></span> <label for="#"><spring:message
											code="search.rooms"></spring:message> <span id="errmsgr" style="color: red"></span></label> <input  id="rooms"
										class="form-control" value="1"
										placeholder="<spring:message code="search.rooms.max"></spring:message>">
										
								</div>
							</div>
							<div class="col-lg align-self-end">
								<div class="form-group">
									<div class="form-field">
										<input type="button" id="btSearch"
											value="<spring:message
											code="search.button"></spring:message>"
											class="form-control btn btn-primary">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section services-section bg-light">
	<div class="container">
		<div class="row d-flex">
			<div
				class="col-md-6 order-md-last heading-section pl-md-5 ftco-animate">
				<h2 class="mb-4">
					<spring:message code="home.payment.partners" />
				</h2>
				<p>
					<spring:message code="home.payment.content" />
				</p>

				<div class="row">
					<c:forEach var="pay" items="${partnersPayments }">
						<div class="col-md-4 col-6 d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services d-block">
								<div class="icon">
									<img alt=""
										src="${pageContext.request.contextPath }/uploads/images/payment/${pay.image}"
										style="max-height: 50px;">
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-6 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services d-block">
							<div class="icon">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/user/images/hotro.png">
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">
									<spring:message code="home.support.title" />
								</h3>
								<p>
									<spring:message code="home.support.content" />
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services d-block">
							<div class="icon">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/user/images/khachhang.png">
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">
									<spring:message code="home.guest.title" />
								</h3>
								<p>
									<spring:message code="home.guest.content" />
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services d-block">
							<div class="icon">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/user/images/giare.png">
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">
									<spring:message code="home.prices.title" />
								</h3>
								<p>
									<spring:message code="home.prices.content" />
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services d-block">
							<div class="icon">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/user/images/thanhtoan.png">
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">
									<spring:message code="home.payment.title" />
								</h3>
								<p>
									<spring:message code="home.payment.content" />
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center pb-4">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<h2 class="mb-4">
					<spring:message code="promotion.popular"></spring:message>
				</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach var="promotion" items="${promotions }">
				<div class="col-md-3 ftco-animate">
					<div class="project-destination">
						<a href="#" class="img"
							style="background-image: url(${pageContext.request.contextPath }/uploads/images/promotion/${promotion.src });">
							<div class="text">
								<h3 style="color: while;">
									<font style="background-color: #003300; border-radius: 5pt;">${promotion.code }</font>
								</h3>
								<span><spring:message code="promotion.discount" />
									${promotion.sales } % </span>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<section class="ftco-counter img" id="section-counter">
	<div class="container">
		<div class="row d-flex">
			<div class="col-md-6 d-flex">
				<div class="img d-flex align-self-stretch"
					style="background-image:url(${pageContext.request.contextPath}/uploads/images/about/about.jpg);"></div>
			</div>
			<div class="col-md-6 pl-md-5 py-5">
				<div class="row justify-content-start pb-3">
					<div class="col-md-12 heading-section ftco-animate">
						<h2 class="mb-4">Make Your Tour Memorable and Safe With Us</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in Bookmarksgrove right at the coast of the
							Semantics, a large language ocean.</p>
					</div>
				</div>
				<div class="row">
					<div
						class="col-md-4 justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center mb-4">
							<div class="text">
								<strong class="number" data-number="300">0</strong> <span>Successful
									Tours</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-4 justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center mb-4">
							<div class="text">
								<strong class="number" data-number="24000">0</strong> <span>Happy
									Tourist</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-4 justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center mb-4">
							<div class="text">
								<strong class="number" data-number="200">0</strong> <span>Place
									Explored</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center pb-4">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<h2 class="mb-4">
					<spring:message code="blog.news" />
				</h2>
			</div>
		</div>
		<div class="row d-flex">
			<c:forEach var="blog" items="${blogs }">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('${pageContext.request.contextPath }/uploads/images/blog/${blog.src }');">
						</a>
						<div class="text mt-3 float-right d-block">
							<div class="d-flex align-items-center mb-4 topp">
								<div class="one">
									<span class="day">21</span>
								</div>
								<div class="two">
									<span class="yr">2019</span> <span class="mos">August</span>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">${blog.title }</a>
							</h3>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
