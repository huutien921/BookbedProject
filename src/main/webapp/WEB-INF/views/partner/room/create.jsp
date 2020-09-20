<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" uri="hotel_tags" %>
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
    $(document).ready(() => {
        var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
        $('#avatarInput').on('change', function () {
            $('#img-product').attr('src', '');
            var file = this.files[0];

            var fileType = file["type"];

            if ($.inArray(fileType, validImageTypes) < 0) {
                alert('<spring:message code="error.image.type" />')
                $(this).val('');
            } else {
                readURL(this);

            }
        })
        //   check type image description

        $('#images').on('change', () => {

            $('#image_preview').html("");
            var imageList = document.getElementById("images").files;

            for (var i = 0; i < imageList.length; i++) {
                var file = imageList[i];
                var fileType = file["type"];
                if ($.inArray(fileType, validImageTypes) < 0) {
                    alert('<spring:message code="error.image.type" />')
                    $(this).val('');
                    $('#image_preview').html("");
                    $('#images').val("");
                    return false;
                }
            }
            var total_file = imageList.length;
            if (total_file > 12) {
                $('#image_preview')
                    .append(
                        "<span style='color :red ;'>Bạn chỉ đăng tối đa 12 ảnh</span>")
            } else {
                for (var i = 0; i < total_file; i++) {
                    $('#image_preview')
                        .append(
                            "<div style=' padding: 1em;' class='col-md-3'  id='img" + i + "'><img style='width: 120px ;display: block; margin-left: auto; margin-right: auto;; height: 115px;border-radius: 5px;border-color: #0033cc;'  src='" +
                            URL
                                .createObjectURL(event.target.files[i]) +
                            "'></div>");
                }
            }
        })
        // end
    })

    function show(input) {

        if (input.files && input.files[0]) {
            var filerdr = new FileReader();

            filerdr.onload = function (e) {
                $('#img-product').attr('src', e.target.result);
                $('#load').hide();
                $('#img-product').show();
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }
</script>
<style>
    div .btn {
        margin-bottom: 5px;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">


            <tag:hotel_info />

        </div>
        <!-- /.col -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header p-2 text-center">
                    <h3>
                        <spring:message code="form.r.info" />
                    </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content">

                        <form:form method="POST" action="${pageContext.request.contextPath}/roomManager/create/${idHotel}"
                            modelAttribute="room" enctype="multipart/form-data" class="p-5 contact-form"
                            style="width: 100%;">


                            <div class="form-group">
                                <label for="name">
                                    <spring:message code="form.r.name" />
                                </label>
                                <form:input path="name" class="form-control" />
                                <small style="color: red;">
                                    <form:errors path="name"></form:errors>
                                </small>
                            </div>
                            <div class="form-group">
                                <label for="bedType"><spring:message code="form.r.bedType" /></label>
                                <select id="bedType" name="bedType" class="form-control">
                                    <c:forEach var="bedType" items ="${bedTypes}">
                                        <option value="${bedType.id}" ${room.bedType.id == bedType.id ? 'selected' : ''}>
                                        <c:choose>
                                            <c:when test ="${bedType.name == 'single'}">
                                                <spring:message code="hotel.bedtype.single" />
                                            </c:when>
                                            <c:when test ="${bedType.name == 'queen'}">
                                                <spring:message code="hotel.bedtype.queen" />
                                            </c:when>
                                            <c:when test ="${bedType.name == 'team'}">
                                                <spring:message code="hotel.bedtype.team" />
                                            </c:when>
                                            <c:when test ="${bedType.name == 'double'}">
                                                <spring:message code="hotel.bedtype.double" />
                                            </c:when>
                                        </c:choose>
                                            
                                        
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="bedType"><spring:message code="form.r.roomCategory" /></label>
                                <select id="roomCategory" name="roomCategory" class="form-control">
                                    <c:forEach var="roomCategory" items ="${roomCategories}">
                                        <option value="${roomCategory.id}" ${room.roomCategory.id == roomCategory.id ? 'selected' : ''}>
                                        <c:choose>
                                            <c:when test ="${roomCategory.name == 'vip'}">
                                                <spring:message code="hotel.category.vip" />
                                            </c:when>
                                            <c:when test ="${roomCategory.name == 'highclass'}">
                                                <spring:message code="hotel.category.highclass" />
                                            </c:when>
                                            <c:when test ="${roomCategory.name == 'common'}">
                                                <spring:message code="hotel.category.common" />
                                            </c:when>
                                          
                                        </c:choose>
                                            
                                        
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="bedType"><spring:message code="form.r.roomType" /></label>
                                <select id="roomType" name="roomType" class="form-control">
                                    <c:forEach var="roomType" items ="${roomTypes}">
                                        <option value="${roomType.id}" ${room.roomType.id == roomType.id ? 'selected' : ''}>
                                        <c:choose>
                                            <c:when test ="${roomType.name == 'single'}">
                                                <spring:message code="hotel.roomtype.single" />
                                            </c:when>
                                            <c:when test ="${roomType.name == 'double'}">
                                                <spring:message code="hotel.roomtype.double" />
                                            </c:when>
                                            <c:when test ="${roomType.name == 'team'}">
                                                <spring:message code="hotel.roomtype.team" />
                                            </c:when>
                                          
                                        </c:choose>
                                            
                                        
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="price"><spring:message code="form.r.price" /></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <form:input path="price" class="form-control" />
                            </div>
                                <small style="color: red;">
                                    <form:errors path="price"></form:errors>
                                </small>
                           
                            <div class="form-group">
                                <label for="amountOfBed">
                                    <spring:message code="form.r.amountOfBed" />
                                </label>
                                <form:input path="amountOfBed" class="form-control" />
                                <small style="color: red;">
                                    <form:errors path="amountOfBed"></form:errors>
                                </small>
                            </div>

                            <div class="form-group">
                                <label for="capacity">
                                    <spring:message code="form.r.capacity" />
                                </label>
                                <form:input path="capacity" class="form-control" />
                                <small style="color: red;">
                                    <form:errors path="capacity"></form:errors>
                                </small>
                            </div>

                            <div class="form-group">
                                <label for="amountOfRoom">
                                    <spring:message code="form.r.amountOfRoom" />
                                </label>
                                <form:input path="amountOfRoom" class="form-control" />
                                <small style="color: red;">
                                    <form:errors path="amountOfRoom"></form:errors>
                                </small>
                            </div>

                            <div class="form-check">
                                <form:checkbox path="status" class="form-check-input" />
                                <label class="form-check-label" for="status"><spring:message code="form.r.status" /></label>
                                <small style="color: red;">
                                    <form:errors path="status"></form:errors>
                                </small>
                            </div>

                            <div class="form-group">
                                <h5><spring:message code="form.r.avatar" /></h5>
                                <br>
                                <div style="padding-bottom: 1em;">
                                    <img style="width: auto; height: auto; max-width: 155px;min-width: 100px;min-height: 100px; "
                                        class="border border-primary" id="img-product">
                                </div>
                                <input type="file" class="form-control" id="avatarInput" name="file">
                                <small style="color: red;">
                                    <form:errors path="srcIcon"></form:errors>
                                </small>
                            </div>
                            <div class="form-group">
                                <h5><spring:message code="form.r.imageRooms.add" /></h5>

                                <div class="row" id="image_preview">


                                </div>
                                <input type="file" class="form-control" id="images" name="images[]" multiple />

                            </div>
                            <div class="row">

                                <div class="col-md-12" style="text-align: right; ">
                                    <input type="hidden" name="idHotel" value="${idHotel}">
                                    <button type="submit" class="btn btn-primary" id="btt"><spring:message code="button.update" /></button>
                                </div>
                            </div>

                        </form:form>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>