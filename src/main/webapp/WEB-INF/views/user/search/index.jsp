<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/jquery-ui.css">
 
  <script src="${pageContext.request.contextPath }/resources/user/js/jquery-1.12.4.js"></script>
  <script src="${pageContext.request.contextPath }/resources/user/js/jquery-ui.js">
  </script>
<script>
	
var pagehotel = 12 ;

	function pagination(page , pagenum = null ) {
		var p = parseInt(sessionStorage.getItem("page"));
		if(isNaN(p)){
			p = 1;
			}
		if(page == "pageNex" ){
			if(pagenum == p){
				alert('You are on the last page !');
				}
			if(pagenum > p){
		
			sessionStorage.setItem("page", p  + 1 );
			location.reload()
			window.location.hash = '#searchR';}
			}else if (page == "pagePre" && p > 1 ){

				sessionStorage.setItem("page", parseInt(p) -1);
				location.reload();
				window.location.hash = '#searchR';
				}else if(Number.isInteger(page)) {

					sessionStorage.setItem("page",page);
					location.reload();
					window.location.hash = '#searchR';
					}
		
				

	}
	//3333
	function search_hotel(pageN) {
	var dataform = sessionStorage.getItem("dataform") == null ? JSON.stringify(getValFilter()) : sessionStorage.getItem("dataform") ;
		setValFilter(dataform);
		
		$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath }/api/search/price',
					data : dataform,
					dataType : 'json',
					contentType : 'application/json',
					success : function(result) {


						var resnum = result.length;
						resulthotels = result.length;
						$('#resultNumt').html(resnum);
						var numHotel = resnum;
						if(Math.ceil(resnum / pagehotel) > 5 ){
						 if(pageN == 3 ){
								$('#pageNum').html(pageNum(resnum, "top"));
								}else if ((Math.ceil(resnum / pagehotel) - pageN) == 2){
									$('#pageNum').html(pageNum(resnum, "end"));
									}else if(pageN > 3 && (Math.ceil(resnum / pagehotel) - pageN) > 2 ) {
										$('#pageNum').html(pageNum(resnum , parseInt(pageN)))}
									else{$('#pageNum').html(pageNum(resnum));}
						}else{
							$('#pageNum').html(pageNum(resnum));

							}
						$('#page' + pageN).addClass("active");

						var s = '';
						var start = pagehotel * pageN - pagehotel ;
						var end  = pagehotel * pageN ;
					
						if (end > resnum ){
							end = resnum;
							}
							var searchString1 = getUrl();
		var parts = searchString1.split(".");
						for (var i = start; i < end; i++) {
							s += '<div class="col-sm col-md-6 col-lg-4 ftco-animate fadeInUp ftco-animated"> <div class="room">';
							s += '<a href="${pageContext.request.contextPath }/hotel/detail?checkin_date='+parts[1]+'&checkout_date='+parts[2]+'&rooms='+parts[4]+'&idHotel='+result[i].id+'" class="img d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath }/uploads/images/rooms/'
									+ result[i].image + ');">';
							s += '<div class="icon d-flex justify-content-center align-items-center"><span class="icon-search2"></span></div>';
							s += '</a><div class="text p-3 text-center"><h3 class="mb-3"><a href="${pageContext.request.contextPath }/hotel/detail?checkin_date='+parts[1]+'&checkout_date='+parts[2]+'&rooms='+parts[4]+'&idHotel='+result[i].id+'">'
									+ result[i].name + '</a></h3>';
							s += '<p><span class="price mr-2">';
							if(result[i].priceCoppon != null){
								s += ' <span style="text-decoration: line-through; padding-right: 10px;">$ '
								s += Math.round(result[i].price) ;
								s += '</span>';
								s +=  '$'+ Math.round(result[i].priceCoppon) ;
								}else{
									s += '$'+ Math.round(result[i].price) ;

								}
							s += ' </span> <span class="per"><spring:message code="hotel.pernight" /></span></p>';
							s += '<ul class="list"><li>';
								for (var j = 0; j < result[i].starRatingNum; j++) {
							s += '<i class="fa fa-star" style="color: orange;"></i>';
																					}
							s +='</li><li>';
								if (result[i].prestige) {
							s += '<span style="color: blue;"><spring:message code="hotel.impressive" /></span>('+ result[i].comment +')';
																}else{
							s += '<span "><spring:message code="hotel.updating" /></span>('+ result[i].comment +')';
									
																}
							s += '</li><li><i class="fa fa-map-marker" style="color: #B1293E"></i> '+ result[i].ward +', ' + result[i].city+'</li></ul><hr>';
							s += '<p class="pt-1"><a href="${pageContext.request.contextPath }/hotel/detail?checkin_date='+parts[1]+'&checkout_date='+parts[2]+'&rooms='+parts[4]+'&idHotel='+result[i].id+'" class="btn-custom"><spring:message code="hotel.booknow" /> <spanclass="icon-long-arrow-right"></span></a></p></div></div></div>';
						
						}
						;

						$('#loading').hide();
						$('#notfound').hide();
						$('#resss2').html(s);

					},
					error : function(jqXHR) {
						if (jqXHR.status == 404) {
							$('#resultNumt').html('0');
							$('#loading').hide();
							$('#notfound').show();
							$('#resss2').html('');
							$('#pageNum').html('');
						}
						if (jqXHR.status == 400) {
							alert(JSON.stringify(jqXHR))
							location.href = "${pageContext.request.contextPath }/";

						}
					}
				});

	}

	$(document).ready(function() {

		//delete message validations 2222
		$('.sidebar-wrap .fields .form-control').on('change',function(){
			$(this).css("border","");
					});
		//link for search
		$('#btSearch').on('click',function(){
			if(valFormSearch()){
				sessionStorage.setItem("page", 1);
			 location.href = "${pageContext.request.contextPath }/search/spec="+$('#address').val() + "." +$('#checkin_date').val()+"."+$('#checkout_date').val() +"."+$('#rooms').val()+"."+$('#guests').val() ;
					
				}});
	
		var p = sessionStorage.getItem("page");
		
			search_hotel(p == null ? 1 : p);
			//not book  more 1 year
			$('.checkin_date').datepicker({
				dateFormat : 'dd-mm-yyyy',
				'autoclose' : true,
				startDate : '+1d',
				endDate : '+1y'
			});

			$('.checkout_date').prop('disabled', true);
			$('.checkin_date').on('change', function() {
			
			
				if ($(this).val() != '') {
					//reset lai datepicker checkout
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
	//xu ly ngay thang
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
		    	 $('#address').css("border","1px solid red");
		        return false;
		    }
		    case checkin_date : {
		    	 $('#checkin_date').css("border","1px solid red");
		    	return false;
		    }
		    case checkout_date : {
		    	 $('#checkout_date').css("border","1px solid red");
		    	return false;
		    }
		    case rooms : {
		    	 $('#rooms').css("border","1px solid red");
		    	return false;
		    }
		    case guests : {
		    	 $('#guests').css("border","1px solid red");
		    	return false;
		    }
		    default : {
		    	return true;
		    }
		}
		
		}
	//pagination
	function pageNum(resnum , caseP = null) {
		
		if(resnum < pagehotel ) 
			{return false;}
		
		page = resnum / pagehotel;
		pagemod = resnum % pagehotel;
		
		var p = '<li id="pagePre"><a onclick="pagination(' + "'pagePre'"
				+ ')" >&lt;</a></li>';
		if (page <= 5) {
			var i = 0;
			if (pagemod == 0) {
				i = 1;
			}
			for (var i; i <= page; i++) {
				p += '<li id="page' + (i + 1) + '"><a onclick="pagination('
						+ (i + 1)  +')" >' + (i + 1) + '</a></li>';
			}
			p += '<li id="pageNext"><a onclick="pagination(' + "'pageNex'"+ ',' + Math.ceil(page)
					+ ')">&gt;</a></li>';
			return p;
		} else {
			if(caseP == "top"){
				p += '<li id="page1" ><a   onclick="pagination(1)">1</a></li>';
				p += '<li id="page2"><a onclick="pagination(2)">2</a></li>';
				p += '<li id="page3"><a onclick="pagination(3)">3</a></li>';
				p += '<li><a>...</a></li>';
				p += '<li id="page'+Math.ceil(page - 1)+'" ><a onclick="pagination('+ Math.ceil(page - 1) + ')">' + Math.ceil(page - 1) + '</a></li>';
				p += '<li id="page'+Math.ceil(page)+'" ><a onclick="pagination('+ Math.ceil(page) + ')">' + Math.ceil(page) + '</a></li>';
				p += '<li id="pageNext"><a onclick="pagination(' + "'pageNex'"+ ',' + Math.ceil(page)
				+ ')">&gt;</a></li>';
				return p;
				}else
			if(caseP == "end") {
				p += '<li id="page1" ><a   onclick="pagination(1)">1</a></li>';
				p += '<li id="page2"><a onclick="pagination(2)">2</a></li>';
				p += '<li><a>...</a></li>';
				p += '<li id="page'+Math.ceil(page - 2)+'" ><a onclick="pagination('+ Math.ceil(page - 2) + ')">' + Math.ceil(page - 2) + '</a></li>';
				p += '<li id="page'+Math.ceil(page - 1)+'" ><a onclick="pagination('+ Math.ceil(page - 1) + ')">' + Math.ceil(page - 1) + '</a></li>';
				p += '<li id="page'+Math.ceil(page)+'" ><a onclick="pagination('+ Math.ceil(page) + ')">' + Math.ceil(page) + '</a></li>';
				p += '<li id="pageNext"><a onclick="pagination(' + "'pageNex'"+ ',' + Math.ceil(page)
				+ ')">&gt;</a></li>';
				return p;
				}else if(Number.isInteger(caseP)){
					
				p += '<li id="page1" ><a   onclick="pagination(1)">1</a></li>';
				p += '<li id="page2"><a onclick="pagination(2)">2</a></li>';
			
				p += '<li><a>...</a></li>';
				p += '<li id="page'+ caseP +'" ><a onclick="pagination('+ caseP + ')">' + caseP + '</a></li>';
				p += '<li><a>...</a></li>';
				p += '<li id="page'+Math.ceil(page - 1)+'" ><a onclick="pagination('+ Math.ceil(page - 1) + ')">' + Math.ceil(page - 1) + '</a></li>';
				p += '<li id="page'+Math.ceil(page)+'" ><a onclick="pagination('+ Math.ceil(page) + ')">' + Math.ceil(page) + '</a></li>';
				p += '<li id="pageNext"><a onclick="pagination(' + "'pageNex'"+ ',' + Math.ceil(page)
				+ ')">&gt;</a></li>';
				return p;
				}else{
					p += '<li id="page1" ><a   onclick="pagination(1)">1</a></li>';
					p += '<li id="page2"><a onclick="pagination(2)">2</a></li>';
					p += '<li><a>...</a></li>';
					p += '<li id="page'+Math.ceil(page - 1)+'" ><a onclick="pagination('+ Math.ceil(page - 1) + ')">' + Math.ceil(page - 1) + '</a></li>';
					p += '<li id="page'+Math.ceil(page)+'" ><a onclick="pagination('+ Math.ceil(page) + ')">' + Math.ceil(page) + '</a></li>';
					p += '<li id="pageNext"><a onclick="pagination(' + "'pageNex'"+ ',' + Math.ceil(page)
					+ ')">&gt;</a></li>';
					return p;
					}
			
				}
			
		
			
		}

	$(function(){


		$('#rooms , #guests ,#priceMin, #priceMax').bind('keypress', function(e){
			var keyCode = (e.which)?e.which:event.keyCode
			return !(keyCode>31 && (keyCode<48 || keyCode>57)); 
		});
		$('#priceMax').on('change',function(){
			if(parseInt($(this).val()) >10000 ){
				
				$(this).val(10000);
				
				}
			
			})
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
	function getUrl(){
		var pathname = $(location).attr('pathname');
		var uri_dec = decodeURIComponent(pathname);
		var searchString1 = uri_dec.replace('/search/spec=', '');
		return searchString1;

	}

	// get value form search

	function getValFilter(){
		//split url  
		
		var searchString1 = getUrl();
		var parts = searchString1.split(".");
		
		$('#address').val(parts[0]);
		$('#checkin_date').val(parts[1]);
		$('#checkout_date').val(parts[2]);
		$('#guests').val(parts[3]);
		$('#rooms').val(parts[4]);
		dataForm = {
			// info search base 
			address : parts[0],
			checkInDate :parts[1],
			checkOutDate :parts[2],
			guests :parts[3],
			rooms :parts[4],
			//price
			priceMin : $('#priceMin').val() == "" ? 0 : $('#priceMin').val(),
			priceMax : $('#priceMax').val() == ""  ? 10000 : $('#priceMax').val(),
			//sort
			sort : $("#sortForm input[name='sort']:checked").val() ==  null ? 'random' : $("#sortForm input[name='sort']:checked").val() ,
			// star
			star1 : $('#star1').is(":checked"),
			star2 : $('#star2').is(":checked"),
			star3 : $('#star3').is(":checked"),
			star4 : $('#star4').is(":checked"),
			star5 : $('#star5').is(":checked"),
			// facilities
			wifi : $('#wifi').is(":checked"),
			elevator : $('#elevator').is(":checked"),
			airConditioner : $('#airConditioner').is(":checked"),
			parking : $('#parking').is(":checked"),
			receptionist : $('#receptionist').is(":checked"),
			freeCancellation :  $('#freeCancellation').is(":checked"),
			spa : $('#spa').is(":checked"),
			gym :  $('#gym').is(":checked"),
			carRental : $('#carRental').is(":checked"),
			airportTransfer: $('#airportTransfer').is(":checked"),
			freeBreakfast : $('#freeBreakfast').is(":checked"),
			swimmingPool : $('#swimmingPool').is(":checked"),
			payAtHotel : $('#payAtHotel').is(":checked"),
			assemblyFacilites : $('#assemblyFacilites').is(":checked"),
			driveway : $('#driveway').is(":checked"),
			// type bed
			doubleBed : $('#doubleBed').is(":checked"),
			singleBed : $('#singleBed').is(":checked"),
			teamBed : $('#teamBed').is(":checked"),
		}
		return dataForm;
	}
	//set value form search 
	function setValFilter(text){
		var dataform = JSON.parse(text);
		//info search base
		$('#address').val(dataform.address);
		$('#checkin_date').val(dataform.checkInDate);
		$('#checkout_date').val(dataform.checkOutDate);
		$('#guests').val(dataform.guests);
		$('#rooms').val(dataform.rooms);
		//price
		$('#priceMin').val(dataform.priceMin);
		$('#priceMax').val(dataform.priceMax);
		//sort
			if (dataform.sort == "short"){$('#sortShort').prop("checked",true)}
			if (dataform.sort == "high"){$('#sortHigh').prop("checked",true)}
			if (dataform.sort == "common"){$('#common').prop("checked",true)}
			if (dataform.sort == "evaluateHigh"){$('#evaluateHigh').prop("checked",true)}

		//star
		dataform.star1 == true ? $('#star1').prop("checked", true) : $('#star1').prop("checked", false);
		dataform.star2 == true ? $('#star2').prop("checked", true) : $('#star2').prop("checked", false);
		dataform.star3 == true ? $('#star3').prop("checked", true) : $('#star3').prop("checked", false);
		dataform.star4 == true ? $('#star4').prop("checked", true) : $('#star4').prop("checked", false);
		dataform.star5 == true ? $('#star5').prop("checked", true) : $('#star5').prop("checked", false);

		/// facilities
		dataform.elevator == true ? $('#elevator').prop("checked", true) : $('#elevator').prop("checked", false);
		dataform.airConditioner == true ? $('#airConditioner').prop("checked", true) : $('#airConditioner').prop("checked", false);
		dataform.wifi == true ? $('#wifi').prop("checked", true) : $('#wifi').prop("checked", false);
		dataform.parking == true ? $('#parking').prop("checked", true) : $('#parking').prop("checked", false);
		dataform.receptionist == true ? $('#receptionist').prop("checked", true) : $('#receptionist').prop("checked", false);
		dataform.freeCancellation == true ? $('#freeCancellation').prop("checked", true) : $('#freeCancellation').prop("checked", false);
		dataform.spa == true ? $('#spa').prop("checked", true) : $('#spa').prop("checked", false);
		dataform.gym == true ? $('#gym').prop("checked", true) : $('#gym').prop("checked", false);
		dataform.carRental == true ? $('#carRental').prop("checked", true) : $('#carRental').prop("checked", false);
		dataform.airportTransfer == true ? $('#airportTransfer').prop("checked", true) : $('#airportTransfer').prop("checked", false);
		dataform.freeBreakfast == true ? $('#freeBreakfast').prop("checked", true) : $('#freeBreakfast').prop("checked", false);
		dataform.swimmingPool == true ? $('#swimmingPool').prop("checked", true) : $('#swimmingPool').prop("checked", false);
		dataform.payAtHotel == true ? $('#payAtHotel').prop("checked", true) : $('#payAtHotel').prop("checked", false);
		dataform.assemblyFacilites == true ? $('#assemblyFacilites').prop("checked", true) : $('#assemblyFacilites').prop("checked", false);
		dataform.driveway == true ? $('#driveway').prop("checked", true) : $('#driveway').prop("checked", false);
	
		// type bed
		dataform.doubleBed == true ? $('#doubleBed').prop("checked", true) : $('#doubleBed').prop("checked", false);
		dataform.singleBed == true ? $('#singleBed').prop("checked", true) : $('#singleBed').prop("checked", false);
		dataform.teamBed == true ? $('#teamBed').prop("checked", true) : $('#teamBed').prop("checked", false);

	}

	$(function($){
//resetFilter 
		$('#resetFilter').on('click',function(){
			//remove Session dataform
			sessionStorage.removeItem("dataform");
		
			sessionStorage.setItem("page",1);
			var text = {"priceMin":0,"priceMax":10000,"sort":"random","star1":false,"star2":false,"star3":false,"star4":false,"star5":false,"elevator":false,"airConditioner":false,"wifi":false,"parking":false,"receptionist":false,"freeCancellation":false,"spa":false,"gym":false,"carRental":false,"airportTransfer":false,"freeBreakfast":false,"swimmingPool":false,"payAtHotel":false,"assemblyFacilites":false,"driveway":false,"doubleBed":false,"singleBed":false,"teamBed":false};
			
			setValFilter(JSON.stringify(text));
			$( "#mySlider" ).slider( "values", 0 ,$('#priceMin').val());
			$( "#mySlider" ).slider( "values", 1 ,$('#priceMax').val());
			search_hotel(1);

		})

//ajax reload  1111
		$('#elevator, #airConditioner,#wifi, #parking , #receptionist ,#freeCancellation, #spa, #gym , #carRental, #airportTransfer ,#freeBreakfast , #swimmingPool , #payAtHotel, #assemblyFacilites , #driveway, #priceMin, #priceMax , #sortForm input, #star1 , #star2, #star3 , #star4 , #star5 ,#doubleBed ,#singleBed , #teamBed').on('change',function(){
			$('#loading').show();
			sessionStorage.setItem("dataform",JSON.stringify(getValFilter()) );
			sessionStorage.setItem("page",1);
			
		
			search_hotel(1);
			

		})



	//search price
	var dataSlider ;
	var p = sessionStorage.getItem("dataform") ;
		if(p!= null){
			h = JSON.parse(p);
			dataSlider =  [ parseInt(h.priceMin) , parseInt(h.priceMax)];
		}else{

		dataSlider =	[ 0, 10000 ];
		}
		
	    $( "#mySlider" ).slider({
			
	          range: true,
	          min: 0,
			  max: 10000,
			  step: 5,
	          values: dataSlider,
	          slide: function( event, ui ) {
	         $( "#priceMin" ).val(ui.values[ 0 ]);
			 $( "#priceMax" ).val(ui.values[ 1 ]);
			 },
			 change: function(event ,ui){
				sessionStorage.setItem("dataform",JSON.stringify(getValFilter()) );
				
				var p = sessionStorage.getItem("page");
		
			search_hotel(p == null ? 1 : p);

			 }
		  });
	
	     $( "#priceMin" ).val($( "#mySlider" ).slider( "values", 0 ));
		 $( "#priceMax" ).val($( "#mySlider" ).slider( "values", 1 ));
		//  set value to sidebar
		 $( "#priceMin" ).on('change',function(){
			$( "#mySlider" ).slider( "values", 0 ,$(this).val());	
		})
		 $( "#priceMax" ).on('change',function(){
			$( "#mySlider" ).slider( "values", 1 ,$(this).val());
		 })
		 
         //autocomplete address
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
</script>
<section class="ftco-section bg-light" id="searchR">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 sidebar">
				<p style="text-align: right;" class="ftco-animate">
				<a id="resetFilter" style="color:skyblue"><spring:message code="search.result.resetFilter" /></a>
				</p>
				<div class="sidebar-wrap bg-light ftco-animate">
					<h3 class="heading mb-4">
						<spring:message code="search.result.advanced" />
					</h3>
					<form action="#">
						<div class="fields">
						<div class="form-group">
								<input type="text" id="address"
									class="form-control" placeholder="Address">
							</div>
							<div class="form-group">
								<input type="text" id="checkin_date"
									class="form-control checkin_date" placeholder="Check In Date">
							</div>
							<div class="form-group">
								<input type="text" id="checkout_date"
									class="form-control checkout_date" placeholder="Check Out Date">
							</div>
							<div class="form-group">
								<input type="text" id="guests" class="form-control"
									placeholder="Guests">
							</div>
							<div class="form-group">
								<input type="text" id="rooms" class="form-control "
									placeholder="Rooms">
							</div>
							<div class="form-group">
								<input type="button" id="btSearch" value="Search"
									class="btn btn-primary py-3 px-5">
							</div>
						</div>
					</form>
				</div>
				<!--search price  2222-->
				<div class="sidebar-wrap bg-light ftco-animate">
					<h3 class="heading mb-4">
						<spring:message code="search.result.priceRange" />
					</h3>
					<form action="#">
						<div class="fields">
							<div class="form-group">
								<div class="range-slider" style="text-align: center;">
									<p>
										<span style="color: #fa4b2a;">$</span> <input type="text" id="priceMin"
											style="border: 0; color: #fa4b2a; font-weight: bold; max-width: 70px;"> -
											<span style="color: #fa4b2a;">$</span><input type="text" id="priceMax"
											style="border: 0; color: #fa4b2a; font-weight: bold; max-width:70px;">
									</p>
									<div id="mySlider"></div>

								</div>
							</div>

						</div>
					</form>
				</div>

				<!-- end  -->
				<!-- sort  -->
				<div class="sidebar-wrap bg-light ftco-animate">
					<h3 class="heading mb-4">
						<spring:message code="search.result.sortResults" />
					</h3>
					<form method="post" class="star-rating" id="sortForm">
						<div class="form-check">
							<input type="radio" class="form-check-input" name="sort" value="short"
								id="sortShort"> <label class="form-check-label" for="sortShort">
								<p class="rate">
									<span><spring:message code="search.result.lowestPrice" /></span>
								</p>

							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input" name="sort" value="high" id="sortHigh">
							<label class="form-check-label" for="sortHigh">
								<p class="rate">
									<span><spring:message code="search.result.highestPrice" /></span>
								</p>

							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input" name="sort" value="common" id="common"> 
							<label class="form-check-label" for="common">
								<p class="rate">
									<span><spring:message code="search.result.common" /></span>
								</p>

							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input" name="sort" value="evaluateHigh" id="evaluateHigh">
							<label class="form-check-label" for="evaluateHigh">
								<p class="rate">
									<span><spring:message code="search.result.highestPopularity" /></span>
								</p>

							</label>
						</div>
					</form>
				</div>
				<!-- end  -->
				<div class="sidebar-wrap bg-light ftco-animate">
					<h3 class="heading mb-4">
						<spring:message code="search.result.star" />
					</h3>
					<form method="post" class="star-rating">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" 
								id="star5"> <label class="form-check-label"
								for="star5">
								<p class="rate">
									<span><i class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star"></i></span>
								</p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input"
								id="star4"> <label class="form-check-label"
								for="star4">
								<p class="rate">
									<span><i class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star-o"></i></span>
								</p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" 
								id="star3"> <label class="form-check-label"
								for="star3">
								<p class="rate">
									<span><i class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star"></i><i class="icon-star-o"></i><i
										class="icon-star-o"></i></span>
								</p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" 
								id="star2"> <label class="form-check-label"
								for="star2">
								<p class="rate">
									<span><i class="icon-star"></i><i class="icon-star"></i><i
										class="icon-star-o"></i><i class="icon-star-o"></i><i
										class="icon-star-o"></i></span>
								</p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" 
								id="star1"> <label class="form-check-label"
								for="star1">
								<p class="rate">
									<span><i class="icon-star"></i><i class="icon-star-o"></i><i
										class="icon-star-o"></i><i class="icon-star-o"></i><i
										class="icon-star-o"></i></span>
								</p>
							</label>
						</div>
					</form>
				</div>
			<!-- facilities hotel -->
			<div class="sidebar-wrap bg-light ftco-animate">
				<h3 class="heading mb-4">
					<spring:message code="search.result.facilities" />
				</h3>
				<form method="post" class="star-rating">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="elevator"> <label class="form-check-label"
							for="elevator">
							<p class="rate">
								<span><spring:message code="search.result.filter.elevator" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="airConditioner"> <label class="form-check-label"
							for="airConditioner">
							<p class="rate">
								<span><spring:message code="search.result.filter.airConditioner" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="wifi"> <label class="form-check-label"
							for="wifi">
							<p class="rate">
								<span><spring:message code="search.result.filter.wifi" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="parking"> <label class="form-check-label"
							for="parking">
							<p class="rate">
								<span><spring:message code="search.result.filter.parking" /></span>
							</p>
						</label>
					</div>
				
					<div class="form-check">
						<input type="checkbox" class="form-check-input"
							id="gym"> <label class="form-check-label"
							for="gym">
							<p class="rate">
								<span><spring:message code="search.result.filter.gym" /></span>
							</p>
						</label>
					</div>
					
		
		
			<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="swimmingPool"> <label class="form-check-label"
					for="swimmingPool">
					<p class="rate">
						<span><spring:message code="search.result.filter.swimmingPool" /></span>
					</p>
				</label>
			</div>
	
			<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="assemblyFacilites"> <label class="form-check-label"
					for="assemblyFacilites">
					<p class="rate">
						<span><spring:message code="search.result.filter.assemblyFacilites" /></span>
					</p>
				</label>
			</div>
				<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="driveway"> <label class="form-check-label"
					for="driveway">
					<p class="rate">
						<span><spring:message code="search.result.filter.driveway" /></span>
					</p>
				</label>
			</div>
				</form>
			</div>
			<!-- end -->
			<!-- facilities hotel -->
			<div class="sidebar-wrap bg-light ftco-animate">
				<h3 class="heading mb-4">
					<spring:message code="search.result.service" />
				</h3>
				<form method="post" class="star-rating">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="receptionist"> <label class="form-check-label"
							for="receptionist">
							<p class="rate">
								<span><spring:message code="search.result.filter.receptionist" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="freeCancellation"> <label class="form-check-label"
							for="freeCancellation">
							<p class="rate">
								<span><spring:message code="search.result.filter.freeCancellation" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="spa"> <label class="form-check-label"
							for="spa">
							<p class="rate">
								<span><spring:message code="search.result.filter.spa" /></span>
							</p>
						</label>
					</div>
					
						<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="carRental"> <label class="form-check-label"
							for="carRental">
							<p class="rate">
								<span><spring:message code="search.result.filter.carRental" /></span>
							</p>
						</label>
					</div>
				
				<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="airportTransfer"> <label class="form-check-label"
					for="airportTransfer">
					<p class="rate">
						<span><spring:message code="search.result.filter.airportTransfer" /></span>
					</p>
				</label>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="freeBreakfast"> <label class="form-check-label"
					for="freeBreakfast">
					<p class="rate">
						<span><spring:message code="search.result.filter.freeBreakfast" /></span>
					</p>
				</label>
			</div>
			
			<div class="form-check">
				<input type="checkbox" class="form-check-input" 
					id="payAtHotel"> <label class="form-check-label"
					for="payAtHotel">
					<p class="rate">
						<span><spring:message code="search.result.filter.payAtHotel" /></span>
					</p>
				</label>
			</div>
		
				
				</form>
			</div>
			<!-- end -->
			<!-- bed type -->
			<div class="sidebar-wrap bg-light ftco-animate">
				<h3 class="heading mb-4">
					<spring:message code="search.result.bedType" />
				</h3>
				<form method="post" class="star-rating">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="doubleBed"> <label class="form-check-label"
							for="doubleBed">
							<p class="rate">
								<span><spring:message code="search.result.filter.doubleBed" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input"
							id="singleBed"> <label class="form-check-label"
							for="singleBed">
							<p class="rate">
								<span><spring:message code="search.result.filter.singleBed" /></span>
							</p>
						</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" 
							id="teamBed"> <label class="form-check-label"
							for="teamBed">
							<p class="rate">
								<span><spring:message code="search.result.filter.teamBed" /></span>
							</p>
						</label>
					</div>
				
				
				
				</form>
			</div>
			<!-- end  bed type-->
			</div>
			<div class="col-lg-9">
				<div class="row pad-20 ftco-animate">
					<div class="col-sm col-md-12 col-lg-12">
						<p style="text-align: right; color: blue; font-size: 18px;" class="ftco-animate">
							<span id="resultNumt" style="padding-right: 8pt;"></span><spring:message code="search.result.title" />
							</p>
						<div class="sort ">
							<!-- Search form -->
					
							<input class="form-control" type="text"
								placeholder="<spring:message code="search.result.form"/>"
								aria-label="Search">

						</div>
					</div>
				</div>
				<div style="width: 50%; margin: auto; text-align: center"
					id="loading">
					<i class="fa fa-spinner fa-spin fa-5x fa-fw"></i>
					<p>
						<spring:message code="search.result.loading" />
					</p>
				</div>
				<div
					style="width: 50%; margin: auto; display: none; text-align: center"
					class="ftco-animate" id="notfound">
					<img alt=""
						src="${pageContext.request.contextPath }/resources/user/images/notfound_hotel.png">
					<p>
						<spring:message code="search.result.notfound" />
					</p>
				</div>
				<div class="row" id="resss2"></div>
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul id="pageNum">

							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

