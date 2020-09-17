<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" uri="hotel_tags" %>
<style>
    div .btn {
        margin-bottom: 5px;
    }
</style>
<script>
    $(document)
        .ready(
            function () {
                $("#dataTable tbody tr")
                    .on(
                        "click",
                        function (event) {

                            var id = $(this).find("td").eq(1)
                                .html();
                            $
                                .ajax({

                                    type: 'GET',
                                    url: '${pageContext.request.contextPath }/api/roomManager/images',
                                    data: {
                                        id: id
                                    },
                                    dataType: 'json',
                                    contentType: 'application/json',
                                    success: function (result) {
                                        s = '';
                                        for (var i = 0; i < result.length; i++) {
                                            s += ' <div class="col-md-3">';
                                            s += '<img class="img-description" id="' + result[i].id + '" onclick="modifiedImage(this)" src="${pageContext.request.contextPath }/uploads/images/rooms/' + result[i].src + '" alt="' + result[i].alt + '">';
                                            s += '</div>';
                                        }
                                        $('#result').html(s);

                                    }

                                });

                        });
                        //click load table
                      
                // image description 
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
                                s += '<img class="img-description" id="' + result[i].id + '" onclick="modifiedImage(this)" src="${pageContext.request.contextPath }/uploads/images/rooms/' + result[i].src + '" alt="' + result[i].alt + '">';
                                s += '</div>';
                            }

                            $('#result').html(s);
                            var mess = '<div class="alert alert-success alert-dismissible">';
                            mess += '<h4><i class="far fa-trash-alt"></i> Successfully deleted !</h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 3000)



                        },
                        error: function (err) {
                            var mess = '<div class="alert alert-warning alert-dismissible">';
                            mess += '<h4><i class="icon fa fa-warning"></i> Fail deleted !</h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 3000)
                        }

                    });
                })
                // discount room ajax post
                // set image description to avatar
                $("#modalImage .use-avatar").on('click', () => {
                    var load = '<div class="loading-card" id="loading"> <i class="fa fa-spinner fa-spin fa-5x fa-fw"></i>';
                    load += ' </div>';
                    $('#modalImage .modal-body').html(load);
                    var id = $('#idImgHidden').val();
                    
                    $.ajax({

                        type: 'GET',
                        url: '${pageContext.request.contextPath }/api/roomManager/updateToAvatar',
                        data: {
                            id : id
                        },
                        dataType: 'text',
                        contentType: 'application/json',
                        success: function (result) {
                            var mess = '<div class="alert alert-success alert-dismissible">';
                            mess += '<h4><i class="far fa-trash-alt"></i> Successfully Avatar !</h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 1500)
                            setTimeout(() => { location.reload() }, 3000)
                        },
                        error: function (err) {
                            var mess = '<div class="alert alert-warning alert-dismissible">';
                            mess += '<h4><i class="icon fa fa-warning"></i> Fail Update Avatar !</h4></div>'
                            $('#modalImage .modal-body').html(mess);
                            setTimeout(() => { $("#modalImage").modal('hide') }, 3000)
                        }

                    });
                })
                // end 
                $('#btRoom').on('click', function () {
                    $('.box-footer #btRoom i').css("display", '');
                    var data = JSON.stringify(getData());
                    $.ajax({

                        type: 'POST',
                        url: '${pageContext.request.contextPath }/api/roomManager/discount/create',
                        data: data,
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (result) {
                            $('.alert.alert-success').show();
                            $('.box-footer i').css("display", 'none');
                            var s = '';
                            for (var i = 0; i < result.length; i++) {
                                s += '<tr onclick="getDiscountRoom(' + result[i].id + ')" >';

                                s += '	<td>'
                                    + result[i].roomName
                                    + '</td>';
                                s += '	<td>'
                                    + result[i].discountName
                                    + '</td>';
                                s += '<td>'
                                    + Math
                                        .round(result[i].discountValue)
                                    + '% </td>';
                                if (result[i].status == true) {

                                    s += '<td> Active </td>';
                                }

                                else {
                                    s += '<td> Inactive</td>';
                                }

                                s += '</tr>'
                            }
                            $('#discountName')
                                .val('');
                            $('#discountValue')
                                .val('');
                                $('#discountNameErr')
                                .html('');
                            $('#discountValueErr')
                                .html('');
                            $('#status')
                                .prop(
                                    'checked',
                                    false);
                            $('#tbDiscountRoom tbody').html(s);

                        },
                        error: function (jqXHR) {
                            $('.alert').hide()
                            $('.alert.alert-warning').show();
                            $('.box-footer i').css("display", 'none');
                            var errs =  JSON.parse(jqXHR.responseText);
                            for(var i = 0 ; i < errs.length ; i++){

                            
                            if (errs[i].field == "discountName") {
                                if (errs[i].code == "required") {
                                    $('#discountNameErr').html('<spring:message code="default.required" />');
                                }else
                                if (errs[i].code == "length") {
                                    $('#discountNameErr').html('<spring:message code="default.length" />');
                                }

                            }
                            if (errs[i].field == "discountValue") {
                                if (errs[i].code == "required") {
                                    $('#discountValueErr').html('<spring:message code="default.required" />');
                                }else
                                if (errs[i].code == "percent") {
                                    $('#discountValueErr').html('<spring:message code="default.percent" />');
                                }

                            }
                            }

                        }



                    });
                    setTimeout(() => { $('.alert').hide() }, 6000)
                })
                // discount hotel ajax post
               
                $('#btHotel').on('click', function () {
                    $('.box-footer #btHotel i').css("display", '');
                    var data = JSON.stringify(getDataDiscountHotel());
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath }/api/hotelManager/discount/create',
                        data: data,
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (result) {
                           
                            $('.alert.alert-success').show();
                            $('.box-footer #btHotel i').css("display", 'none');
                            var s = '';
                          
                                s += '<tr onclick="getDiscountHotel(this)" >';

                             
                                s += '	<td>'
                                    + result.discountName
                                    + '</td>';
                                s += '<td> <span>'+ Math.round(result.discountValue)
                                    + '</span>% </td>';
                                  
                                if (result.status == true) {

                                    s += '<td> Active </td>';
                                }

                                else {
                                    s += '<td> Inactive</td>';
                                }

                                s += '</tr>';
                           
                            $('#discountNameHotel')
                                .val('');
                            $('#discountValueHotel')
                                .val('');
                                $('#discountNameHotelErr')
                                .html('');
                            $('#discountValueHotelErr')
                                .html('');

                            $('#statusHotel').prop(
                                    'checked',
                                    false);
                                   
                            $('#tbHotel > tbody').html(s);

                        },
                        error: function (jqXHR) {
                            $('.alert').hide()
                            $('.alert.alert-warning').show();
                            $('.box-footer #btHotel i').css("display", 'none');
                            var errs =  JSON.parse(jqXHR.responseText);
                            for(var i = 0 ; i < errs.length ; i++){

                            
                            if (errs[i].field == "discountName") {
                                if (errs[i].code == "required") {
                                    $('#discountNameHotelErr').html('<spring:message code="default.required" />');
                                }else
                                if (errs[i].code == "length") {
                                    $('#discountNameHotelErr').html('<spring:message code="default.length" />');
                                }

                            }
                            if (errs[i].field == "discountValue") {
                                if (errs[i].code == "required") {
                                    $('#discountValueHotelErr').html('<spring:message code="default.required" />');
                                }else
                                if (errs[i].code == "percent") {
                                    $('#discountValueHotelErr').html('<spring:message code="default.percent" />');
                                }

                            }
                            }

                        }



                    });
                    setTimeout(() => { $('.alert').hide() }, 6000)
                })
                // table click discount room
                $('#tbDiscountRoom  tbody  tr').on('click', function () {
                    var idRoom = $(this).find('td').eq(0).html();
                    $('#roomId').val(idRoom)
                    $('#discountName').val($(this).find('td').eq(2).html());
                    $('#discountValue').val($(this).find('td').eq(3).find('span').html());
                    var statusDiscount = $(this).find("td").eq(4).html();
                    if (statusDiscount == 'Active') {
                        $('#status').prop('checked', true);
                    } else {
                        $('#status').prop('checked', false);

                    }
                })

            });
    
    function getDiscountRoom(idRoom) {
        $.ajax({

            type: 'GET',
            url: '${pageContext.request.contextPath }/api/roomManager/discount/find',
            data: {
                idRoom: idRoom
            },
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                $('#roomId').val(result.id);
                $('#discountName').val(result.discountName);
                $('#discountValue').val(result.discountValue);
                $('#status').prop('checked', result.status);
            }
        });

    }
    // get data form discount room
    function getData() {
        dataForm = {
            id: $('#roomId').val(),
            discountName: $('#discountName').val(),
            discountValue: $('#discountValue').val(),
            status: $('#status').is(":checked")

        }
        return dataForm;
    }
    // get data form discount  hotel  
      function getDataDiscountHotel() {
        dataForm = {
            id: $('#hotelId').val(),
            discountName: $('#discountNameHotel').val(),
            discountValue: $('#discountValueHotel').val(),
            status: $('#statusHotel').is(":checked")

        }
        return dataForm;
    }
    //show modal modified image
    function modifiedImage(ent) {

        var s = '<img class="img-hotel-description" src="' + ent.src + '">'
        var id = ent.id;

        if (id == 'null') {

            $("#modalImage .delete").prop('disabled', true);
            $("#modalImage .use-avatar").prop('disabled', true);
        } else {
            $("#modalImage .delete").prop('disabled', false);
            $("#modalImage .use-avatar").prop('disabled', false);
            $('#idImgHidden').val(id);
        }
        $("#modalImage .modal-body").html(s);
        $("#modalImage").modal('show');

    }
    //set discount for form from table
    function getDiscountHotel(ent){
     $('#discountNameHotel').val($(ent).find("td").eq(0).html());
     $('#discountValueHotel').val($(ent).find("td").eq(1).find("span").html());
     $('#statusHotel').prop('checked', $(ent).find("td").eq(2).html() == 'Active'? true : false );
     alert(n)
    }

