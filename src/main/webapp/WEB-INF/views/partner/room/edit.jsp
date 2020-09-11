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

                                reader.onload = function(e) {
                                    $('#img-product').attr('src', e.target.result);
                                }
                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                        $(document).ready(() => {
                            var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
                            $('#avatarInput').on('change', function() {
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

                                filerdr.onload = function(e) {
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


                                <tag:hotel_info/>

                            </div>
                            <!-- /.col -->
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header p-2 text-center">
                                        <h3>Edit Room</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content ">

                                            <form:form method="POST" action="${pageContext.request.contextPath}/roomManager/${room.hotel.id}/edit/${room.id}" modelAttribute="room" enctype="multipart/form-data" class="p-5 contact-form" style="width: 100%;">


                                                <div class="form-group">
                                                    <label for="name">
                                    hotelname
                                </label>
                                                    <form:input path="name" class="form-control" />
                                                    <small style="color: red;">
                                    <form:errors path="name"></form:errors>
                                </small>
                                                </div>
                                                <div class="form-group">
                                                    <label for="bedType">bedType</label>
                                                    <form:select path="bedType" class="form-control" items="${bedTypes }" itemLabel="name" itemValue="id"></form:select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="bedType">roomCategory</label>
                                                    <form:select path="roomCategory" class="form-control" items="${roomCategories }" itemLabel="name" itemValue="id"></form:select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="bedType">roomType</label>
                                                    <form:select path="roomType" class="form-control" items="${roomTypes }" itemLabel="name" itemValue="id"></form:select>
                                                </div>
                                                <label for="price">price</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">$</span>
                                                    </div>
                                                    <form:input path="price" class="form-control" />
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">.00</span>
                                                    </div>
                                                 
                                                  
                                                </div>  <small style="color: red;">
                                                    <form:errors path="price"></form:errors>
                                                </small>
                                                <div class="form-group">
                                                    <label for="amountOfBed">
                                    amountOfBed
                                </label>
                                                    <form:input path="amountOfBed" class="form-control" />
                                                    <small style="color: red;">
                                    <form:errors path="amountOfBed"></form:errors>
                                </small>
                                                </div>

                                                <div class="form-group">
                                                    <label for="capacity">
                                    capacity
                                </label>
                                                    <form:input path="capacity" class="form-control" />
                                                    <small style="color: red;">
                                    <form:errors path="capacity"></form:errors>
                                </small>
                                                </div>

                                                <div class="form-group">
                                                    <label for="amountOfRoom">
                                    amountOfRoom
                                </label>
                                                    <form:input path="amountOfRoom" class="form-control" />
                                                    <small style="color: red;">
                                    <form:errors path="amountOfRoom"></form:errors>
                                </small>
                                                </div>

                                                <div class="form-check">
                                                    <form:checkbox path="status" class="form-check-input" />
                                                    <label class="form-check-label" for="status">Active</label>
                                                    <small style="color: red;">
                                    <form:errors path="status"></form:errors>
                                </small>
                                                </div>

                                                <div class="form-group">
                                                    <h5>Anh dai dien Phong</h5>
                                                    <br>
                                                    <div style="padding-bottom: 1em;">
                                                        <img src="${pageContext.request.contextPath }/uploads/images/rooms/${room.srcIcon}" style="width: auto; height: auto; max-width: 155px;min-width: 100px;min-height: 100px; " class="border border-primary" id="img-product">
                                                    </div>
                                                    <input type="file" class="form-control" id="avatarInput" name="file">
                                                    <small style="color: red;">
                                    <form:errors path="srcIcon"></form:errors>
                                </small>
                                                </div>
                                                <div class="form-group">
                                                    <h5>Anh Mo ta</h5>

                                                    <div class="row" id="image_preview" ">
                        

                    </div>
                    <input type="file" class="form-control" id="images" name="images[]" multiple />
                            
                            </div>
                            <div class="row">
                          
                                <div class="col-md-12" style="text-align: right; ">
                                    <form:hidden path="srcIcon"/>
                                    <form:hidden path="id"/>

                                    <button type="submit" class="btn btn-primary" id="btt">Cap nhat</button>
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