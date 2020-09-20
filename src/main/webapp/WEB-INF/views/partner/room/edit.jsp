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
        // image description delete
        $("#modalImage .delete").on('click', () => {
                    var load = '<div class="loading-card" id="loading"> <i class="fa fa-spinner fa-spin fa-5x fa-fw"></i>';
                    load += ' </div>';
                    $('#modalImage .modal-body').html(load);
                    var id = $('#idImgHidden').val();

                    $.ajax({

                        type: 'GET',
                        url: '${pageContext.request.contextPath }/api/roomManager/delete/image',
                        data: {
                            id: id
                        },
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (result) {
                            s = '';
                            for (var i = 0; i < result.length; i++) {
                                s += ' <div class="col-md-3">';
                                s += '<img class="img-description-edit" id="' + result[i].id + '" onclick="modifiedImage(this)" src="${pageContext.request.contextPath }/uploads/images/rooms/' + result[i].src + '" alt="' + result[i].alt + '">';
                                s += '</div>';
                            }

                            $('#result').html(s);
                            var mess = '<div class="alert alert-success alert-dismissible">';
                            mess += '<h4><i class="far fa-trash-alt"></i> S<spring:message code="default.message.success" /></h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 3000)



                        },
                        error: function (err) {
                            var mess = '<div class="alert alert-warning alert-dismissible">';
                            mess += '<h4><i class="icon fa fa-warning"></i> <spring:message code="default.message.error" /></h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 3000)
                        }

                    });
                })
                // end delete image description
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
    //show modal modified image
    function modifiedImage(ent) {

        var s = '<img class="img-hotel-description" src="' + ent.src + '">'
        var id = ent.id;
            $('#idImgHidden').val(id);
        
        $("#modalImage .modal-body").html(s);
        $("#modalImage").modal('show');

    }
</script>
<style>
    div .btn {
        margin-bottom: 5px;
    }
</style>
<div class="container-fluid">
    <!-- Modal -->
    <div class="modal fade" id="modalImage" tabindex="-1" role="dialog" aria-labelledby="modalImageTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalImageTitle"><spring:message code="partner.hotel.modal.change" /></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">

                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idImgHidden" />
                    <button type="button" class="btn btn-secondary delete"> <i class="far fa-trash-alt"></i></button>
                  
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">


            <tag:hotel_info />

        </div>
        <!-- /.col -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header p-2 text-center">
                    <h3><spring:message code="form.r.info" /></h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content ">

                        <form:form method="POST"
                            action="${pageContext.request.contextPath}/roomManager/${room.hotel.id}/edit/${room.id}"
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
                                <form:select path="bedType" class="form-control" items="${bedTypes }" itemLabel="name"
                                    itemValue="id"></form:select>
                            </div>
                            <div class="form-group">
                                <label for="bedType"><spring:message code="form.r.roomCategory" /></label>
                                <form:select path="roomCategory" class="form-control" items="${roomCategories }"
                                    itemLabel="name" itemValue="id"></form:select>
                            </div>
                            <div class="form-group">
                                <label for="bedType"><spring:message code="form.r.roomType" /></label>
                                <form:select path="roomType" class="form-control" items="${roomTypes }" itemLabel="name"
                                    itemValue="id"></form:select>
                            </div>
                            <label for="price"><spring:message code="form.r.price" /></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <form:input path="price" class="form-control" />
                                <div class="input-group-append">
                                    <span class="input-group-text">.00</span>
                                </div>


                            </div> <small style="color: red;">
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
                                    <img src="${pageContext.request.contextPath }/uploads/images/rooms/${room.srcIcon}"
                                        style="width: auto; height: auto; max-width: 155px;min-width: 100px;min-height: 100px; "
                                        class="border border-primary" id="img-product">
                                </div>
                                <input type="file" class="form-control" id="avatarInput" name="file">
                                <small style="color: red;">
                                    <form:errors path="srcIcon"></form:errors>
                                </small>
                            </div>
                            <!-- image description -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"> <spring:message code="form.r.imageRooms" /></h6>
                                </div>

                                <div class="row card-body" id="result">
                                    <c:forEach var="item" items="${room.imageRooms}">
                                        <div class="col-md-3"><img class="img-description-edit" id="${item.id}"
                                                src="${pageContext.request.contextPath }/uploads/images/rooms/${item.src}" onclick="modifiedImage(this)"
                                                alt="${item.alt}" /></div>
                                    </c:forEach>




                                </div>
                            </div>
                            <!-- end image description -->

                            <div class="form-group">
                                <h5><spring:message code="form.r.imageRooms.add" /></h5>

                                <div class="row" id="image_preview">


                                </div>
                                <input type="file" class="form-control" id="images" name="images[]" multiple />
                                <small style="color: red;">
                                    <form:errors path="imageRooms"></form:errors>
                                </small>
                            </div>
                            <div class="row">

                                <div class="col-md-12" style="text-align: right; ">
                                    <form:hidden path="srcIcon" />
                                    <form:hidden path="id" />

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