</script>
<div class="container-fluid">

    <!-- Modal -->
    <div class="modal fade" id="modalImage" tabindex="-1" role="dialog" aria-labelledby="modalImageTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalImageTitle">Change</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">

                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idImgHidden" />
                    <button type="button" class="btn btn-secondary delete"> <i class="far fa-trash-alt"></i></button>
                    <button type="button" class="btn btn-primary use-avatar"><i class="fas fa-cog"></i> use avatar for
                        hotel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">

            <tag:hotel_info />

        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="card">
                <div class="card-header p-2">
                    <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link active" href="#room" data-toggle="tab">Room</a></li>
                        <li class="nav-item"><a class="nav-link " href="#discount" data-toggle="tab">Discount</a></li>
                        <li class="nav-item"><a class="nav-link" href="#service" data-toggle="tab">My Service</a></li>
                    </ul>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="room">
                            <!-- rooms -->
                            <div class="box-body">
                                <table id="dataTable" class="table table-bordered table-hover table-center">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Amount Room</th>
                                            <th>Empty room</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="room" items="${hotel.rooms }">
                                            <c:set var="roomEmty" value="0"></c:set>
                                            <tr class="rows">
                                                <td><img class="img-hotel"
                                                        src="${pageContext.request.contextPath }/uploads/images/rooms/${room.srcIcon}">
                                                </td>
                                                <td>${room.id }</td>
                                                <td>${room.name}</td>
                                                <td>${room.price }</td>
                                                <td>${room.amountOfRoom }</td>
                                                <td>
                                                    <c:forEach var="orderdetail" items="${room.orderDetails }">
                                                        <c:if
                                                            test="${orderdetail.checkOutDate > now and orderdetail.orders.status == true and orderdetail.checkInDate < now and orderdetail.room.id == room.id}">
                                                        </c:if>
                                                        <c:set var="roomEmty"
                                                            value="${roomEmty + orderdetail.quantity }"></c:set>
                                                    </c:forEach> ${room.amountOfRoom - roomEmty}
                                                </td>
                                                <td>${room.status ? '
                                                    <p class="text-muted text-center" style="color: #0033cc ;"><i
                                                            class="fa fa-fw fa-check-square"></i></p>' : '
                                                    <p class="text-muted text-center" style="color: #ff0000 ;"><i
                                                            class="fa fa-fw fa-minus-square"></i></p>' }</td>
                                                <td> <a href="${pageContext.request.contextPath }/roomManager/${room.hotel.id}/edit/${room.id}"
                                                        class="btn  btn-primary">Edit
                                                    </a></td>
                                            </tr>


                                        </c:forEach>
                                    <tfoot>
                                        <tr>
                                            <th>Image</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Amount Room</th>
                                            <th>Empty room</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- end rooms -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Image description</h6>
                                </div>

                                <div class="row card-body" id="result">

                                </div>
                            </div>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane " id="discount">
                            <div class="alert alert-success alert-dismissible" style="display: none;"> <i
                                class="icon fa fa-check"></i>
                            Add discount successfully </div>
                        <div class="alert alert-warning alert-dismissible" style="display: none;"> <i
                                class="fas fa-exclamation">
                            </i> sorry ! Fail server </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">Coppon Room</h4>
                                    </div>

                                    <form role="form">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>Rooms Apply</label> <select id="roomId" required="required"
                                                    class="form-control " data-placeholder="Select a room">

                                                    <c:forEach var="room" items="${hotel.rooms }">
                                                        <option value="${room.id }">${room.name }</option>
                                                    </c:forEach>


                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="discountName">Discount name</label> <input type="text"
                                                    class="form-control" id="discountName" placeholder="Discount name">
                                                    <small class="error-form" id="discountNameErr"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="discountValue">Discount value (%)</label>
                                                <input type="text" class="form-control" id="discountValue"
                                                    placeholder="Discount value">
                                                    <small class="error-form" id="discountValueErr"></small>
                                            </div>

                                            <div class="checkbox">
                                                <label> <input id="status" type="checkbox">
                                                    Active now
                                                </label>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="button" id="btRoom" class="btn btn-primary"><i
                                                    style="display: none;"
                                                    class="fa fa-spinner fa-spin fa-1x fa-fw"></i> Submit</button>
                                            
                                        </div>
                                    </form>
                                    <table id="tbDiscountRoom" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Room</th>
                                                <th>Discount</th>
                                                <th>Value</th>
                                                <th>Status</th>

                                            </tr>
                                        </thead>
                                        <tbody>


                                            <c:forEach var="room" items="${ hotel.rooms}">
                                                <tr>
                                                    <td style="display: none;">${room.id }</td>
                                                    <td>${room.name }</td>
                                                    <td>${room.copponRoom.name }</td>
                                                    <td><span>${room.copponRoom.sale != null ? Math.round(room.copponRoom.sale) : 0} </span>%</td>
                                                    <td>${room.copponRoom.status ? 'Active' : 'Inactive' }</td>
                                                </tr>




                                            </c:forEach>




                                        </tbody>

                                        <tfoot>
                                            <tr>
                                                <th>Room</th>
                                                <th>Discount</th>
                                                <th>Value</th>
                                                <th>Status</th>

                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">Discount hotel</h4>

                                    </div>
                                  
                                    <form role="form">
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Discount name</label> <input type="text"
                                                    class="form-control" id="discountNameHotel"
                                                    value="" placeholder="Discount name">
                                                    <small class="error-form" id="discountNameHotelErr"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Discount value (%)</label>
                                                <input type="text" class="form-control" id="discountValueHotel"
                                                    placeholder="Discount value" value="">
                                                    <small class="error-form" id="discountValueHotelErr"></small>
                                            </div>

                                            <div class="checkbox">
                                                <label> <input id="statusHotel" ${hotel.copponHotel.status ? 'checked'
                                                        :''} type="checkbox">
                                                    Active now
                                                </label>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->

                                        <div class="box-footer">
                                            <button type="button" id="btHotel"   class="btn btn-primary"><i
                                                style="display: none;"
                                                class="fa fa-spinner fa-spin fa-1x fa-fw"></i> Submit</button>
                                         <input type="hidden" value="${hotel.id}" id="hotelId">
                                        </div>
                                    </form>
                                    <table id="tbHotel"  class="table table-bordered table-hover">
                                        <thead>
                                            <tr>

                                                <th>Discount</th>
                                               
                                                <th style="width: 40px">Value</th>
                                                <th>Status</th>
                                            </tr>

                                        </thead>

                                        <tbody>
                                            <c:if test="${hotel.copponHotel != null }">
                                                <tr onclick="getDiscountHotel(this)">

                                                    <td>${hotel.copponHotel.name }</td>
                                                   
                                                    <td><span>${Math.round(hotel.copponHotel.sale)} </span>%</td>
                                                    <td>${hotel.copponHotel.status ? 'Active' : 'Inactive' }</td>
                                                </tr>
                                            </c:if>
                                        </tbody>




                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.tab-pane -->

                        <div class="tab-pane" id="service">
                            aaa
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.card-body -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>