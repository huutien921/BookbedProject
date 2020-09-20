<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
    function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#img-product').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
  $(document).ready(()=>{
  
      $('#avatarInput').on('change', function () {
          $('#img-product').attr('src','');
    var file = this.files[0];
   
    var fileType = file["type"];
    var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
    if ($.inArray(fileType, validImageTypes) < 0) {
      alert('<spring:message code="error.image.type" />')
      $(this).val('');
    } else {
      readURL(this);
    
    }
  })     
  })
</script>
<div class="container-fluid">
    <div class="row block-9">
        <div class="col-md-6 order-md-last bg-white  d-flex mx-auto" style="border: 1px solid #d9dfe9;">
            <form:form method="POST" action="${pageContext.request.contextPath}/partnerManager/edit" modelAttribute="hotel" enctype="multipart/form-data"
                class="p-5 contact-form" style="width: 100%;">
                <h3><spring:message code="form.h.info" /></h3>

                <div class="form-group">
                    <label for="name">
                        <spring:message code="form.h.name" />
                    </label>
                    <form:input path="name" class="form-control" />
                    <small>
                        <form:errors path="name"></form:errors>
                    </small>
                </div>
                <div class="form-group">
                    <label for="starRating"><spring:message code="form.h.starRating" /></label>
                    <form:select path="starRating" class="form-control" items="${starRatings }" itemLabel="amount"
                        itemValue="id"></form:select>
                </div>
                <div class="form-group">
                    <label for="addressFull">
                        <spring:message code="form.h.addressFull" />
                    </label>
                    <form:input path="addressFull" class="form-control" />
                    <small>
                        <form:errors path="addressFull"></form:errors>
                    </small>
                </div>
                <div class="form-group">
                    <label for="ward">
                        <spring:message code="form.h.ward" />
                    </label>
                    <form:input path="ward" class="form-control" />
                    <small >
                        <form:errors path="ward"></form:errors>
                    </small>
                </div>

                <div class="form-group">
                    <label for="city">
                        <spring:message code="form.h.city" />
                    </label>
                    <form:input path="city" class="form-control" />
                    <small >
                        <form:errors path="city"></form:errors>
                    </small>
                </div>

                <div class="form-group">
                    <label for="provincial">
                        <spring:message code="form.h.provincial" />
                    </label>
                    <form:input path="provincial" class="form-control" />
                    <small >
                        <form:errors path="provincial"></form:errors>
                    </small>
                </div>

                <div class="form-group">
                    <label for="country">
                        <spring:message code="form.h.country" />
                    </label>
                    <form:input path="country" class="form-control" />
                    <small >
                        <form:errors path="country"></form:errors>
                    </small>
                </div>
                <h3 ><spring:message code="form.h.facilities" /></h3>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-check">
                            <form:checkbox path="wifi" class="form-check-input" />
                            <label class="form-check-label" for="wifi"><spring:message code="search.result.filter.wifi" /></label>
                            <small >
                                <form:errors path="wifi"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="parking" class="form-check-input" />
                            <label class="form-check-label" for="parking"><spring:message code="search.result.filter.parking" /></label>
                            <small >
                                <form:errors path="parking"></form:errors>
                            </small>
                        </div>

                        <div class="form-check">
                            <form:checkbox path="spa" class="form-check-input" />
                            <label class="form-check-label" for="spa"><spring:message code="search.result.filter.spa" /></label>
                            <small>
                                <form:errors path="spa"></form:errors>
                            </small>
                        </div>

                        <div class="form-check">
                            <form:checkbox path="gym" class="form-check-input" />
                            <label class="form-check-label" for="parking"><spring:message code="search.result.filter.gym" /></label>
                            <small>
                                <form:errors path="gym"></form:errors>
                            </small>
                        </div>

                        <div class="form-check">
                            <form:checkbox path="carRental" class="form-check-input" />
                            <label class="form-check-label" for="parking"><spring:message code="search.result.filter.carRental" /></label>
                            <small >
                                <form:errors path="carRental"></form:errors>
                            </small>
                        </div>

                        <div class="form-check">
                            <form:checkbox path="airportTransfer" class="form-check-input" />
                            <label class="form-check-label" for="airportTransfer"><spring:message code="search.result.filter.airportTransfer" /></label>
                            <small >
                                <form:errors path="airportTransfer"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="freeBreakfast" class="form-check-input" />
                            <label class="form-check-label" for="freeBreakfast"><spring:message code="search.result.filter.freeBreakfast" /></label>
                            <small >
                                <form:errors path="freeBreakfast"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="swimmingPool" class="form-check-input" />
                            <label class="form-check-label" for="swimmingPool"><spring:message code="search.result.filter.swimmingPool" /></label>
                            <small >
                                <form:errors path="swimmingPool"></form:errors>
                            </small>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="form-check">
                            <form:checkbox path="elevator" class="form-check-input" />
                            <label class="form-check-label" for="elevator"><spring:message code="search.result.filter.elevator" /></label>
                            <small >
                                <form:errors path="elevator"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="receptionist" class="form-check-input" />
                            <label class="form-check-label" for="receptionist"><spring:message code="search.result.filter.receptionist" /></label>
                            <small >
                                <form:errors path="receptionist"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="airConditioner" class="form-check-input" />
                            <label class="form-check-label" for="airConditioner"><spring:message code="search.result.filter.airConditioner" /></label>
                            <small >
                                <form:errors path="airConditioner"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="freeCancellation" class="form-check-input" />
                            <label class="form-check-label" for="freeCancellation"><spring:message code="search.result.filter.freeCancellation" /></label>
                            <small >
                                <form:errors path="freeCancellation"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="payAtHotel" class="form-check-input" />
                            <label class="form-check-label" for="payAtHotel"><spring:message code="search.result.filter.payAtHotel" /></label>
                            <small >
                                <form:errors path="payAtHotel"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="assemblyFacilites" class="form-check-input" />
                            <label class="form-check-label" for="assemblyFacilites"><spring:message code="search.result.filter.assemblyFacilites" /></label>
                            <small>
                                <form:errors path="assemblyFacilites"></form:errors>
                            </small>
                        </div>
                        <div class="form-check">
                            <form:checkbox path="driveway" class="form-check-input" />
                            <label class="form-check-label" for="assemblyFacilites"><spring:message code="search.result.filter.driveway" /></label>
                            <small>
                                <form:errors path="driveway"></form:errors>
                            </small>
                        </div>

                    </div>

                </div>



                <div class="form-group">
                    <h5 for="description">
                        <spring:message code="form.h.description" />
                    </h5>
                    <form:textarea path="description" cols="30" rows="7" class="form-control"></form:textarea>
                    <small>
                        <form:errors path="description"></form:errors>
                    </small>
                </div>
                <div class="form-group" >
           <h5><spring:message code="form.h.avatar" /></h5>
                    <br> 
                    <img style="width: auto; height: auto; max-width: 155px;min-width: 100px;min-height: 100px;" class="border border-primary"
                      id="img-product" src="${pageContext.request.contextPath}/uploads/images/rooms/${hotel.image}">
                  
                    <input type="file" class="form-control-file" id="avatarInput" style="padding-top: 1em;" name="file">
                    <small>
                        <form:errors path="image"></form:errors>
                    </small>
                </div>
                <div class="row">
                    <form:hidden path="id"></form:hidden>
                    <div class="col-md-12 button-right">
                            <button type="submit"
                            class="btn btn-primary"><spring:message code="button.update" /></button>
                        </div>
                </div>
            </form:form>
        </div>

    </div>
</div>